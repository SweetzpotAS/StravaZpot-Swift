//
//  LeaderboardParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class LeaderboardParser : Parser {
    public func from(json: JSON) -> Leaderboard {
        return Leaderboard(entryCount: json["entry_count"].int!,
                           entries: getArray(json: json["entries"]))
    }
    
    private func getArray(json : JSON) -> EquatableArray<LeaderboardEntry> {
        let parser = LeaderboardEntryParser()
        return EquatableArray(array: json.map{ parser.from(json: $1) })
    }
}
