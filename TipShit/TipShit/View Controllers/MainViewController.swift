//
//  MainViewController.swift
//  TipShit
//
//  Created by Matthew Martindale on 3/23/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var billAmountView: UIView!
    @IBOutlet weak var tipAmountView: UIView!
    @IBOutlet weak var totalAmountView: UIView!
    @IBOutlet weak var calculateTipButton: UIButton!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubViews()
    }
    
    func setupSubViews() {
        billAmountView.layer.cornerRadius = 10
        billAmountView.layer.masksToBounds = true
        billAmountTextField.layer.cornerRadius = 22
        billAmountTextField.layer.masksToBounds = true
        
        tipAmountView.layer.cornerRadius = 10
        tipAmountView.layer.masksToBounds = true
        tipAmountTextField.layer.cornerRadius = 22
        tipAmountTextField.layer.masksToBounds = true
        
        totalAmountView.layer.cornerRadius = 10
        totalAmountView.layer.masksToBounds = true
        
        calculateTipButton.layer.cornerRadius = 20
        calculateTipButton.layer.masksToBounds = true
    }

}
