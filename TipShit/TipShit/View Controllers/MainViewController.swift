//
//  MainViewController.swift
//  TipShit
//
//  Created by Matthew Martindale on 3/23/20.
//  Copyright © 2020 Matthew Martindale. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var tipController = TipController()
    let alertMessages = AlertMessages()
    
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
        billAmountTextField.becomeFirstResponder()
        createToolbar()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
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
    
    @IBAction func confirmTipButtonTapped(_ sender: UIButton) {
        guard billAmountTextField.text!.isEmpty ||
            tipAmountTextField.text!.isEmpty ||
            tipPercentageTextField.text!.isEmpty ||
            personAmountTextField.text!.isEmpty ||
            pricePerPersonTextField.text!.isEmpty ||
            totalAmountTextField.text!.isEmpty
        else { return }
        let alertController = UIAlertController(title: "Fill in all fields", message: "\(alertMessages.messages.randomElement()!)", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "Okay", style: .cancel, handler: alertHandler)
        okAction.setValue(UIColor.black, forKey: "titleTextColor")
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func alertHandler(alert: UIAlertAction!) {
        billAmountTextField.becomeFirstResponder()
    }
    
    func updateCalculations() {
        if let billAmount = Double(billAmountTextField.text!),
            let tipPercentage = tipPercentageTextField.text,
            let party = Double(personAmountTextField.text!){
            let roundedBillAmount = Double(round(100*billAmount)/100)
            let tipAmount = tipController.calculateTipAmount(billAmount: Double(roundedBillAmount), tipPercentage: Int(tipPercentage))
            billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
            tipAmountTextField.text = String(format: "%.2f", tipAmount)
            let totalAmount = Double(billAmount) + tipAmount
            totalAmountTextField.text = String(format: "%.2f", totalAmount)
            let pricePerPerson = totalAmount / party
            pricePerPersonTextField.text = String(format: "%.2f", pricePerPerson)
        }
    }
    
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(MainViewController.dismissKeyboard))
        
        toolbar.setItems([doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        
        billAmountTextField.inputAccessoryView = toolbar
        tipAmountTextField.inputAccessoryView = toolbar
        personAmountTextField.inputAccessoryView = toolbar
        tipPercentageTextField.inputAccessoryView = toolbar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
        updateCalculations()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tipPercentage = Int(tipPercentageTextField.text!),
            let billAmount = Double(billAmountTextField.text!),
            let tipAmount = Double(tipAmountTextField.text!),
            let party = Int(personAmountTextField.text!),
            let pricePerPerson = Double(pricePerPersonTextField.text!),
            let totalBill = Double(totalAmountTextField.text!) {
            let tipTier = tipController.setTipTier(tipPercentage: tipPercentage)
            let newTip = Tip(billAmount: billAmount, tipAmount: tipAmount, tipPercentage: tipPercentage, party: party, pricePerPerson: pricePerPerson, totalBill: totalBill)
            if segue.identifier == "DetailSegue" {
                let detailVC = segue.destination as? TipDetailViewController
                detailVC?.tipController = tipController
                detailVC?.tip = newTip
                detailVC?.tipTier = tipTier
            }
        }
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
            updateCalculations()
        } else {
            let value = tipController.tipPercentage[row]
            tipPercentageTextField.text = String(value)
            updateCalculations()
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textColor = .white
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
