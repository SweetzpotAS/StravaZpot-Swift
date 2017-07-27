//
//  LoginResultParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 26/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class LoginResultParser : Parser {
    public func from(json: JSON) -> LoginResult {
        return LoginResult(token: json["access_token"].token!,
                           athlete: json["athlete"].athlete!)
    }
}
