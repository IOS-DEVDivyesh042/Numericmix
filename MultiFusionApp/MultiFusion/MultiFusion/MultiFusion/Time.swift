//
//  Time.swift
//  MultiFusion
//
//  Created by Manish Bhanushali on 06/11/23.
//
import UIKit

class Time : UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var weeksLabel: UILabel!
    @IBOutlet weak var monthsLabel: UILabel!
    @IBOutlet weak var yearsLabel: UILabel!
    @IBOutlet weak var decadesLabel: UILabel!
    @IBOutlet weak var centuriesLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "TIME"
        
    }

    @IBAction func convertButtonTapped(_ sender: Any) {
        if let inputText = inputTextField.text, let inputValue = Double(inputText) {
            
            let seconds = inputValue
            let minutes = inputValue / 60.0
            let hours = inputValue / 3600.0
            let days = inputValue / 86400.0
            let weeks = inputValue / 604800.0
            let months = inputValue / 2.628e6
            let years = inputValue / 3.154e7
            let decades = inputValue / 3.154e8
            let centuries = inputValue / 3.154e9

           
            secondsLabel.text = "\(seconds) seconds"
            minutesLabel.text = "\(minutes) minutes"
            hoursLabel.text = "\(hours) hours"
            daysLabel.text = "\(days) days"
            weeksLabel.text = "\(weeks) weeks"
            monthsLabel.text = "\(months) months"
            yearsLabel.text = "\(years) years"
            decadesLabel.text = "\(decades) decades"
            centuriesLabel.text = "\(centuries) centuries"
        } else {
           
            secondsLabel.text = "Invalid input"
            minutesLabel.text = "Invalid input"
            hoursLabel.text = "Invalid input"
            daysLabel.text = "Invalid input"
            weeksLabel.text = "Invalid input"
            monthsLabel.text = "Invalid input"
            yearsLabel.text = "Invalid input"
            decadesLabel.text = "Invalid input"
            centuriesLabel.text = "Invalid input"
        }
    }
}
