//
//  ResultsVC.swift
//  Tipsy
//
//  Created by Jaron Grigsby on 2/16/22.
//

import UIKit

class ResultsVC: UIViewController {

  @IBOutlet var totalLbl: UILabel!
  @IBOutlet var billInfo: UILabel!

  var finalBill = "0.0"
  var tip = 10
  var split = 2

  override func viewDidLoad() {
        super.viewDidLoad()
    totalLbl.text = finalBill
    billInfo.text = "Split between \(split) people, with \(tip)% tip."
    }

  @IBAction func recalculatePressed(_ sender: UIButton) {
    dismiss(animated: true, completion: nil)
  }

}
