//
//  TipRepresentation.swift
//  TipShit
//
//  Created by Matthew Martindale on 6/1/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

struct TipRepresentation: Codable {
    var billAmount: Double
    var date: Date
    var party: Int64
    var pricePerPerson: Double
    var tipAmount: Double
    var tipPercentage: Int64
    var tipTier: String
    var totalBill: Double
    var identifier: String
}
