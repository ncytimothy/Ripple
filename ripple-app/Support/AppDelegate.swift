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
    
    enum FeelingConstants {
        struct ImageName {
            static let Happy = "happy"
            static let Sad = "sad"
            static let Love = "love"
            static let Worried = "worried"
            static let Angry = "angry"
            static let Joyful = "joyful"
        }
        
        struct FeelingString {
            static let Happy = "Happy"
            static let Sad = "Sad"
            static let Love = "Loved"
            static let Worried = "Worried"
            static let Angry = "Angry"
            static let Joyful = "Joyful"
        }
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
        let homeVC = tabBarViewControllers[TabBarControllerConstants.HomeViewController] as! HomeViewController
        
        quoteVC.dataController = dataController
        homeVC.dataController = dataController
        
        dataController.load()
        setUpFeeings()
       
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
    
    fileprivate func setUpFeeings() {
        let happy = setFeeling(imageName: FeelingConstants.ImageName.Happy, feelingString: FeelingConstants.FeelingString.Happy)
        let sad = setFeeling(imageName: FeelingConstants.ImageName.Sad, feelingString: FeelingConstants.FeelingString.Sad)
        let loved = setFeeling(imageName: FeelingConstants.ImageName.Love, feelingString: FeelingConstants.FeelingString.Love)
        let worried = setFeeling(imageName: FeelingConstants.ImageName.Worried, feelingString: FeelingConstants.FeelingString.Worried)
        let angry = setFeeling(imageName: FeelingConstants.ImageName.Angry, feelingString: FeelingConstants.FeelingString.Angry)
        let joyful = setFeeling(imageName: FeelingConstants.ImageName.Joyful, feelingString: FeelingConstants.FeelingString.Joyful)
    }
    
    fileprivate func setFeeling(imageName: String, feelingString: String) {
        let feeling = Feeling(context: dataController.viewContext)
        feeling.imageName = imageName
        feeling.feelingString = feelingString
        feeling.creationDate = Date()
        do {
            try dataController.viewContext.save()
        } catch {
            debugPrint("Cannot save feeling to Core Data")
        }
    }

}

