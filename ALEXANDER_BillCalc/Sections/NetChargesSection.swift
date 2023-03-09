//
//  NetCharges.swift
//  ALEXANDER_BillCalc
//
//  Created by Alexander King Perocho on 2023-03-09.
//

import SwiftUI

struct NetChargesSection: View {
    @ObservedObject private var bill: Bill
    public init(bill: Bill) {
        self.bill = bill
    }
    var body: some View {        Section(header: Text("Bill Amount")){
            Text(String(format: "Net Bill Amount: $%.2f", bill.NetBillAmount)).foregroundColor(Color.red)
        }
    }
}
