import UIKit

class WorkingDay : UIViewController {

    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var includeEndDateSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        calculateWorkingDays()
    }

    func calculateWorkingDays() {
        let startDate = startDatePicker.date
        let endDate = endDatePicker.date
        let includeEndDate = includeEndDateSwitch.isOn

        var currentDate = startDate
        var workingDays = 0

        while currentDate <= endDate {
            let components = Calendar.current.dateComponents([.weekday], from: currentDate)

            // Check if the current date is not a weekend (Saturday or Sunday)
            if components.weekday != 1 && components.weekday != 7 {
                workingDays += 1
            }

            currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        }

        if !includeEndDate {
            // If end date should not be included, subtract 1 from workingDays
            workingDays -= 1
        }

        resultLabel.text = "Working Days: \(workingDays)"
    }
}
