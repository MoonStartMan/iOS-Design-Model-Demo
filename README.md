# iOS-Design-Model-Demo

## English

### Introduce

This is a repository for self-understanding of iOS design patterns and simple demos

### Details

Design patterns are lessons learned from solving software design problems that provide a set of reusable solutions that help developers better organize and manage code. Common design patterns in iOS development include: 

1. MVC (Model-View-Controller) pattern: It is used to separate the data, user interface and control logic of the application, making the code easier to maintain and expand. 

2. MVVM (Model-View-ViewModel) mode: Further decoupled on the basis of MVC, introducing a ViewModel between the view and the model, making the view more independent and testable. 

3. Singleton pattern: Ensures that a class has only one instance and provides a global access point, often used to manage shared resources and global state. 

4. Delegate mode: Delegate objects to distribute tasks to other objects to achieve decoupling and communication between objects. 

5. Observer (Observer) pattern: defines a one-to-many dependency relationship, when an object's state changes, all the objects that depend on it will be notified. 

6. Factory (factory) mode: Create objects through factory classes, encapsulate the creation logic of objects, and make the code more readable and maintainable. 

7. Builder pattern: Separate the building process of an object from its representation, so that the same building process can create different representations. 

8. Strategy pattern: Define a series of algorithms, encapsulate each algorithm so that they can be used interchangeably, so that the algorithm changes independently of the customers who use it. 

9. Command mode: Encapsulates the request into an object, decoupling the sender from the receiver, and supporting queuing, recording and revocation of the request. 

10. Adapter pattern: The interface of a class is converted into another interface expected by the client, so that incompatible classes can work together. 

The above are common design patterns in iOS development, each pattern has its own specific application scenarios and advantages, according to specific needs to choose the right pattern can improve the readability, maintainability and scalability of the code.

## 中文

### 介绍

这是一个关于iOS设计模式的自我理解以及简单Demo的仓库

### 详情

设计模式是一种解决软件设计问题的经验总结，它提供了一套可重用的解决方案，能够帮助开发人员更好地组织和管理代码。在iOS开发中，常用的设计模式包括：

1. MVC（Model-View-Controller）模式：用于将应用程序的数据、用户界面和控制逻辑分离，使代码更易于维护和扩展。

2. MVVM（Model-View-ViewModel）模式：在MVC的基础上进一步解耦，将视图和模型之间引入一个视图模型，使视图更加独立和可测试。

3. Singleton（单例）模式：确保一个类只有一个实例，并提供一个全局访问点，常用于管理共享资源和全局状态。

4. Delegate（委托）模式：通过委托对象将任务分发给其他对象，实现对象之间的解耦和通信。

5. Observer（观察者）模式：定义了一种一对多的依赖关系，当一个对象的状态发生改变时，所有依赖于它的对象都会得到通知。

6. Factory（工厂）模式：通过工厂类创建对象，将对象的创建逻辑封装起来，使代码更具可读性和可维护性。

7. Builder（建造者）模式：将对象的构建过程与表示分离，使得同样的构建过程可以创建不同的表示。

8. Strategy（策略）模式：定义一系列算法，将每个算法封装起来，使它们可以互换使用，从而使算法的变化独立于使用它的客户。

9. Command（命令）模式：将请求封装成对象，使发送者和接收者之间解耦，支持请求的排队、记录和撤销操作。

10. Adapter（适配器）模式：将一个类的接口转换成客户端所期望的另一个接口，使得原本不兼容的类可以一起工作。

以上是iOS开发中常用的设计模式，每种模式都有其特定的应用场景和优势，根据具体需求选择合适的模式可以提高代码的可读性、可维护性和可扩展性。