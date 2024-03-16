import UIKit

class Leapyear : UIViewController {

    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions

    @IBAction func checkLeapYearButtonTapped(_ sender: UIButton) {
        guard let yearText = yearTextField.text, let year = Int(yearText) else {
            resultLabel.text = "Invalid input"
            return
        }

        let isLeapYear: Bool = {
            if (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0) {
                return true
            } else {
                return false
            }
        }()

        if isLeapYear {
            resultLabel.text = "\(year) is a leap year!"
        } else {
            resultLabel.text = "\(year) is not a leap year."
        }
    }
}
