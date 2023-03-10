//
//  ViewController.swift
//  MainApp
//
//  Created by Daniel Sutcliffe on 16/01/2023.
//

import UIKit
import REST

class ViewController: UIViewController {

    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonA.setTitle("Vehicle Data", for: .normal)
        buttonB.setTitle("New API", for: .normal)
    }

    @IBAction func buttonAPressed(_ sender: Any) {
        print("Vehicle Data Button")
        
        DVLAVehicleDataRestClient().getVehicleData { result in
            // Not completed "completion()" in RestClient
            print("In Closure")
            
            switch result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error)
            }
        }

    }

    @IBAction func buttonBPressed(_ sender: Any) {
        print("New API Button")
    }
    
}

