//
//  HistoryData.swift
//  Jenius-Hackathon
//
//  Created by Andy Aldicho on 23/02/19.
//  Copyright © 2019 Hubert Wang. All rights reserved.
//

import Foundation

struct HistoryData {
    var month: Date
    var transactions: [Transaction]
}

struct Transaction {
    var refNum: String
    var date: Date
    var total: Int
}
