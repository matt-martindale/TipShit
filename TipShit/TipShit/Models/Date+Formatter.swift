//
//  Date+Formatter.swift
//  TipShit
//
//  Created by Matthew Martindale on 5/25/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import Foundation

extension Date {
    func toString(format: String = "MMM dd, yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
