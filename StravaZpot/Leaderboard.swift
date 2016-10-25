//
//  Leaderboard.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Leaderboard {
    public let entryCount : Int
    public let entries : EquatableArray<LeaderboardEntry>
}
