import UIKit

class lightyear : UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var unitPickerView: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!

    let units = ["Light Years", "Parsecs", "Astronomical Units"]

    override func viewDidLoad() {
        super.viewDidLoad()
        unitPickerView.delegate = self
        unitPickerView.dataSource = self
    }

    // MARK: - UIPickerViewDataSource

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return units.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return units[row]
    }

    // MARK: - IBActions

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let inputValue = Double(inputTextField.text ?? "") else {
            resultLabel.text = "Invalid input"
            return
        }

        let selectedUnitIndex = unitPickerView.selectedRow(inComponent: 0)

        let convertedValue: Double
        switch selectedUnitIndex {
        case 0: // Light Years to Light Years
            convertedValue = inputValue
        case 1: // Light Years to Parsecs
            convertedValue = inputValue / 3.26156 // Updated conversion factor
        case 2: // Light Years to Astronomical Units
            convertedValue = inputValue * 63241.1
        default:
            convertedValue = 0.0
        }

        resultLabel.text = "\(inputValue) Light Years is \(convertedValue) \(units[selectedUnitIndex])"
    }
}

