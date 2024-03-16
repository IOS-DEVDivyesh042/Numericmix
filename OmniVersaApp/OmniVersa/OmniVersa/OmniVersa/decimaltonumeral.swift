import UIKit

struct RomanNumeralConverters {
    static let romanNumerals: [(String, Int)] = [
        ("M", 1000), ("CM", 900), ("D", 500), ("CD", 400),
        ("C", 100), ("XC", 90), ("L", 50), ("XL", 40),
        ("X", 10), ("IX", 9), ("V", 5), ("IV", 4), ("I", 1)
    ]

    static func decimalToRoman(decimal: Int) -> String {
        var result = ""
        var remainingValue = decimal

        for (numeral, value) in romanNumerals {
            while remainingValue >= value {
                result += numeral
                remainingValue -= value
            }
        }

        return result
    }
}

class decimaltonumeral : UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let inputText = inputTextField.text, let decimalInput = Double(inputText) else {
            return
        }

        let integerPart = Int(decimalInput)
        let decimalPart = decimalInput - Double(integerPart)

        let integerRoman = RomanNumeralConverters.decimalToRoman(decimal: integerPart)
        let decimalRoman = RomanNumeralConverters.decimalToRoman(decimal: Int(decimalPart * 100)) 

        let result = "Roman Numeral: \(integerRoman).\(decimalRoman)"
        resultLabel.text = result
    }
}
