#Xcode Templates

This is a set of different template files intended to be used to create a common standard VIPER architecture.

## Install

Installing the template files into your Xcode it's a simple as executing the following .sh script. Open a terminal and write down:

```
./install.sh
```

The template files will be installed in the following directory:

```
~/Library/Developer/Xcode/Templates/File\ Templates/T21
```

## Uninstall

Uninstall the template files from your Xcode it's a simple as executing the following .sh script. Open a terminal and write down:

```
./uninstall.sh
```

## Available VIPER Templates

The available VIPER templates are:

### ViewController

Creates a ViewController swift class (representing a UIViewController) and its **.xib** file.

```swift

// MARK: - Protocol to be defined at ViewController
protocol ___VARIABLE_productName:identifier___ViewUpdatesHandler: class
{
    //That part should be implemented with RxSwift.
    //func updateSomeView()
}

// MARK: - ViewController Class must implement ViewModelHandler Protocol to handle ViewModel from Presenter
class ___VARIABLE_productName:identifier___ViewController: UIViewController, ___VARIABLE_productName:identifier___ViewUpdatesHandler
{
    //MARK: relationships
    var presenter: ___VARIABLE_productName:identifier___EventHandler!
    
    var viewModel: ___VARIABLE_productName:identifier___ViewModel {
        get {
            return presenter.viewModel
        }
    }
    
    //MARK: View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBindings()
    }
    
    func configureBindings() {
        //Add the ViewModel bindings here ...
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.handleViewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.handleViewWillDisappear()
    }
}

```

### ViewModel

```swift

struct ___VARIABLE_productName:identifier___ViewModel
{
    //var title = ""
}

```



### Presenter
```swift

// MARK: - Protocol to be defined at Presenter
protocol ___VARIABLE_productName:identifier___EventHandler: class
{
    var viewModel: ___VARIABLE_productName:identifier___ViewModel { get }
    
    func handleViewWillAppear()
    func handleViewWillDisappear()
}

// MARK: - Protocol to be defined at Presenter
protocol ___VARIABLE_productName:identifier___ResponseHandler: class
{
    // func somethingRequestWillStart()
    // func somethingRequestDidStart()
    // func somethingRequestWillProgress()
    // func somethingRequestDidProgress()
    // func somethingRequestWillFinish()
    // func somethingRequestDidFinish()
}

// MARK: - Presenter Class must implement Protocols to handle ViewController Events and Interactor Responses

class ___VARIABLE_productName:identifier___Presenter: ___VARIABLE_productName:identifier___EventHandler, ___VARIABLE_productName:identifier___ResponseHandler {
    
    //MARK: relationships
    weak var viewController: ___VARIABLE_productName:identifier___ViewUpdatesHandler?
    var interactor: ___VARIABLE_productName:identifier___RequestHandler!
    var wireframe: ___VARIABLE_productName:identifier___NavigationHandler!

    var viewModel = ___VARIABLE_productName:identifier___ViewModel()
    
    //MARK: EventsHandler Protocol
    func handleViewWillAppear() {
        //TODO:
    }
    
    func handleViewWillDisappear() {
        //TODO:
    }
    
    //MARK: ResponseHandler Protocol
    
    // func somethingRequestWillStart(){}
    // func somethingRequestDidStart(){}
    // func somethingRequestWillProgress(){}
    // func somethingRequestDidProgress(){}
    // func somethingRequestWillFinish(){}
    // func somethingRequestDidFinish(){}

}

```

### Interactor 


```swift

// MARK: - Protocol to be defined at Interactor
protocol ___VARIABLE_productName:identifier___RequestHandler: class
{
    // func requestSomething()
    // func requestUser(id:String)
}


// MARK: - Presenter Class must implement RequestHandler Protocol to handle Presenter Requests
class ___VARIABLE_productName:identifier___Interactor: ___VARIABLE_productName:identifier___RequestHandler
{
    //MARK: Relationships
    weak var presenter: ___VARIABLE_productName:identifier___ResponseHandler?
    
    //MARK: RequestHandler Protocol
    //func requestSomething(){}
}
```

### Wireframe


```swift

// MARK: - Protocol to be defined at Wireframe
protocol ___VARIABLE_productName:identifier___NavigationHandler: class
{
    // Include methods to present or dismiss
}

// MARK: - Wireframe Class must implement NavigationHandler Protocol to handle Presenter Navigation calls
class ___VARIABLE_productName:identifier___Wireframe: ___VARIABLE_productName:identifier___NavigationHandler
{
    weak var viewController: ___VARIABLE_productName:identifier___ViewController?
}

```
### Builder


```swift
class ___VARIABLE_productName:identifier___Builder
{
    static func build() -> UIViewController {
        let viewController = ___VARIABLE_productName:identifier___ViewController(nibName:String.init(describing: ___VARIABLE_productName:identifier___ViewController.self), bundle: nil)
        let presenter = ___VARIABLE_productName:identifier___Presenter()
        let interactor = ___VARIABLE_productName:identifier___Interactor()
        let wireframe = ___VARIABLE_productName:identifier___Wireframe()
        
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

* ViewController
* ViewModel
* Presenter
* Interactor
* Wireframe
* Builder

### Interaction between components

#### ViewController send Events to the Presenter
In order to handle this *__events__*, the **Presenter** must conform to the **EventsHandler** protocol.

The methods defined in this protocol must be defined like:

* func **handle**Event()
* func **handle**ViewWillAppear()
* func **handle**ViewDidAppear()

#### Presenter send Updates to View
In order to handle this *__updates__*, the **View** must conform to the **ViewUpdatesHandler** protocol.

The methods defined in this protocol must be defined like:

* func **update**View()
* func **update**SpinnerView(visible:Bool)


#### Presenter Request something to the Interactor

In order to handle this *__requests__*, the **Interactor** must conform to the **RequestsHandler** protocol.

The methods defined in this protocol must be defined like:

* func **request**Something()
* func **request**User(id:String)

#### Interactor Response something to the Presenter

In order to handle this *__responses__*, the **Presenter** must conform to the **ResponsesHandler** protocol.

The methods defined in this protocol must be defined like:

* func something**RequestWillStart**()
* func something**RequestDidStart**()
* func something**RequestWillProgress**(status:String)
* func something**RequestDidProgress**(percentage: int)
* func something**RequestWillFinish**()
* func something**RequestDidFinish**()


