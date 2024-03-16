//
//  ColorSpectrum.swift
//  NebulaShift Kit
//
//  Created by Manish Bhanushali on 17/11/23.
//
import UIKit

class ColorSpectrum: UIViewController {

    @IBOutlet weak var inputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var outputSegmentedControl: UISegmentedControl!
    @IBOutlet weak var colorComponentSlider: UISlider!
    @IBOutlet weak var colorComponentLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    var colorConverter = ColorSpectrumConverter()
    let colorModels = ["RGB", "Hex", "HSL", "CMYK"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    func configureUI() {
        colorComponentSlider.minimumValue = 0.0
        colorComponentSlider.maximumValue = 255.0
        colorComponentSlider.value = 128.0
        updateColorComponentLabel()
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        updateColorComponentLabel()
    }

    func updateColorComponentLabel() {
        colorComponentLabel.text = "\(Int(colorComponentSlider.value))"
    }

    @IBAction func convertButtonTapped(_ sender: UIButton) {
        guard let inputModel = ColorModel(rawValue: colorModels[inputSegmentedControl.selectedSegmentIndex]),
              let outputModel = ColorModel(rawValue: colorModels[outputSegmentedControl.selectedSegmentIndex]) else {
            displayError(message: "Invalid color model selection")
            return
        }

        let inputColorComponent = colorComponentSlider.value
        let convertedColorComponent = colorConverter.convertColorComponent(component: inputColorComponent, fromModel: inputModel, toModel: outputModel)

        resultLabel.text = "\(Int(inputColorComponent)) in \(inputModel.rawValue) is equal to \(convertedColorComponent) in \(outputModel.rawValue)"
    }

    func displayError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

enum ColorModel: String {
    case rgb
    case hex
    case hsl
    case cmyk
}

struct ColorSpectrumConverter {
    func convertColorComponent(component: Float, fromModel: ColorModel, toModel: ColorModel) -> Float {
        // Conversion logic would be implemented based on the specific rules for each color model.
        // This example is simplified and does not perform actual color space conversions.

        // Assume a simple linear conversion for demonstration purposes.
        let conversionFactor: Float = 0.5

        return component * conversionFactor
    }
}
