import Foundation

struct BillSplit {
    
    func getTotalPerPerson(billTotal: Double, splitBetweenHowMany: Int, tip: Double) -> String {
        let totalPerPerson = (billTotal * (1 + tip)) / Double(splitBetweenHowMany)
        return String(format: "%.2f", totalPerPerson)
    }
    
    func getTip(tip: Double) -> String {
        return String((tip * 100)) + "%"
    }
}
