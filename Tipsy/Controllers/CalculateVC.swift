//
//  ViewController.swift
//  Tipsy
//
//  Created by Jaron Grigsby on 2/16/22.
//

import UIKit

class CalculateVC: UIViewController {

  @IBOutlet var billTextField: UITextField!
  @IBOutlet var zeroPctButton: UIButton!
  @IBOutlet var tenPctButton: UIButton!
  @IBOutlet var twentyPctButton: UIButton!
  @IBOutlet var splitLbl: UILabel!

  var splitPeople = 2
  var tip = 0.10
  var billAmnt = 0.0
  var finalBill = ""

  override func viewDidLoad() {
    super.viewDidLoad()

  }

  @IBAction func pctChosen(_ sender: UIButton) {

    let buttonTitle = sender.currentTitle!
    let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
    let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
    tip = buttonTitleAsANumber / 100
    print(tip)

    zeroPctButton.isSelected = false
    tenPctButton.isSelected = false
    twentyPctButton.isSelected = false
    sender.isSelected = true
    billTextField.endEditing(true)
  }
  
  @IBAction func splitAmnt(_ sender: UIStepper) {
    splitPeople = Int(sender.value)
    splitLbl.text = String("\(splitPeople)")
  }
  
  @IBAction func calculatePressed(_ sender: UIButton) {
    let billText = billTextField.text!

    if billText != "" {
      billAmnt = Double(billText)!

      let billCalc = billAmnt * (1 + tip) / Double(splitPeople)
      print(billCalc)

      let bill = String(format: "%.2f", billCalc)
      finalBill = bill

      performSegue(withIdentifier: "goToResults", sender: self)
    }
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard segue.identifier == "goToResults" else { return }
    let destinationVC = segue.destination as! ResultsVC
    destinationVC.finalBill = finalBill
    destinationVC.tip = Int(tip * 100)
    destinationVC.split = splitPeople
  }
  
}

