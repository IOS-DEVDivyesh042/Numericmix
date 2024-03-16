//
//  Romannumeral.swift
//  OmniVersa
//
//  Created by Manish Bhanushali on 16/11/23.
//

import UIKit

struct RomanNumeralConverter {
    static let romanNumerals: [Character: Int] = [
        "I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000
    ]

    static func romanToDecimal(roman: String) -> Int {
        var result = 0
        var previousValue = 0

        for numeral in roman.reversed() {
            if let value = romanNumerals[numeral] {
                if value < previousValue {
                    result -= value
                } else {
                    result += value
                }
                previousValue = value
            }
        }

        return result
    }

    static func decimalToRoman(decimal: Int) -> String {
        var result = ""
        var remainingValue = decimal

        for (numeral, value) in romanNumerals.sorted(by: { $0.value > $1.value }) {
            while remainingValue >= value {
                result += String(numeral)
                remainingValue -= value
            }
        }

        return result
    }
}

class Romannumeral : UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let inputText = inputTextField.text, let decimalInput = Int(inputText) else {
            return
        }

        let romanValue = RomanNumeralConverter.decimalToRoman(decimal: decimalInput)
        resultLabel.text = "Roman Numeral: \(romanValue)"
    }
}
