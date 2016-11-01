//
//  FriendStatusParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class FriendStatusParser : Parser {
    public func from(json: JSON) -> FriendStatus {
        if let friendString = json.string {
            return FriendStatus(rawValue: friendString)!
        } else {
            return .not_friends
        }
    }
}
