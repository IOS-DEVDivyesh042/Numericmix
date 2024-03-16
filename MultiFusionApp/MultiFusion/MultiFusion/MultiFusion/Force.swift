//
//  Force.swift
//  MultiFusion
//
//  Created by Manish Bhanushali on 06/11/23.
//
import UIKit

class Force : UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var metersLabel: UILabel!
    @IBOutlet weak var milesLabel: UILabel!
    @IBOutlet weak var poundsLabel: UILabel!
    @IBOutlet weak var kilogramsLabel: UILabel!
    @IBOutlet weak var dynesLabel: UILabel!
    @IBOutlet weak var newtonsLabel: UILabel!
    @IBOutlet weak var gramsLabel: UILabel!
    @IBOutlet weak var ouncesLabel: UILabel!
    @IBOutlet weak var tonsLabel: UILabel!
    @IBOutlet weak var kipsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "FORCE"
    }

    @IBAction func convertButtonTapped(_ sender: Any) {
        if let inputText = inputTextField.text, let inputValue = Double(inputText) {
           
            let metersPerNewton = 1000.0
            let milesPerNewton = 0.000621371
            let poundsPerNewton = 0.225
            let kilogramsPerNewton = 0.102
            let dynesPerNewton = 100000.0
            let gramsPerNewton = 102.0
            let ouncesPerNewton = 3.527
            let tonsPerNewton = 0.0001
            let kipsPerNewton = 0.001

           
            let metersValue = inputValue * metersPerNewton
            let milesValue = inputValue * milesPerNewton
            let poundsValue = inputValue * poundsPerNewton
            let kilogramsValue = inputValue * kilogramsPerNewton
            let dynesValue = inputValue * dynesPerNewton
            let gramsValue = inputValue * gramsPerNewton
            let ouncesValue = inputValue * ouncesPerNewton
            let tonsValue = inputValue * tonsPerNewton
            let kipsValue = inputValue * kipsPerNewton

          
            metersLabel.text = "\(metersValue) m"
            milesLabel.text = "\(milesValue) miles"
            poundsLabel.text = "\(poundsValue) lbs"
            kilogramsLabel.text = "\(kilogramsValue) kg"
            dynesLabel.text = "\(dynesValue) dynes"
            newtonsLabel.text = "\(inputValue) N"
            gramsLabel.text = "\(gramsValue) g"
            ouncesLabel.text = "\(ouncesValue) oz"
            tonsLabel.text = "\(tonsValue) tons"
            kipsLabel.text = "\(kipsValue) kips"
        } else {
            
            metersLabel.text = "Invalid input"
            milesLabel.text = "Invalid input"
            poundsLabel.text = "Invalid input"
            kilogramsLabel.text = "Invalid input"
            dynesLabel.text = "Invalid input"
            newtonsLabel.text = "Invalid input"
            gramsLabel.text = "Invalid input"
            ouncesLabel.text = "Invalid input"
            tonsLabel.text = "Invalid input"
            kipsLabel.text = "Invalid input"
        }
    }
}
