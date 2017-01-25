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
protocol _NAME_ViewInterface : class
{
    //todo: add public methods from this view
}

protocol _NAME_ViewHandler
{
    //todo: add public events view handler (presenter) can receive.
    func viewWillAppear()
    func viewWillDisappear()
}

class _NAME_View: UIViewController, _NAME_ViewInterface, _NAME_ModuleRepresentation
{
    //MARK: VIPER relationships
    
    var presenter: _NAME_ViewHandler!
    
    //MARK: View Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.viewWillAppear()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        presenter.viewWillDisappear()
    }
    
    //MARK: Module representation
    
    func asViewController() -> UIViewController { return self }
    
    //MARK: View Interface
    
    
    //MARK: View Handler
    

    //MARK: View Private
    
}
```

### Presenter


```swift
class _NAME_Presenter: _NAME_ViewHandler, _NAME_InteractorHandler
{
    //MARK: VIPER relationships
    weak var view : _NAME_ViewInterface!
    var interactor : _NAME_InteractorInterface!
    var wireframe : _NAME_Wireframe!

    //MARK: View Handler
    
    func viewWillAppear() {
        //todo:
    }
    
    func viewWillDisappear() {
        //todo:
    }
    
    //MARK: Interactor Handler
    
}
```

### Interactor 


```swift
protocol _NAME_InteractorInterface
{
    //todo: add public request methods from this interactor
}

protocol _NAME_InteractorHandler : class
{
    //todo: add public responses for the interactor handler (presenter)
}

class _NAME_Interactor: _NAME_InteractorInterface
{
    //MARK: VIPER relationships
    weak var presenter : _NAME_InteractorHandler!
    
    //MARK: Interactor Interface
    
    //MARK: Interactor Private
    
}
```

### Wireframe


```swift
class _NAME_Wireframe
{
    weak var module : _NAME_ModuleRepresentation!
    
    //MARK: Wireframe public
    
    /*
     //example assuming the existence of a Detail module.
     func pushDetailModule() {
     module.asViewController().navigationController?.pushViewController(DetailBuilder.create().asViewController(), animated: true)
     }
     */
}
```

### Builder


```swift
protocol _NAME_ModuleRepresentation : class
{
    func asViewController() -> UIViewController
}

class _NAME_Builder
{
    static func create() -> _NAME_ModuleRepresentation {
        let vc = _NAME_View(nibName: "_NAME_View", bundle: nil)
        let presenter = _NAME_Presenter()
        let interactor = _NAME_Interactor()
        let wireframe = _NAME_Wireframe()
        
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        interactor.presenter = presenter
        wireframe.module = vc
        
        _ = vc.view //force loading the view to load the outlets
        return vc
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