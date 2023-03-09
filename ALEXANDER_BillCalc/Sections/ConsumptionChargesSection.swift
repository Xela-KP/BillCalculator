//
//  ConsumptionCharges.swift
//  ALEXANDER_BillCalc
//
//  Created by Alexander King Perocho on 2023-03-09.
//

import SwiftUI

struct ConsumptionChargesSection: View {
    @ObservedObject private var bill: Bill
    public init(bill: Bill) {
        self.bill = bill
    }
    var body: some View {
        Section(header: Text("Consumption Charges")){
            Text(String(format: "On-Peak Charges $%.2f", bill.OnPeakUsageCost))
            Text(String(format: "Off-Peak Charges $%.2f", bill.OffPeakUsageCost))
            Text(String(format: "Mid-Peak Charges $%.2f", bill.MidPeakUsageCost))
            Text(String(format: "Net Consumption Charges: $%.2f", bill.NetUsageCost))
                .foregroundColor(Color.blue)
        }
    }
}
