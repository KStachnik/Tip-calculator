import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip: Double = 0.10
    var splitBetweenHowMany: Int = 2
    var billTotal = 0.0
    
    var billSplit = BillSplit()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        var senderTitle = String(sender.currentTitle!.dropLast())
        tip = Double(senderTitle)!/100  
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        splitBetweenHowMany = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!

        if bill != "" {
            billTotal = Double(bill)!
            performSegue(withIdentifier: "goToResults", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalPerPerson = billSplit.getTotalPerPerson(billTotal: billTotal, splitBetweenHowMany: splitBetweenHowMany, tip: tip)
            destinationVC.splitBetweenHowMany = splitBetweenHowMany
            destinationVC.tip = billSplit.getTip(tip: tip)
        }
    }
}




