//
//  ViewController.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 2/7/24.
//

import UIKit

class CreateGoldAccountViewController: UIViewController {
    private var commandBus: CommandBus?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configure(commandBus: CommandBus) {
        self.commandBus = commandBus
    }
    
    func createGoldAccount() {
        commandBus?.dispatch(
            //Simulated data, in a real example a user would have filled in the fields
            //of the ViewController
            CreateGoldAccountCommand(iban: "ES123456789", idUser: "1",amount: 300)) { result in
                switch result {
                case .success(_):
                    print("Gold account created succesfully")
                case .failure(let error):
                    print("ERROR: \(error)")
                }
            }
    }
}
