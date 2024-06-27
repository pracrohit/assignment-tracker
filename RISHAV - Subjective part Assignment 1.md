# IOS-Assignments
## Assignment 1

## .1. Investigate and write down in detail which life cycle methods of App delegate and scene delegate are invoked in following scenarios: 

### a. App Launch
When the app is launched, the following methods are invoked:

**AppDelegate:**

**application(_:willFinishLaunchingWithOptions:)** – Called when the launch process is almost done, and the app is almost ready to run.
**application(_:didFinishLaunchingWithOptions:)** – Called when the app has finished launching and is about to enter the active state.
SceneDelegate:

**scene(_:willConnectTo:options:)** – Called when the system is connecting a scene session to the app.
**sceneDidBecomeActive(_:)** – Called when the scene has moved from an inactive state to an active state.

**b. App Background (Press iPhone home button)**
When the app is sent to the background, the following methods are invoked:

**AppDelegate:**

**applicationDidEnterBackground(_:)** – Called when the app enters the background.
SceneDelegate:

**sceneWillResignActive(_:)** – Called when the scene will move from an active state to an inactive state.
**sceneDidEnterBackground(_:)** – Called when the scene enters the background.


**c. Phone Locked (Lock Phone using simulator lock button)**
Locking the phone invokes these methods:

**AppDelegate:**

**applicationWillResignActive(_:)** – Called when the app is about to move from active to inactive state due to interruptions (such as incoming calls or SMS messages).
SceneDelegate:

**sceneWillResignActive(_:)** – Called when the scene will move from an active state to an inactive state.

**d. Simulate Memory Warning (Simulator option -> Debug -> Simulate memory warning)**
Simulating a memory warning triggers the following method:

**AppDelegate:**

**applicationDidReceiveMemoryWarning(_:)** – Called when the app receives a memory warning from the system.

**e. App Kill**
When the app is killed (either by the user or the system), the following methods are invoked:


## Q2. Investigate and write down in detail which life cycle methods of UIViewController are invoked in following scenarios: 

**a. App Launch**
When the app is launched and the initial view controller is displayed, the following UIViewController lifecycle methods are invoked:

**init(coder:) or init(nibName:bundle:)** – Called when the view controller is created.
**viewDidLoad()** – Called after the view controller has loaded its view hierarchy into memory. This is where you typically perform additional initialization and setup.
**viewWillAppear(_:)** – Called just before the view controller's view is about to be added to a view hierarchy and become visible.
**viewDidAppear(_:)** – Called after the view controller's view has been added to the view hierarchy and made visible.

**b. App Background (Press iPhone Home Button)**
When the app is sent to the background (e.g., by pressing the Home button), the following methods are invoked:

**applicationWillResignActive(_:) (AppDelegate)** – Not a UIViewController method, but relevant as it indicates the app is about to become inactive.
**applicationDidEnterBackground(_:) (AppDelegate)** – Indicates that the app has entered the background.
**viewWillDisappear(_:)** – Called when the view is about to disappear from the view hierarchy.
**viewDidDisappear(_:)** – Called after the view has disappeared from the view hierarchy.

**c. Phone Locked (Lock Phone Using Simulator Lock Button)**
Locking the phone triggers the following methods:

**applicationWillResignActive(_:) (AppDelegate)** – Indicates that the app is about to move from active to inactive state due to interruptions.
**viewWillDisappear(_:)** – Called when the view is about to disappear from the view hierarchy.
**viewDidDisappear(_:)** – Called after the view has disappeared from the view hierarchy.

**d. Simulate Memory Warning (Simulator option -> Debug -> Simulate Memory Warning)**
Simulating a memory warning triggers the following methods:

**didReceiveMemoryWarning()** – Called on the view controller when the app receives a memory warning from the system. This is where you should release any cache data, images, or other memory-intensive resources that can be recreated later.

**e. App Kill**
When the app is killed (either by the user or the system), the following methods are invoked:

**applicationWillTerminate(_:) (AppDelegate)** – Called when the app is about to terminate. This method is used to perform any final clean-up tasks. Note that this method is not called when the app is force-quit by the user from the app switcher.
**viewWillDisappear(_:)** – Called if the view is currently visible when the app is about to terminate.
**viewDidDisappear(_:)** – Called after the view has disappeared from the view hierarchy.


**AppDelegate:**

**applicationWillTerminate(_:)** – Called when the app is about to terminate. This method is not called when the app is killed by the user from the app switcher.

