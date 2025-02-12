//
//  SceneDelegate.swift
//  MOvie
//
//  Created by Zohra Guliyeva  on 04.02.25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?  // 1. AppCoordinator üçün dəyişən əlavə etdik
       
       func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
           guard let windowScene  = (scene as? UIWindowScene) else { return }
           
           let navController = UINavigationController()  // 2. Naviqasiya üçün UINavigationController yaradılır
           
           appCoordinator = AppCoordinator(navigationController: navController)  // 3. AppCoordinator yaradılır
           appCoordinator?.start()  // 4. AppCoordinator-un start() funksiyası çağırılır
           
           window = UIWindow(windowScene: windowScene)
           window?.rootViewController = navController  // 5. Naviqasiya controller-i əsas görünüş kimi təyin edirik
           window?.makeKeyAndVisible()
       }
  
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

