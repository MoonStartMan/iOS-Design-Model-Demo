# iOS-Design-Model-Demo

<p align="center">
  <img src="https://img.shields.io/badge/Swift-5.0-orange.svg" alt="Swift 5.0">
  <img src="https://img.shields.io/badge/iOS-13.0+-blue.svg" alt="iOS 13.0+">
  <img src="https://img.shields.io/badge/Xcode-12.0+-brightgreen.svg" alt="Xcode 12.0+">
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="MIT License">
</p>

<p align="center">
  <b>iOS 设计模式学习与实践 | iOS Design Patterns</b>
</p>

<p align="center">
  <a href="#中文">中文</a> | <a href="#english">English</a>
</p>

---

<a name="中文"></a>
## 中文

### 项目简介

这是一个用于学习 iOS 设计模式的示例项目，包含常见设计模式的 Swift 实现和简单 Demo。设计模式是解决软件设计问题的经验总结，提供了一套可重用的解决方案，帮助开发者更好地组织和管理代码。

### 设计模式列表

| 模式 | 中文名 | 描述 | 状态 |
|------|--------|------|------|
| MVC | 模型-视图-控制器 | 分离数据、界面和控制逻辑 | ✅ |
| MVVM | 模型-视图-视图模型 | 在 MVC 基础上进一步解耦 | ✅ |
| Singleton | 单例模式 | 确保类只有一个实例 | ✅ |
| Delegate | 委托模式 | 对象间解耦和通信 | ✅ |
| Observer | 观察者模式 | 一对多依赖关系 | ✅ |
| Factory | 工厂模式 | 封装对象创建逻辑 | ✅ |
| Builder | 建造者模式 | 分离构建过程和表示 | ✅ |
| Strategy | 策略模式 | 算法封装和互换 | ✅ |
| Command | 命令模式 | 请求封装为对象 | ✅ |
| Adapter | 适配器模式 | 接口转换 | ✅ |

### 示例代码

#### 1. 单例模式 (Singleton)

```swift
class NetworkManager {
    // 共享实例
    static let shared = NetworkManager()
    
    // 私有初始化方法，防止外部创建实例
    private init() {}
    
    func fetchData(completion: @escaping (Result<Data, Error>) -> Void) {
        // 网络请求实现
    }
}

// 使用
NetworkManager.shared.fetchData { result in
    // 处理结果
}
```

#### 2. 委托模式 (Delegate)

```swift
// 定义协议
protocol DownloadDelegate: AnyObject {
    func downloadDidStart()
    func downloadDidProgress(_ progress: Double)
    func downloadDidComplete(_ data: Data)
    func downloadDidFail(_ error: Error)
}

// 下载管理器
class DownloadManager {
    weak var delegate: DownloadDelegate?
    
    func startDownload() {
        delegate?.downloadDidStart()
        // 下载逻辑...
    }
}

// 实现委托
class ViewController: UIViewController, DownloadDelegate {
    let downloadManager = DownloadManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadManager.delegate = self
    }
    
    func downloadDidStart() {
        print("下载开始")
    }
    
    func downloadDidProgress(_ progress: Double) {
        print("下载进度: \(progress)")
    }
    
    func downloadDidComplete(_ data: Data) {
        print("下载完成")
    }
    
    func downloadDidFail(_ error: Error) {
        print("下载失败: \(error)")
    }
}
```

#### 3. 观察者模式 (Observer)

```swift
// 使用 NotificationCenter
class UserManager {
    static let userDidLoginNotification = Notification.Name("userDidLoginNotification")
    
    func login() {
        // 登录逻辑
        NotificationCenter.default.post(
            name: UserManager.userDidLoginNotification,
            object: self,
            userInfo: ["userId": "12345"]
        )
    }
}

// 订阅通知
class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(handleUserLogin),
            name: UserManager.userDidLoginNotification,
            object: nil
        )
    }
    
    @objc func handleUserLogin(_ notification: Notification) {
        if let userId = notification.userInfo?["userId"] as? String {
            print("用户登录: \(userId)")
        }
    }
}
```

#### 4. 工厂模式 (Factory)

```swift
// 产品协议
protocol Animal {
    func makeSound()
}

// 具体产品
class Dog: Animal {
    func makeSound() {
        print("汪汪!")
    }
}

class Cat: Animal {
    func makeSound() {
        print("喵喵!")
    }
}

// 工厂类
class AnimalFactory {
    enum AnimalType {
        case dog
        case cat
    }
    
    static func createAnimal(_ type: AnimalType) -> Animal {
        switch type {
        case .dog:
            return Dog()
        case .cat:
            return Cat()
        }
    }
}

// 使用
let dog = AnimalFactory.createAnimal(.dog)
dog.makeSound() // 输出: 汪汪!
```

#### 5. MVC 模式

```swift
// Model
struct User {
    let id: String
    let name: String
    let email: String
}

// View
class UserProfileView: UIView {
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    
    func configure(with user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
    }
}

// Controller
class UserProfileViewController: UIViewController {
    private let userView = UserProfileView()
    private var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        loadUserData()
    }
    
    private func setupView() {
        view.addSubview(userView)
        // 布局代码...
    }
    
    private func loadUserData() {
        // 加载用户数据
        user = User(id: "1", name: "张三", email: "zhangsan@example.com")
        if let user = user {
            userView.configure(with: user)
        }
    }
}
```

### 技术栈

- **编程语言**: Swift 5.0+
- **开发环境**: Xcode 12.0+
- **最低支持系统**: iOS 13.0+
- **架构模式**: MVC, MVVM, 多种设计模式

### 安装和运行

```bash
git clone https://github.com/MoonStartMan/iOS-Design-Model-Demo.git
cd iOS-Design-Model-Demo
open iOS-Design-Model-Demo.xcodeproj
```

---

<a name="english"></a>
## English

### Introduction

This is a repository for self-understanding of iOS design patterns and simple demos. Design patterns are lessons learned from solving software design problems that provide a set of reusable solutions that help developers better organize and manage code.

### Design Patterns List

| Pattern | Description | Status |
|---------|-------------|--------|
| MVC | Separates data, UI and control logic | ✅ |
| MVVM | Further decoupled based on MVC | ✅ |
| Singleton | Ensures only one instance of a class | ✅ |
| Delegate | Decoupling and communication between objects | ✅ |
| Observer | One-to-many dependency relationship | ✅ |
| Factory | Encapsulates object creation logic | ✅ |
| Builder | Separates construction from representation | ✅ |
| Strategy | Encapsulates algorithms for interchangeability | ✅ |
| Command | Encapsulates request as an object | ✅ |
| Adapter | Converts interface to another expected interface | ✅ |

### Project Structure

```
iOS-Design-Model-Demo/
├── iOS-Design-Model-Demo.xcodeproj
├── iOS-Design-Model-Demo/
│   ├── Patterns/
│   │   ├── Singleton/
│   │   ├── Factory/
│   │   ├── Observer/
│   │   ├── Delegate/
│   │   ├── MVC/
│   │   ├── MVVM/
│   │   └── ...
│   └── Utils/
└── README.md
```

### Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 联系方式 | Contact

- GitHub: [@MoonStartMan](https://github.com/MoonStartMan)

<p align="center">如果这个项目对您有帮助，请给个 ⭐️ 支持一下！<br>If this project helps you, please give it a ⭐️!</p>
