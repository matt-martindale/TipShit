//
//  Tip+Convenience.swift
//  TipShit
//
//  Created by Matthew Martindale on 6/1/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation
import CoreData

enum TipTier: String, Codable {
    case lowTier = "lowTier"
    case midTier = "midTier"
    case highTier = "highTier"
    case fourTwenty = "fourTwenty"
    case sixtyNine = "sixtyNine"
    case sixsixsix = "sixsixsix"
    case negativeHacker = "negativeHacker"
    case hacker = "hacker"
}

extension Tip {
    @discardableResult convenience init(
        billAmount: Double,
        date: Date = Date(),
        party: Int64,
        pricePerPerson: Double,
        tipAmount: Double,
        tipPercentage: Int64,
        tipTier: TipTier,
        totalBill: Double,
        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        
        self.billAmount = billAmount
        self.date = date
        self.party = party
        self.pricePerPerson = pricePerPerson
        self.tipAmount = tipAmount
        self.tipPercentage = tipPercentage
        self.tipTier = tipTier.rawValue
        self.totalBill = totalBill
        
    }
}
