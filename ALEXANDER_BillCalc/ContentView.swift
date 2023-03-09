//
//  ContentView.swift
//  ALEXANDER_BillCalc
//
//  Created by Alexander King Perocho on 2023-03-08.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var bill: Bill
    var body: some View {
        NavigationStack {
            Form {
                UsageDetailsSection(bill: bill)
                ConsumptionChargesSection(bill: bill)
                RegulatoryChargesSection(bill: bill)
                NetChargesSection(bill: bill)
            }
                .navigationTitle("Alexander King Perocho")
                .navigationBarTitleDisplayMode(.inline)
        }
        .scrollDismissesKeyboard(.immediately)
    }
}
