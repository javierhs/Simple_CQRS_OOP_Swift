//
//  AppDelegate.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 2/7/24.
//

import UIKit

final class MyCommand: Command {
    
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private let appSetup: AppSetup
    private let queryBus: QueryBus = InMemoryQueryBus()
    private let commandBus: CommandBus = InMemoryCommandBus()
    
    override init() {
        appSetup = AppSetup(queryBus: queryBus, commandBus: commandBus)
        super.init()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        commandBus.dispatch(CreateUserCommand(id: "1", name: "Javi")) { result in
            switch result {
            case .success(_):
                print("Usuario creado con éxito")
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
        queryBus.dispatch(GetUserQuery(userId: "1")) { (result: Result<GetUserResponse, Error>) in
            switch result {
            case .success(let user):
                print("Success, user: \(user.id) \(user.name)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

