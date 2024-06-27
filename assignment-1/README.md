# IOS Assignments

## Q1. Investigate and write down in detail which life cycle methods of App delegate and Scene delegate are invoked in following scenarios:

### App launch
* App Delegate

    1. ```application(_:didFinishLaunchingWithOptions:)``` called when the app is initially loaded when it is preparing to run. app is currently in inactive state.
    2. ```application(_didFinishLaunchingWithOptions:)``` : called when the app state is loaded but before any UI is presented
    3. ```applicationWillEnterForeground``` : called after ```didFinishLaunchingWithOptions``` is called.
    4. ```applicationDidBecomeActive``` : called after the last function when the application comes into the foreground

* Scene Delegate

    1. ```scene(_:willConnectTo:options:)``` will create a new window and make this window the key window to be displayed.
    2. ```sceneWillEnterForeground``` called when the app is just about to start
    3. ```sceneDidBecomeActive``` called right after the sceneWillEnterForeground function.

### App Background (Press iPhone home button)
* App delegate
    1. ```applicationWillResignActive``` runs when the application is about to become inactive.
    2. ```applicationDidEnterBackground``` runs when the application goes in the background.
* Scene delegate
    1. ```sceneWillResignActive``` runs when the scene is about to become inactive and stop responding to user events.
    2. ```sceneDidEnterBackground``` tells the delegate that the scene is no longer on the screen.

### Phone Locked
* App delegate
    1. ```applicationWillResignActive``` runs when the application is about to become inactive.
    2. ```applicationDidEnterBackground``` runs when the application goes in the background.
* Scene delegate
    1. ```sceneWillResignActive``` runs when the scene is about to become inactive and stop responding to user events.
    2. ```sceneDidEnterBackground``` tells the delegate that the scene is no longer on the screen.

### Simulate memory warning
* App delegate
    1. ```applicationDidReceiveMemoryWarning``` will be called.
* Scene delegate : No functions will be called for scene delegate.

### Kill app
* App delegate
    1. ```applicationWillTerminate```
* Scene delegate
    1. ```sceneDidDisconnect``` called when the user terminates the application.

## Q2. Investigate and write down in detail which life cycle methods of UIViewController are invoked in following scenarios:

### App launch
1. ```viewDidLoad``` called after the controller's view is loaded into memory.
2. ```viewWillAppear``` notifies the controller that its view is about to be displayed.
3. ```viewIsAppearing``` notifies the controller that its view is being added to a view hierarchy.
4. ```viewDidAppear``` notifies the controller that the view was added to a view hierarchy.
### App Background (Press iPhone home button)
### Phone Locked
### Simulate memory warning
1. ```didReceiveMemoryWarning``` called by system.
2. if view was not visible on screen then the view is released and ```viewDidUnload``` will be called.
### Kill app
1. ```viewWillDisappear```
2. ```viewDidDisappear```