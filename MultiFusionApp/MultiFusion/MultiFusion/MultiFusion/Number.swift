import UIKit

class Number: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var decimalLabel: UILabel!
    @IBOutlet weak var binaryLabel: UILabel!
    @IBOutlet weak var octalLabel: UILabel!
    @IBOutlet weak var hexadecimalLabel: UILabel!
    @IBOutlet weak var base5Label: UILabel!
    @IBOutlet weak var base8Label: UILabel!
    @IBOutlet weak var base12Label: UILabel!
    @IBOutlet weak var base16Label: UILabel!
    @IBOutlet weak var base32Label: UILabel!
    @IBOutlet weak var base64Label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "NUMBER"
        
    }

    @IBAction func convertButtonTapped(_ sender: Any) {
        if let inputText = inputTextField.text, let inputValue = Int(inputText) {
            decimalLabel.text = "\(inputValue) (Decimal)"
            binaryLabel.text = String(inputValue, radix: 2) + " (Binary)"
            octalLabel.text = String(inputValue, radix: 8) + " (Octal)"
            hexadecimalLabel.text = String(inputValue, radix: 16).uppercased() + " (Hexadecimal)"
            base5Label.text = String(inputValue, radix: 5) + " (Base 5)"
            base8Label.text = String(inputValue, radix: 8) + " (Base 8)"
            base12Label.text = String(inputValue, radix: 12) + " (Base 12)"
            base16Label.text = String(inputValue, radix: 16) + " (Base 16)"
            base32Label.text = String(inputValue, radix: 32) + " (Base 32)"
          
        } else {
            
            decimalLabel.text = "Invalid input"
            binaryLabel.text = ""
            octalLabel.text = ""
            hexadecimalLabel.text = ""
            base5Label.text = ""
            base8Label.text = ""
            base12Label.text = ""
            base16Label.text = ""
            base32Label.text = ""
            base64Label.text = ""
        }
    }
}
