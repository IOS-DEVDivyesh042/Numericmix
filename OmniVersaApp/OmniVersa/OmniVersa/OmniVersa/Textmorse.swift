//
//  Textmorse.swift
//  OmniVersa
//
//  Created by Manish Bhanushali on 16/11/23.
//

import UIKit

struct MorseCodeConverter {
    static let morseCodeDictionary: [Character: String] = [
        "A": ".-", "B": "-...", "C": "-.-.", "D": "-..", "E": ".",
        "F": "..-.", "G": "--.", "H": "....", "I": "..", "J": ".---",
        "K": "-.-", "L": ".-..", "M": "--", "N": "-.", "O": "---",
        "P": ".--.", "Q": "--.-", "R": ".-.", "S": "...", "T": "-",
        "U": "..-", "V": "...-", "W": ".--", "X": "-..-", "Y": "-.--",
        "Z": "--..", "0": "-----", "1": ".----", "2": "..---", "3": "...--",
        "4": "....-", "5": ".....", "6": "-....", "7": "--...", "8": "---..",
        "9": "----."
    ]

    static func textToMorseCode(text: String) -> String {
        let uppercasedText = text.uppercased()
        var morseCode = ""

        for char in uppercasedText {
            if let code = morseCodeDictionary[char] {
                morseCode += code + " "
            } else if char == " " {
                morseCode += " "
            }
        }

        return morseCode.trimmingCharacters(in: .whitespaces)
    }
}

class Textmorse : UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var convertToMorseButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func convertToMorseButtonTapped(_ sender: UIButton) {
        guard let inputText = inputTextField.text, !inputText.isEmpty else {
            return
        }

        let morseCode = MorseCodeConverter.textToMorseCode(text: inputText)
        resultLabel.text = "Morse Code: \(morseCode)"
    }
}
