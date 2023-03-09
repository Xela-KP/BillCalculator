//
//  RegulatoryCharges.swift
//  ALEXANDER_BillCalc
//
//  Created by Alexander King Perocho on 2023-03-09.
//

import SwiftUI

struct RegulatoryChargesSection: View {
    @ObservedObject private var bill: Bill
    public init(bill: Bill) {
        self.bill = bill
    }
    var body: some View {
        Section(header: Text("Regulatory Charges")){
            Text(String(format: "HST (13%%): $%.2f", bill.HSTCost))
            Text(String(format: "Provincial Rebate (8%%): $%.2f", bill.ProvincialRebate))
            Text(String(format: "Net Regulatory Charges: $%.2f", bill.NetRegulatoryCost))
                .foregroundColor(Color.blue)
        }
    }
}
