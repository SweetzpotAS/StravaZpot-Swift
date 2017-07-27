//
//  MembershipParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class MembershipParser : Parser {
    public func from(json: JSON) -> Membership {
        return Membership(rawValue: json.string!)!
    }
}
