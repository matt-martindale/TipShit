//
//  Tip.swift
//  TipShit
//
//  Created by Matthew Martindale on 3/24/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

struct Tip {
    let billTotal: Double
    let tipAmount: Double
    let tipPercentage: Int
    let party: Int
    let pricePerPerson: Double
    let totalBill: Double
    let comment: CommentTier
    
    enum CommentTier {
        case lowTier
        case midTier
        case highTier
    }
}
