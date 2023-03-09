//
//  Bill.swift
//  ALEXANDER_BillCalc
//
//  Created by Alexander King Perocho on 2023-03-09.
//

import Foundation
import SwiftUI

class Bill: ObservableObject {
    private let _onPeakUsageRate: Double = 0.132
    private let _offPeakUsageRate: Double = 0.065
    private let _midPeakUsageRate: Double = 0.094
    private let _HST: Double = 0.13
    private let _provincialRebate: Double = 0.08
    
    @Published var OnPeakUsage: Double = 0
    @Published var OffPeakUsage: Double = 0
    @Published var MidPeakUsage: Double = 0

    var OnPeakUsageCost: Double {
        return OnPeakUsage * _onPeakUsageRate
    }

    var OffPeakUsageCost: Double {
        return OffPeakUsage * _offPeakUsageRate
    }

    var MidPeakUsageCost: Double {
        return MidPeakUsage * _midPeakUsageRate
    }

    var NetUsageCost: Double {
        return OnPeakUsageCost + OffPeakUsageCost + MidPeakUsageCost
    }

    var HSTCost: Double {
        return NetUsageCost * _HST
    }

    var ProvincialRebate: Double {
        return NetUsageCost * _provincialRebate
    }

    var NetRegulatoryCost: Double {
        return HSTCost - ProvincialRebate
    }

    var NetBillAmount: Double{
        return NetUsageCost + NetRegulatoryCost
    }
}
