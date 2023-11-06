//
//  ViewController.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/2.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(ViewCell.self), for: indexPath) as? ViewCell else {
            fatalError()
        }
        cell.title = modelArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nameText = modelArray[indexPath.item]
        switch nameText {
        case "MVC":
            self.navigationController?.pushViewController(MVCViewController(), animated: false)
        case "MVVM":
            self.navigationController?.pushViewController(MVVMViewController(), animated: false)
        case "Singleton":
            self.navigationController?.pushViewController(SingletonViewController(), animated: false)
        case "Delegate":
            self.navigationController?.pushViewController(DelegateViewController(), animated: false)
        case "Observer":
            self.navigationController?.pushViewController(ObserverViewController(), animated: false)
        case "Factory":
            self.navigationController?.pushViewController(FactoryViewController(), animated: false)
        case "Builder":
            self.navigationController?.pushViewController(BuilderViewController(), animated: false)
        case "Strategy":
            self.navigationController?.pushViewController(StrategyViewController(), animated: false)
        case "Command":
            self.navigationController?.pushViewController(CommandViewController(), animated: false)
        case "Adapter":
            self.navigationController?.pushViewController(AdapterViewController(), animated: false)
        default:
            break
        }
    }
    
    
    private let layout = UICollectionViewFlowLayout()
    
    private var collection: UICollectionView!
    
    private lazy var modelArray: [String] = {["MVC", "MVVM", "Singleton", "Delegate", "Observer", "Factory", "Builder", "Strategy", "Command", "Adapter"]}()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    private func setupView() {
        self.title = "Home"
        
        let kScrrenW = UIScreen.main.bounds.size.width
        let itemW = (kScrrenW - 60 - 32) / 2
        layout.itemSize = CGSize(width: itemW, height: 100)
        layout.minimumLineSpacing = 20.0
        layout.minimumInteritemSpacing = 20.0
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(collection)
        collection.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        collection.backgroundColor = .clear
        collection.delegate = self
        collection.dataSource = self
        collection.register(ViewCell.self, forCellWithReuseIdentifier: NSStringFromClass(ViewCell.self))
        collection.isScrollEnabled = false
    }

}

class ViewCell: UICollectionViewCell {
    
    private let titleLabel: UILabel = UILabel()
    
    var title: String? {
        didSet {
            if let title = title {
                titleLabel.text = title
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.cornerRadius = 10.0
        contentView.layer.masksToBounds = true
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        titleLabel.font = .systemFont(ofSize: 14.0, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
