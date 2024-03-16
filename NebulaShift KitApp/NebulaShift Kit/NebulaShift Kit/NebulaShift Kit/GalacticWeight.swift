//
//  GalacticWeight.swift
//  NebulaShift Kit
//
//  Created by Manish Bhanushali on 17/11/23.
//

import UIKit

class GalacticWeight: UIViewController {

    @IBOutlet weak var inputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var outputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var earthWeightStepper: UIStepper!
    @IBOutlet weak var earthWeightLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    var weightConverter = GalacticWeightConverter()
    let planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        earthWeightStepper.minimumValue = 1.0
        earthWeightStepper.maximumValue = 500.0
        earthWeightStepper.value = 70.0
        updateEarthWeightLabel()
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateEarthWeightLabel()
    }

    func updateEarthWeightLabel() {
        earthWeightLabel.text = "\(Int(earthWeightStepper.value)) kg"
    }

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let inputUnit = Planet(rawValue: planets[inputSegmentedControl.selectedSegmentIndex]),
              let outputUnit = Planet(rawValue: planets[outputSegmentedControl.selectedSegmentIndex]) else {
            displayError(message: "Invalid planet selection")
            return
        }

        let inputEarthWeight = earthWeightStepper.value
        let convertedWeight = weightConverter.convertWeight(weight: inputEarthWeight, fromPlanet: inputUnit, toPlanet: outputUnit)

        resultLabel.text = "\(Int(inputEarthWeight)) kg on \(inputUnit.rawValue) is equal to \(convertedWeight) kg on \(outputUnit.rawValue)"
    }

    func displayError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

enum Planet: String {
    case mercury
    case venus
    case earth
    case mars
    case jupiter
    case saturn
    case uranus
    case neptune
}

struct GalacticWeightConverter {
    func convertWeight(weight: Double, fromPlanet: Planet, toPlanet: Planet) -> Double {
        // Conversion rates are approximate values based on gravitational acceleration on each planet.
        let conversionRates: [Planet: Double] = [
            .mercury: 0.38,
            .venus: 0.91,
            .earth: 1.0,
            .mars: 0.38,
            .jupiter: 2.34,
            .saturn: 1.06,
            .uranus: 0.92,
            .neptune: 1.19
        ]

        let earthWeight = weight / conversionRates[.earth]!
        return earthWeight * conversionRates[toPlanet]!
    }
}
