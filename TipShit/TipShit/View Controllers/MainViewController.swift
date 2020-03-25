//
//  MainViewController.swift
//  TipShit
//
//  Created by Matthew Martindale on 3/23/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let tipController = TipController()
    
    @IBOutlet weak var billAmountView: UIView!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountView: UIView!
    @IBOutlet weak var tipAmountTextField: UITextField!
    @IBOutlet weak var personAmountPickerView: UIPickerView!
    @IBOutlet weak var tipPercentagePickerView: UIPickerView!
    @IBOutlet weak var tipPercentageTextField: UITextField!
    @IBOutlet weak var totalAmountView: UIView!
    @IBOutlet weak var personAmountTextField: UITextField!
    @IBOutlet weak var pricePerPersonTextField: UITextField!
    @IBOutlet weak var totalAmountTextField: UITextField!
    @IBOutlet weak var calculateTipButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        personAmountPickerView.selectRow(tipController.personAmount.count - 1, inComponent: 0, animated: true)
        tipPercentagePickerView.selectRow(tipController.tipPercentage.count - 11, inComponent: 0, animated: true)
        setupSubViews()
        createToolbar()
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
        
        totalAmountView.layer.cornerRadius = 20
        totalAmountView.layer.masksToBounds = true
        pricePerPersonTextField.layer.cornerRadius = 28
        pricePerPersonTextField.layer.masksToBounds = true
        totalAmountTextField.layer.cornerRadius = 28
        totalAmountTextField.layer.masksToBounds = true
        
        calculateTipButton.layer.cornerRadius = 20
        calculateTipButton.layer.masksToBounds = true
    }
    
    @IBAction func personAmountButtonTapped(_ sender: UIButton) {
        personAmountTextField.becomeFirstResponder()
    }
    
    @IBAction func tipPercentageButtonTapped(_ sender: UIButton) {
        tipPercentageTextField.becomeFirstResponder()
    }
    
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(MainViewController.dismissKeyboard))
        
        toolbar.setItems([doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        personAmountTextField.inputAccessoryView = toolbar
        tipPercentageTextField.inputAccessoryView = toolbar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

}

extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return tipController.personAmount.count
        } else {
            return tipController.tipPercentage.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            return "\(tipController.personAmount[row])"
        } else {
            return "\(tipController.tipPercentage[row])"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            let value = tipController.personAmount[row]
            personAmountTextField.text = String(value)
        } else {
            let value = tipController.tipPercentage[row]
            tipPercentageTextField.text = String(value)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont(name: "Helvetica", size: 22)
        
        if pickerView.tag == 1 {
            label.text = String(tipController.personAmount[row])
        } else {
            label.text = String(tipController.tipPercentage[row])
        }
        return label
    }
}

extension MainViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)

        return updatedText.count <= 3
    }
}
