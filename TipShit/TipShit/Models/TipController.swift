//
//  TipController.swift
//  TipShit
//
//  Created by Matthew Martindale on 3/24/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

class TipController {
    
    var tips: [Tip] = []
    var tip: Tip? = nil
    var commentTier: TipTier? = nil
    
    var personAmount: [Int] {
        var peopleAmount: [Int] = []
        for person in 1...20 {
            peopleAmount.append(person)
        }
        return peopleAmount.reversed()
    }
    
    var tipPercentage: [Int] {
        var tipPercentage: [Int] = []
        for percent in 5...15 {
            tipPercentage.append(percent)
        }
        for percent in 20...30 where percent % 5 == 0 {
            tipPercentage.append(percent)
        }
        for percent in 40...100 where percent % 10 == 0 {
            tipPercentage.append(percent)
        }
        return tipPercentage.reversed()
    }
    
    func createTip(billAmount: Double, tipAmount: Double, tipPercentage: Int, party: Int, pricePerPerson: Double, totalBill: Double) {
        guard let billAmount = tip?.billAmount,
            let tipAmount = tip?.tipAmount,
            let tipPercentage = tip?.tipPercentage,
            let party = tip?.party,
            let pricePerPerson = tip?.pricePerPerson,
            let totalBill = tip?.totalBill else { return }
            let newTip = Tip(billAmount: billAmount, tipAmount: tipAmount, tipPercentage: tipPercentage, party: party, pricePerPerson: pricePerPerson, totalBill: totalBill, date: Date())
        self.tip = newTip
        tips.append(newTip)
    }
    
    func setTipTier(tipPercentage: Int) -> TipTier {
        switch tipPercentage {
        case 420:
            return TipTier.fourTwenty
        case 69:
            return TipTier.sixtyNine
        case 666:
            return TipTier.sixsixsix
        case 0...10:
            return TipTier.lowTier
        case 11...20:
            return TipTier.midTier
        case 21...999:
            return TipTier.highTier
        case ...(-1):
            return TipTier.negativeHacker
        default:
            return TipTier.hacker
        }
    }
    
    func calculateTotalBill(billAmount: Double, tipAmount: Double, tipPercentage: Int) -> Double {
        return billAmount + calculateTipAmount(billAmount: billAmount, tipPercentage: tipPercentage)
    }
    
    func calculateTipAmount(billAmount: Double?, tipPercentage: Int?) -> Double {
        guard let billAmount = billAmount,
            let tipPercentage = tipPercentage else { return 0.0}
        let adjustedTipPercentage = Double(tipPercentage) / 100
        return billAmount * adjustedTipPercentage
    }
    
    func roundUp(oldTotalBill: Double) -> Double {
        return oldTotalBill.rounded(.up)
    }
    
    func roundDown(oldTotalBill: Double) -> Double {
        return oldTotalBill.rounded(.down)
    }
}
