import UIKit

class Vacationcountday : UIViewController {

    @IBOutlet weak var vacationFromDatePicker: UIDatePicker!
    @IBOutlet weak var vacationToDatePicker: UIDatePicker!
    @IBOutlet weak var countdownLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func startCountdownButtonTapped(_ sender: UIButton) {
        startCountdown()
    }

    func startCountdown() {
        let vacationFromDate = vacationFromDatePicker.date
        let vacationToDate = vacationToDatePicker.date
        let currentDate = Date()

        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: currentDate, to: vacationFromDate)

        if let daysUntilVacation = components.day, daysUntilVacation > 0 {
            countdownLabel.text = "Days until vacation: \(daysUntilVacation)"
        } else if currentDate >= vacationFromDate && currentDate <= vacationToDate {
            countdownLabel.text = "On vacation!"
        } else {
            countdownLabel.text = "Vacation already ended!"
        }
    }
}
