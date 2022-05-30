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
        return LoginResult(accessToken: json["access_token"].string!,
                           athlete: json["athlete"].athlete!)
    }
}
