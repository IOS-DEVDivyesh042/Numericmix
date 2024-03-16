//
//  Angle.swift
//  MultiFusion
//
//  Created by Manish Bhanushali on 06/11/23.
//

import UIKit

class Angle : UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var degreesLabel: UILabel!
    @IBOutlet weak var radiansLabel: UILabel!
    @IBOutlet weak var gradiansLabel: UILabel!
    @IBOutlet weak var revolutionsLabel: UILabel!
    @IBOutlet weak var arcminutesLabel: UILabel!
    @IBOutlet weak var arcsecondsLabel: UILabel!
    @IBOutlet weak var milsLabel: UILabel!
    @IBOutlet weak var turnsLabel: UILabel!
    @IBOutlet weak var quadrantsLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ANGLE"
       
    }

    @IBAction func convertButtonTapped(_ sender: Any) {
        if let inputText = inputTextField.text, let inputValue = Double(inputText) {
         
            let degrees = inputValue
            let radians = inputValue * 0.0174533
            let gradians = inputValue * 1.11111
            let revolutions = inputValue * 0.00277778
            let arcminutes = inputValue * 60.0
            let arcseconds = inputValue * 3600.0
            let mils = inputValue * 17.7777778
            let turns = inputValue * 0.00277778
            let quadrants = inputValue * 0.00277778

           
            degreesLabel.text = "\(degrees) degrees"
            radiansLabel.text = "\(radians) radians"
            gradiansLabel.text = "\(gradians) gradians"
            revolutionsLabel.text = "\(revolutions) revolutions"
            arcminutesLabel.text = "\(arcminutes) arcminutes"
            arcsecondsLabel.text = "\(arcseconds) arcseconds"
            milsLabel.text = "\(mils) mils"
            turnsLabel.text = "\(turns) turns"
            quadrantsLabel.text = "\(quadrants) quadrants"
        } else {
           
            degreesLabel.text = "Invalid input"
            radiansLabel.text = "Invalid input"
            gradiansLabel.text = "Invalid input"
            revolutionsLabel.text = "Invalid input"
            arcminutesLabel.text = "Invalid input"
            arcsecondsLabel.text = "Invalid input"
            milsLabel.text = "Invalid input"
            turnsLabel.text = "Invalid input"
            quadrantsLabel.text = "Invalid input"
        }
    }
}
