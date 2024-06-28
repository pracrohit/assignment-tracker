import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
//        let tabBarController = UITabBarController()
//        
//        let searchVC = MainViewController()
//        searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
//        let searchNavController = UINavigationController(rootViewController: searchVC)
//        
//        let favoritesVC = FavoritesViewController()
//        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
//        let favoritesNavController = UINavigationController(rootViewController: favoritesVC)
//        
//        tabBarController.viewControllers = [searchNavController, favoritesNavController]
//        
//        window?.rootViewController = tabBarController
//        window?.makeKeyAndVisible()
        
        return true
    }
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
}
