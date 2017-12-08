//
//  Enums.swift
//  SwiftAlgoStructsTests
//
//  Created by nag on 01/12/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

public enum ArraySize: Int {
    case k1 = 1000
    case k2 = 2000
    case k4 = 4000
    case k10 = 10_000
    case k20 = 20_000
    case k100 = 100_000
    case k200 = 200_000
    case m1 = 1_000_000
}

enum QuickSortType {
    case typePartitionHoare, type3WayDutch
}
