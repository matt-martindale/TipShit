//
//  HistoryTableViewCell.swift
//  TipShit
//
//  Created by Matthew Martindale on 5/25/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    var tip: Tip? {
        didSet {
            updateView()
        }
    }

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var totalBillLabel: UILabel!
    @IBOutlet weak var tipPercentLabel: UILabel!
    
    func updateView() {
        if let tip = tip {
            dateLabel.text = tip.date?.toString()
            totalBillLabel.text = "$" + String(format: "%.2f", tip.totalBill)
            tipPercentLabel.text = String(tip.tipPercentage) + "%"
        }
    }
    
}
