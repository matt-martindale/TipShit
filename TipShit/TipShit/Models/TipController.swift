//
//  TipController.swift
//  TipShit
//
//  Created by Matthew Martindale on 3/24/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

class TipController {
    
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
    
}
