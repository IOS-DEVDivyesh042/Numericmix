import UIKit

class FantasyCurrency: UIViewController {

    @IBOutlet weak var inputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var outputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var goldAmountStepper: UIStepper!
    @IBOutlet weak var goldAmountLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    var currencyConverter = FantasyCurrencyConverter()
    let fantasyCurrencies = ["Gold", "Silver", "Platinum", "Gemstone"]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        goldAmountStepper.minimumValue = 1.0
        goldAmountStepper.maximumValue = 1000.0
        goldAmountStepper.value = 100.0
        updateGoldAmountLabel()
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateGoldAmountLabel()
    }

    func updateGoldAmountLabel() {
        goldAmountLabel.text = "\(Int(goldAmountStepper.value)) gold"
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
            print("Updating result label")
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

enum FantasyCurrencyType: String {
    case gold
    case silver
    case platinum
    case gemstone
}

struct FantasyCurrencyConverter {
    func convertGoldAmount(amount: Double, fromCurrency: FantasyCurrencyType, toCurrency: FantasyCurrencyType) -> Double {
        // Conversion rates are based on the rarity and value of each fantasy currency.
        let conversionRates: [FantasyCurrencyType: Double] = [
            .gold: 1.0,
            .silver: 0.1,
            .platinum: 10.0,
            .gemstone: 100.0
        ]

        guard let fromRate = conversionRates[fromCurrency], let toRate = conversionRates[toCurrency] else {
            return 0.0 // Or handle this case as appropriate for your application
        }

        let goldAmount = amount / fromRate
        return goldAmount * toRate
    }
}

