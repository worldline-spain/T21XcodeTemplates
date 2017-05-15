#Xcode Templates

This is a set of different template files intended to be used to create a common standard VIPER architecture.

## Install

Installing the template files into your Xcode it's a simple as executing the following makefile. Open a terminal and write down:

```
make install
```

The template files will be installed in the following directory:

```
~/Library/Developer/Xcode/Templates/File\ Templates/T21
```

## Available VIPER Templates

The available VIPER templates are:

### View

Creates a View swift class (representing a UIViewController) and its **.xib** file.

```swift
// MARK: - Protocol to be defined at Presenter
protocol ___FILEBASENAMEASIDENTIFIER___EventHandler:class
{
    func handleViewWillAppearEvent()
    func handleViewWillDisappearEvent()
}

// MARK: - ViewController Class must implement ViewModelsHandler Protocol to handle ViewModel from Presenter
class ___FILEBASENAMEASIDENTIFIER___ViewController: UIViewController, ___FILEBASENAMEASIDENTIFIER___ViewModelHandler
{
    //MARK: relationships
    var presenter: ___FILEBASENAMEASIDENTIFIER___EventHandler!
    
    
    //MARK: View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.handleViewWillAppearEvent()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.handleViewWillDisappearEvent()
    }
}

```

### Presenter


```swift
// MARK: - Protocol to be defined at Interactor
protocol ___FILEBASENAMEASIDENTIFIER___RequestHandler:class
{
    // func handle______Request()
}
// MARK: - Protocol to be defined at ViewController
protocol ___FILEBASENAMEASIDENTIFIER___ViewModelHandler:class
{
    //That part should be implemented with RxSwift.
}
// MARK: - Protocol to be defined at Wireframe
protocol ___FILEBASENAMEASIDENTIFIER___NavigationHandler:class
{
    // Include methods to present or dismiss
}

// MARK: - Presenter Class must implement Protocols to handle ViewController Events and Interactor Responses
class ___FILEBASENAMEASIDENTIFIER___Presenter: ___FILEBASENAMEASIDENTIFIER___EventHandler, ___FILEBASENAMEASIDENTIFIER___ResponseHandler {
    
    //MARK: relationships
    weak var viewController : ___FILEBASENAMEASIDENTIFIER___ViewModelHandler?
    var interactor : ___FILEBASENAMEASIDENTIFIER___RequestHandler!
    var wireframe : ___FILEBASENAMEASIDENTIFIER___NavigationHandler!
    
    //MARK: EventsHandler Protocol Implementation
    func handleViewWillAppearEvent() {
        
    }
    
    func handleViewWillDisappearEvent() {
        
    }
    
    //MARK: ResponseHandler Protocol Implementation
    
    //func handle_____Response() {}
       
}

```

### Interactor 


```swift
// MARK: - Protocol to be defined at Presenter
protocol ___FILEBASENAMEASIDENTIFIER___ResponseHandler: class
{
    // func handle______Response()
}

// MARK: - Presenter Class must implement RequestHandler Protocol to handle Presenter Requests
class ___FILEBASENAMEASIDENTIFIER___Interactor: ___FILEBASENAMEASIDENTIFIER___RequestHandler
{
    //MARK: Relationships
    weak var presenter : ___FILEBASENAMEASIDENTIFIER___ResponseHandler?
    
    
    //MARK: RequestHandler Protocol Implementation
    
    //func handle_____Request() {}

}
```

### Wireframe


```swift
// MARK: - Wireframe Class must implement RequestsHandler Protocol to handle Presenter Requests
class ___FILEBASENAMEASIDENTIFIER___Wireframe: ___FILEBASENAMEASIDENTIFIER___NavigationHandler
{
    weak var viewController : ___FILEBASENAMEASIDENTIFIER___ViewController? 
}
```

### Builder


```swift
class ___FILEBASENAMEASIDENTIFIER___Builder
{
    static func build() -> UIViewController {
        let viewController = ___FILEBASENAMEASIDENTIFIER___ViewController(nibName: "___FILEBASENAMEASIDENTIFIER___ViewController", bundle: nil)
        let presenter = ___FILEBASENAMEASIDENTIFIER___Presenter()
        let interactor = ___FILEBASENAMEASIDENTIFIER___Interactor()
        let wireframe = ___FILEBASENAMEASIDENTIFIER___Wireframe()
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.presenter = presenter
        wireframe.viewController = viewController
        
        _ = viewController.view //force loading the view to load the outlets
        return viewController
    }
}

```

### Module

It creates an entire VIPER module using the previous templates:

* View
* Presenter
* Interactor
* Wireframe
* Builder