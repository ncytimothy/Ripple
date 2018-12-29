//
//  AppDelegate.swift
//  ripple-app
//
//  Created by Tim Ng on 12/1/18.
//  Copyright © 2018 Tim Ng. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    enum TabBarControllerConstants {
        static let HomeViewController = 0
        static let QuoteViewController = 1
        static let ActivityViewController = 2
        static let HistoryViewController = 3
    }
    

    var window: UIWindow?
    // DataController init to be injected to initial VC and passed
    let dataController = DataController(modelName: "Ripple")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
          // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
//        let checkInVC = CheckInViewController()

//        let navigationVC = UINavigationController(rootViewController: checkInVC)
//        navigationVC.navigationBar.isTranslucent = false
//        navigationVC.navigationBar.setBackgroundImage(UIImage(named: "primaryOrange"), for: .default)
//        navigationVC.navigationBar.shadowImage = UIImage()
        
        let customTabBarController = CustomTabBarController()
        guard let tabBarViewControllers = customTabBarController.viewControllers else { return true}
        
        let quoteVC = tabBarViewControllers[TabBarControllerConstants.QuoteViewController] as! QuoteViewController
        quoteVC.dataController = dataController
        
//        self.navigationController?.pushViewController(customTabBarController, animated: true)
        
        
//        checkInVC.dataController = dataController
        
        dataController.load()
        
//        navigationVC.navigationBar.barStyle = .black
//        navigationVC.navigationBar.tintColor = .white

        window?.rootViewController = customTabBarController
        
        return true
    }
    
    func saveViewContext() {
        /** Helper Method
         * Calls save on the Data Controller's view context
         * To be used in applicationDidEnterBackground and applicationWillTerminate
         */
        do {
            try dataController.viewContext.save()
        } catch {
            fatalError("dataController.viewContext cannot be save!")
        }
    }
  

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        saveViewContext()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        saveViewContext()
    }
    



}

