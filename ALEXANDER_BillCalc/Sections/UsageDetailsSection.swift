//
//  UsageDetails.swift
//  ALEXANDER_BillCalc
//
//  Created by Alexander King Perocho on 2023-03-09.
//

import SwiftUI

struct UsageDetailsSection: View {
    @ObservedObject private var bill: Bill
    public init(bill: Bill) {
        self.bill = bill
    }
    var body: some View {
        Section(header: Text("Usage Details")) {
            TextField("On-Peak Usage (kWh)", value: $bill.OnPeakUsage, format: .number)
            TextField("Off-Peak Usage (kWh)", value: $bill.OffPeakUsage, format: .number)
            TextField("Mid-Peak Usage (kWH)", value: $bill.MidPeakUsage, format: .number)
        }
        .keyboardType(.decimalPad)
    }
}
