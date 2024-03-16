//
//  Speed.swift
//  MultiFusion
//
//  Created by Manish Bhanushali on 06/11/23.
//

import UIKit

class Speed : UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var metersPerSecondLabel: UILabel!
    @IBOutlet weak var kilometersPerHourLabel: UILabel!
    @IBOutlet weak var milesPerHourLabel: UILabel!
    @IBOutlet weak var feetPerSecondLabel: UILabel!
    @IBOutlet weak var knotsLabel: UILabel!
    @IBOutlet weak var machLabel: UILabel!
    @IBOutlet weak var cLabel: UILabel!
    @IBOutlet weak var speedOfLightLabel: UILabel!
    @IBOutlet weak var speedOfSoundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "SPEED"
        
    }

    @IBAction func convertButtonTapped(_ sender: Any) {
        if let inputText = inputTextField.text, let inputValue = Double(inputText) {
            
            let metersPerSecond = inputValue
            let kilometersPerHour = inputValue * 3.6
            let milesPerHour = inputValue * 2.23694
            let feetPerSecond = inputValue * 3.28084
            let knots = inputValue * 1.94384
            let mach = inputValue * 0.00294118
            let c = inputValue * 3.3356e-9
            let speedOfLight = inputValue * 1.079e-9
            let speedOfSound = inputValue * 0.00294118

          
            metersPerSecondLabel.text = "\(metersPerSecond) m/s"
            kilometersPerHourLabel.text = "\(kilometersPerHour) km/h"
            milesPerHourLabel.text = "\(milesPerHour) mph"
            feetPerSecondLabel.text = "\(feetPerSecond) ft/s"
            knotsLabel.text = "\(knots) knots"
            machLabel.text = "\(mach) Mach"
            cLabel.text = "\(c) c"
            speedOfLightLabel.text = "\(speedOfLight) speed of light"
            speedOfSoundLabel.text = "\(speedOfSound) speed of sound"
        } else {
            
            metersPerSecondLabel.text = "Invalid input"
            kilometersPerHourLabel.text = "Invalid input"
            milesPerHourLabel.text = "Invalid input"
            feetPerSecondLabel.text = "Invalid input"
            knotsLabel.text = "Invalid input"
            machLabel.text = "Invalid input"
            cLabel.text = "Invalid input"
            speedOfLightLabel.text = "Invalid input"
            speedOfSoundLabel.text = "Invalid input"
        }
    }
}



