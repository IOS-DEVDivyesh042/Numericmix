import UIKit

class Day : UIViewController {

    @IBOutlet weak var fromDatePicker: UIDatePicker!
    @IBOutlet weak var toDatePicker: UIDatePicker!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions

    @IBAction func calculateDaysDifferenceButtonTapped(_ sender: UIButton) {
        let fromDate = fromDatePicker.date
        let toDate = toDatePicker.date

        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: fromDate, to: toDate)

        guard let days = components.day else {
            resultLabel.text = "Invalid date selection"
            return
        }

        resultLabel.text = "Days Difference: \(days) days"
    }
}
