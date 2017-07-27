//
//  LeaveResultParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class LeaveResultParser : Parser {
    public func from(json: JSON) -> LeaveResult {
        return LeaveResult(success: json["success"].bool!, active: json["active"].bool!)
    }
}
