import UIKit

class Time : UIViewController {

    @IBOutlet weak var fromDatePicker: UIDatePicker!
    @IBOutlet weak var toDatePicker: UIDatePicker!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IBActions

    @IBAction func calculateTimeDifferenceButtonTapped(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"

        let fromTime = fromDatePicker.date
        let toTime = toDatePicker.date

        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute], from: fromTime, to: toTime)

        guard let hours = components.hour, let minutes = components.minute else {
            resultLabel.text = "Invalid date selection"
            return
        }

        resultLabel.text = String(format: "Time Difference: %02d:%02d", hours, minutes)
    }
}
