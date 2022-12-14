//
//  SceneDelegate.swift
//  TestApp
//
//  Created by Ponkumar's Mac on 23/11/22.
//

import UIKit
import AppCenter
import AppCenterDistribute

class SceneDelegate: UIResponder, UIWindowSceneDelegate, DistributeDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        Distribute.delegate = self
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

    func distribute(_ distribute: Distribute, releaseAvailableWith details: ReleaseDetails) -> Bool {

      // Your code to present your UI to the user, e.g. an UIAlertController.
      let alertController = UIAlertController(title: "Update available.",
                                            message: "Do you want to update?",
                                     preferredStyle:.alert)

      alertController.addAction(UIAlertAction(title: "Update", style: .cancel) {_ in
        Distribute.notify(.update)
      })

      alertController.addAction(UIAlertAction(title: "Postpone", style: .default) {_ in
        Distribute.notify(.postpone)
      })

      // Show the alert controller.
      self.window?.rootViewController?.present(alertController, animated: true)
      return true;
    }
}

