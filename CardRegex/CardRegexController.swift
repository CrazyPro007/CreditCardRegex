//
//  CardRegexController.swift
//  CardRegex
//
//  Created by Shivank Agarwal on 30/04/19.
//  Copyright © 2019 Shivank Agarwal. All rights reserved.
//

import UIKit

class CardRegexController: NSObject {

    // MARK: - Variables
    
    // VISA
    let visaRegex = CardRegex.initWith(regexStr: "^4[0-9]{6,}$", imgName: "cardIconVisa.png", name: "Visa")
    
    // MASTER-CARD
    let masterRegex = CardRegex.initWith(regexStr: "^5[1-5][0-9]{14}$|^2(?:2(?:2[1-9]|[3-9][0-9])|[3-6][0-9][0-9]|7(?:[01][0-9]|20))[0-9]{12}$", imgName: "cardIconMaster.png", name: "MasterCard")
    
    // AMX
    let amxRegex = CardRegex.initWith(regexStr: "^3[47][0-9]{5,}$" , imgName: "cardIconAMX.png", name: "American Express", cardNumberLength: 15, cvvlength: 4)
    
    // Discover
    let discoverRegex = CardRegex.initWith(regexStr: "^6(?:011|5[0-9]{2})[0-9]{3,}$" , imgName: "cardIconDiscover.png", name: "Discover")
    
    
    private var regexArray: [CardRegex] = [CardRegex]()
    
    
    
    // MARK: - Methods
    class func instance() -> CardRegexController {
        
        let regexController = CardRegexController()
        regexController.regexArray = [CardRegex]()
        
        regexController.regexArray.append(regexController.visaRegex)
        regexController.regexArray.append(regexController.masterRegex)
        regexController.regexArray.append(regexController.amxRegex)
        regexController.regexArray.append(regexController.discoverRegex)
        
        return regexController
    }
    
    
    func matchesCardRegex(for cardNumber: String) -> CardRegex? {
        
        var selectedRegex : CardRegex? = nil
        for regex in self.regexArray {
            
            if regex.matches(for: cardNumber) {
                selectedRegex = regex
                break
            }
        }
        
        return selectedRegex
    }
}
