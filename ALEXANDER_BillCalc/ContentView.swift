//
//  ContentView.swift
//  ALEXANDER_BillCalc
//
//  Created by Alexander King Perocho on 2023-03-08.
//

import SwiftUI

struct ContentView: View {
    private let _onPeakUsageRate: Double = 0.132
    private let _offPeakUsageRate: Double = 0.065
    private let _midPeakUsageRate: Double = 0.094

    private let _HST: Double = 0.13
    private let _provincialRebate: Double = 0.08

    @State private var OnPeakUsage: Double = 0.0
    @State private var OffPeakUsage: Double = 0.0
    @State private var MidPeakUsage: Double = 0.0

    private var OnPeakUsageCost: Double {
        return OnPeakUsage * _onPeakUsageRate
    }

    private var OffPeakUsageCost: Double {
        return OffPeakUsage * _offPeakUsageRate
    }

    private var MidPeakUsageCost: Double {
        return MidPeakUsage * _midPeakUsageRate
    }

    private var NetUsageCost: Double {
        return OnPeakUsageCost + OffPeakUsageCost + MidPeakUsageCost
    }

    private var HSTCost: Double {
        return NetUsageCost * _HST
    }

    private var ProvincialRebate: Double {
        return NetUsageCost * _provincialRebate
    }

    private var NetRegulatoryCost: Double {
        return HSTCost - ProvincialRebate
    }

    private var NetBillAmount: Double{
        return NetUsageCost + NetRegulatoryCost
    }
    
    var body: some View {
        NavigationStack {
            Form {
//                UsageDetailsView()
//                ConsumptionChargesView()
//                NetBillAmountView()
                Section(header: Text("Usage Details")) {
                    TextField("On-Peak Usage (kWh)", value: $OnPeakUsage, format: .number)
                        .keyboardType(.decimalPad)
                    TextField("Off-Peak Usage (kWh)", value: $OffPeakUsage, format: .number)
                        .keyboardType(.decimalPad)
                    TextField("Mid-Peak Usage (kWH)", value: $MidPeakUsage, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Consumption Charges")){
                    Text(String(format: "On-Peak Charges $%.2f", OnPeakUsageCost))
                    Text(String(format: "Off-Peak Charges $%.2f", OffPeakUsageCost))
                    Text(String(format: "Mid-Peak Charges $%.2f", MidPeakUsageCost))
                    Text(String(format: "Net Consumption Charges: $%.2f", NetUsageCost))
                        .foregroundColor(Color.blue)
                }
                
                Section(header: Text("Regulatory Charges")){
                    Text(String(format: "HST (13%): $%.2f", HSTCost))
                    Text(String(format: "Provincial Rebate (8%): $%.2f", ProvincialRebate))
                    Text(String(format: "Net Regulatory Charges: $%.2f", NetRegulatoryCost))
                        .foregroundColor(Color.blue)
                }
                
                Section(header: Text("Bill Amount")){
                    Text(String(format: "Net Bill Amount: $%.2f", NetBillAmount)).foregroundColor(Color.red)
                }
            }
                .navigationTitle("Alexander King Perocho")
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
