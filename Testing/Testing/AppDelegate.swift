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
    //SIMPLE USE --> They need to register commands/querys and handlers (look setup done in AppSetup).
    //If you do not use that kind of setup, app will crash.
    /*private let queryBus: QueryBus = SyncQueryBus()
    private let commandBus: CommandBus = SyncCommandBus()*/
    
    override init() {
        appSetup = AppSetup()
        super.init()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //SIMPLE USE
        /*commandBus.dispatch(CreateUserCommand(id: "1", name: "Javi", age: 30)) { result in
            switch result {
            case .success(_):
                print("User created succesfully")
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
        queryBus.dispatch(GetUserQuery(userId: "1")) { (result: Result<GetUserResponse, Error>) in
            switch result {
            case .success(let user):
                print("Success, user information:\nId: \(user.id)\nName: \(user.name)\nAge: \(user.age)")
            case .failure(let error):
                print("Error: \(error)")
            }
        }*/
        
        //Command for creating a user
        let commandBus = appSetup.commandBusInstance()
        commandBus.dispatch(CreateUserCommand(id: "1", name: "Javi", age: 60)) { result in
            switch result {
            case .success(_):
                print("User created succesfully")
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
        
        //ViewController for creating a Gold Account
        let viewController = CreateGoldAccountViewController()
        viewController.configure(commandBus: commandBus)
        viewController.createGoldAccount()
        
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

