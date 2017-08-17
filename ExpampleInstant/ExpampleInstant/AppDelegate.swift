//
//  AppDelegate.swift
//  ExpampleInstant
//
//  Created by Marlon David Ruiz Arroyave on 8/16/17.
//  Copyright © 2017 mruiz723. All rights reserved.
//

import UIKit
import PSPDFKit
import Instant

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        PSPDFKit.setLicenseKey("GCEj+UpyNHpozgGIn9wG2Kp8EqWYZK7Ex4YZOP1svEPXlk/hkTppt3MK72LNd+dF5qf6EW0IEYTCQ3jZzPR+ocic0QTKXGDK4RfVD4kGJY4cSTc94IvIRvPx48RCXXHz3sbhcQBXbogTrfzo2SP+ec7mBIOXZ6NlgWoz0BKHeMaFlF+9E8bVCtKknjkgolVfkB3mdUb1MWXpWcZHknRXyM0Ue8/RS7huJEXKRc1I/DWt24AtoD5uJW324mzOtQLJTX1tZu8lKGM6Sf021OS1rAXdPgGiksTW1jI21WtLo+bSs1GK7kf5rcXB2MWri3P7L0mcXI1ieBej0p8XOpO87K0kRMzp0UF1Fr5PiNl55Oe/o+2YfwiLJAaud+o0mudWtA4vg5Fh7CT5Br0TmtyiNyO/JPRYWL24GahFITR7oOOEy6R+s4rgKzzp0FaDr0DJ")
        
        // The base URL needs to match the IP of your local dev machine so you can connect from your WiFi to the local server
        // You also need to set BASE_URL in the docker-compose.yml!
        // (To retrieve your IP address hold Option while clicking the WiFi icon in the macOS menu bar)
        
        let instantClient = PSPDFInstantClient(serverURL: URL(string: "http://http://198.199.71.217:5000")!)
        
        // Client for the example server, as a stand-in for your own backend.
        // Note the example server expects an empty password.
        let apiClient = APIClient(baseURL: URL(string: "http://198.199.71.217:3000")!, userID: "dashboard", password: "secret")
        
        let documentsController = DocumentsViewController(instantClient: instantClient, apiClient: apiClient)
        documentsController.title = "Instant"
        
        let window = UIWindow()
        window.rootViewController = UINavigationController(rootViewController: documentsController)
        window.makeKeyAndVisible()
        self.window = window

        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

