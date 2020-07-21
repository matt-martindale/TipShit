//
//  TipController.swift
//  TipShit
//
//  Created by Matthew Martindale on 3/24/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

class TipController {
    
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
    
//    func createTip(tipPercentage: Int, totalBill: Double) {
//        let newTip = Tip(tipPercentage: tipPercentage, totalBill: totalBill, date: Date())
//        Tips.shared.tips.append(newTip)
//        self.tip = newTip
//    }
    
    func setTipTier(tipPercentage: Int64) -> String {
        switch tipPercentage {
        case 420:
            return getRandomComment(tipTier: .fourTwenty)
//            return TipTier.fourTwenty
        case 69:
            return getRandomComment(tipTier: .sixtyNine)
        case 666:
            return getRandomComment(tipTier: .sixsixsix)
        case 0...10:
            return getRandomComment(tipTier: .lowTier)
        case 11...20:
            return getRandomComment(tipTier: .midTier)
        case 21...999:
            return getRandomComment(tipTier: .highTier)
        case ...(-1):
            return getRandomComment(tipTier: .negativeHacker)
        default:
            return getRandomComment(tipTier: .hacker)
        }
    }
    
    func getRandomComment(tipTier: TipTier) -> String {
        let comments = Comments()
        
        switch tipTier {
        case .fourTwenty:
            let randomIndex = Int.random(in: 0..<comments.fourTwentyTier.count - 1)
            return comments.fourTwentyTier[randomIndex]
        case .sixtyNine:
            let randomIndex = Int.random(in: 0..<comments.sixtyNineTier.count - 1)
            return comments.sixtyNineTier[randomIndex]
        case .sixsixsix:
            let randomIndex = Int.random(in: 0..<comments.sixsixsixTier.count - 1)
            return comments.sixsixsixTier[randomIndex]
        case .lowTier:
            let randomIndex = Int.random(in: 0..<comments.lowTier.count - 1)
            return comments.lowTier[randomIndex]
        case .midTier:
            let randomIndex = Int.random(in: 0..<comments.midTier.count - 1)
            return comments.midTier[randomIndex]
        case .highTier:
            let randomIndex = Int.random(in: 0..<comments.highTier.count - 1)
            return comments.highTier[randomIndex]
        case .negativeHacker:
            let randomIndex = Int.random(in: 0..<comments.negativeHackerTier.count - 1)
            return comments.negativeHackerTier[randomIndex]
        default:
            let randomIndex = Int.random(in: 0..<comments.hackerTier.count - 1)
            return comments.hackerTier[randomIndex]
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
