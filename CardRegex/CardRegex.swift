//
//  CardRegex.swift
//  CardRegex
//
//  Created by Shivank Agarwal on 30/04/19.
//  Copyright © 2019 Shivank Agarwal. All rights reserved.
//

import UIKit

class CardRegex: NSObject {
    
    fileprivate var regexString: String!
    fileprivate var imageName: String!
    fileprivate var cardNameType: String = ""
    
    var cardNumberLength: Int = 16
    var cvvNumberLength: Int = 3
    
    class func initWith(regexStr: String!, imgName: String!, name : String = "", cardNumberLength: Int = 16, cvvlength: Int = 3) -> CardRegex {
        let cardRegex = CardRegex()
        cardRegex.regexString = regexStr
        cardRegex.imageName = imgName
        cardRegex.cardNumberLength = cardNumberLength
        cardRegex.cvvNumberLength = cvvlength
        cardRegex.cardNameType = name
        return cardRegex
    }
}

extension CardRegex {
    
    func matches(for cardNumberText: String) -> Bool {
        
        let matchTest = NSPredicate(format: "SELF MATCHES %@", self.regexString)
        return matchTest.evaluate(with: cardNumberText)
    }
    
    func cardIconImage() -> UIImage? {
        return UIImage(named: self.imageName)
    }
    
    func cardName() -> String {
        return self.cardNameType
    }
}
