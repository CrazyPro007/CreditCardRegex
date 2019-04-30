//
//  ViewController.swift
//  CardRegex
//
//  Created by Shivank Agarwal on 30/04/19.
//  Copyright © 2019 Shivank Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardTextField: UITextField!
    @IBOutlet weak var cardIconImageview: UIImageView!
    @IBOutlet weak var informationLabel: UILabel!
    
    //MARK: - Variables -
    var selectedRegex : CardRegex?
    let regexController :CardRegexController = CardRegexController.instance()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cardTextField.delegate = self
    }
}

extension ViewController: UITextFieldDelegate{
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let swiftRange = Range(range, in: textField.text ?? "") else { return false }
        guard var updatedcardNumber = textField.text?.replacingCharacters(in: swiftRange, with: string) else {return false}
        updatedcardNumber = updatedcardNumber.noSpaceString().trimmed()
        
        var defaultLength = 16
        self.selectedRegex = nil
        self.cardIconImageview.image = nil
        
        informationLabel.isHidden = true
        if updatedcardNumber.length >= 15{
            if let newRegex : CardRegex = self.regexController.matchesCardRegex(for: updatedcardNumber) {
                self.selectedRegex = newRegex
                defaultLength = newRegex.cardNumberLength
                if updatedcardNumber.length >= defaultLength {
                    self.cardIconImageview.image = newRegex.cardIconImage()
                    informationLabel.text = newRegex.cardName()
                }
            }else{
                informationLabel.text = "Please provide valid Master / Visa / American Express / Discover Card"
            }
            informationLabel.isHidden = false
        }
        
        if string == "" {
            return true
        }
        else if let textWithoutSpaces = textField.text?.noSpaceString(), textWithoutSpaces.length >= defaultLength {
            return false
        }
        return true
    }
}

extension String{
    
    var length: Int { return self.count }
    
    func noSpaceString() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
