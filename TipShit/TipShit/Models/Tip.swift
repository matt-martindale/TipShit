//
//  Tip.swift
//  TipShit
//
//  Created by Matthew Martindale on 3/24/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

struct Tip {
    var billAmount: Double?
    var tipAmount: Double?
    var tipPercentage: Int?
    var party: Int?
    var pricePerPerson: Double?
    var totalBill: Double?
}

struct Comment {
    let comment: TipTier?
}

enum TipTier {
    case lowTier
    case midTier
    case highTier
    case fourTwenty
    case sixtyNine
    case sixsixsix
    case hacker
}

