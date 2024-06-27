# assignment-tracker
Assignment feedbacks
Assignment - 1
1. Investigate and write down in detail which life cycle methods of App delegate and scene delegate are invoked in following scenarios: 
    App delegation:
a. App launch:
Methods Invoked:’application(_:didFinishLaunchingWithOptions:): Called when the app finished launching. This is where initial setup and configuration should occur.
      b. App background (Press iPhone home button) :
      Methods Invoked:
applicationDidEnterBackground(_:): Called when the app enters the background state. Use this method to release shared resources, save user data, invalidate timers, and pause ongoing tasks.
applicationWillResignActive(_:): Called just before the app is moved from active to inactive state. Here you can pause ongoing tasks or disable timers.
      c. Phone locked (Lock Phone using simulator lock button) :
      Methods Invoked:
applicationDidEnterBackground(_:): Similar to pressing the home button, locking the phone triggers the app to enter the background state.

d. Simulate memory warning (Simulator option -> Debug -> Simulate memory warning)(or shortcut: Shift+cmd+M) 
Methods Invoked:
applicationDidReceiveMemoryWarning(_:): Called when the system sends a memory warning to the app. Use this method to free up memory and release any resources that can be recreated.
      e. App kill :
      Methods Invoked:
applicationWillTerminate(_:): Called when the app is about to terminate. This method is not called if the app is suspended.
scene delegation:
              a. App launch:
Methods Invoked:scene(_:willConnectTo:options:): Called when a new scene session is being created and the scene is about to connect to the session. This is where you should configure the initial interface for the scene.

      b. App background (Press iPhone home button) :
      Methods Invoked:
sceneWillResignActive(_:): Called when the scene is about to move from an active to an inactive state.
      c. Phone locked (Lock Phone using simulator lock button) :
      Methods Invoked:
sceneDidEnterBackground(_:): Called when the scene enters the background. This is similar to applicationDidEnterBackground(_:) but specific to scenes.
d. Simulate memory warning (Simulator option -> Debug -> Simulate memory warning)(or shortcut: Shift+cmd+M) 

Methods Invoked:
sceneDidReceiveMemoryWarning(_:): Called when the system sends a memory warning specific to the scene.
      e. App kill :
      Methods Invoked:
sceneDidDisconnect(_:): Called when a running scene is about to be removed from the app’s session. This could happen when the app is terminated by the user or the system.



2. Investigate and write down in detail which life cycle methods of UIViewController are invoked in following scenarios: 
App Launch
Methods Invoked:
init(nibName:bundle:) / initWithNibName:bundle:: The initializer is called when the view controller is initialized, typically from a storyboard or programmatically.
loadView(): If the view controller's view property is accessed and is currently nil, this method loads or creates the view hierarchy.
viewDidLoad(): Called after the view controller's view has been loaded into memory. This is where you perform additional setup, such as initializing data, configuring UI elements, or setting initial state.
      b. App Background (Press iPhone Home Button)
Methods Invoked:
viewWillDisappear(_:): Called just before the view controller's view is removed from the window's view hierarchy, typically when navigating away from the screen.
viewDidDisappear(_:): Called after the view controller's view has been removed from the window's view hierarchy. Use this method to perform cleanup tasks or pause ongoing activities.
      c. Phone Locked (Lock Phone using simulator lock button)
Methods Invoked:
viewWillDisappear(_:): Similar to pressing the home button, locking the phone triggers the app to enter the background state and subsequently triggers viewWillDisappear(_:).
viewDidDisappear(_:): Called after the view controller's view has been removed from the window's view hierarchy.
      d. Simulate Memory Warning (Simulator Debug -> Simulate memory warning)
Methods Invoked:
didReceiveMemoryWarning(): Called when the system sends a memory warning to the app. Override this method to free up memory and release any resources that can be recreated. It's typically used to release non-essential resources or cached data.
      e. App Kill
Methods Invoked:
Note: When an app is killed (terminated) by the user or the system, there are no specific lifecycle methods invoked on individual view controllers. The termination process happens at the application level (AppDelegate), and view controllers do not receive notifications directly related to app termination.




