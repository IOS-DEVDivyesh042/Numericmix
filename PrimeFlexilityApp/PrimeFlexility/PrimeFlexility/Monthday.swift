import UIKit

class Monthday : UIViewController {

    @IBOutlet weak var monthTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions

    @IBAction func checkDaysInMonthButtonTapped(_ sender: UIButton) {
        guard let month = monthTextField.text?.lowercased() else {
            resultLabel.text = "Invalid input"
            return
        }

        let daysInMonth: Int

        switch month {
        case "january", "march", "may", "july", "august", "october", "december":
            daysInMonth = 31
        case "april", "june", "september", "november":
            daysInMonth = 30
        case "february":
            daysInMonth = 28 // Assuming a non-leap year
        default:
            resultLabel.text = "Invalid month"
            return
        }

        resultLabel.text = "There are \(daysInMonth) days in \(month.capitalized)"
    }
}
