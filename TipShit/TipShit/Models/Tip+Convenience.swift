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
        identifier: UUID = UUID(),
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
        self.identifier = identifier
    }
    
    @discardableResult convenience init?(tipRepresentation: TipRepresentation,
                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        guard let tipTier = TipTier(rawValue: tipRepresentation.tipTier),
            let identifier = UUID(uuidString: tipRepresentation.identifier) else { return nil }
        
        self.init(billAmount: tipRepresentation.billAmount,
                 party: tipRepresentation.party,
                 pricePerPerson: tipRepresentation.pricePerPerson,
                 tipAmount: tipRepresentation.tipAmount,
                 tipPercentage: tipRepresentation.tipPercentage,
                 tipTier: tipTier,
                 totalBill: tipRepresentation.totalBill,
                 identifier: identifier,
                 context: context)
        
    }
    
    var tipRepresentation: TipRepresentation? {
        guard let date = date,
              let tipTier = tipTier else { return nil }
        
        let id = identifier ?? UUID()
        
        return TipRepresentation(billAmount: billAmount,
                                 date: date,
                                 party: party,
                                 pricePerPerson: pricePerPerson,
                                 tipAmount: tipAmount,
                                 tipPercentage: tipPercentage,
                                 tipTier: tipTier,
                                 totalBill: totalBill,
                                 identifier: id.uuidString)
        
    }
    
}
