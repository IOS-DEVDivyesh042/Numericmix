import UIKit

class MysticalEnergy: UIViewController {

    @IBOutlet weak var inputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var outputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var energyLevelStepper: UIStepper!
    @IBOutlet weak var energyLevelLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    var energyConverter = MysticalEnergyConverter()
    let energyLevelUnits = ["Aura", "Essence", "Spirit", "Celestial"]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        energyLevelStepper.minimumValue = 1.0
        energyLevelStepper.maximumValue = 100.0
        energyLevelStepper.value = 50.0
        updateEnergyLevelLabel()
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateEnergyLevelLabel()
    }

    func updateEnergyLevelLabel() {
        energyLevelLabel.text = "\(Int(energyLevelStepper.value))"
    }

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let inputUnitIndex = inputSegmentedControl?.selectedSegmentIndex,
              let outputUnitIndex = outputSegmentedControl?.selectedSegmentIndex,
              inputUnitIndex < energyLevelUnits.count && inputUnitIndex >= 0,
              outputUnitIndex < energyLevelUnits.count && outputUnitIndex >= 0,
              let inputUnit = EnergyLevelUnit(rawValue: energyLevelUnits[inputUnitIndex]),
              let outputUnit = EnergyLevelUnit(rawValue: energyLevelUnits[outputUnitIndex]) else {
            displayError(message: "Invalid unit selection")
            return
        }

        print("Input Unit Index: \(inputUnitIndex), Output Unit Index: \(outputUnitIndex)")
        print("Selected Input Unit: \(inputUnit.rawValue), Selected Output Unit: \(outputUnit.rawValue)")

        let inputEnergyLevel = energyLevelStepper.value
        let convertedEnergyLevel = energyConverter.convertEnergyLevel(value: inputEnergyLevel, fromUnit: inputUnit, toUnit: outputUnit)

        print("Input Energy Level: \(inputEnergyLevel), Converted Energy Level: \(convertedEnergyLevel)")

        DispatchQueue.main.async {
            self.resultLabel.text = "\(Int(inputEnergyLevel)) \(inputUnit.rawValue) is equal to \(convertedEnergyLevel) \(outputUnit.rawValue)"
        }
    }

    func displayError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

enum EnergyLevelUnit: String {
    case aura
    case essence
    case spirit
    case celestial
}

struct MysticalEnergyConverter {
    func convertEnergyLevel(value: Double, fromUnit: EnergyLevelUnit, toUnit: EnergyLevelUnit) -> Double {
        let baseConversionRate = 10.0

        let baseEnergyLevel = value / baseConversionRate

        switch fromUnit {
        case .aura:
            return baseEnergyLevel * 1.0
        case .essence:
            return baseEnergyLevel * 2.0
        case .spirit:
            return baseEnergyLevel * 5.0
        case .celestial:
            return baseEnergyLevel * 10.0
        }
    }
}
