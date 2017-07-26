//
//  TokenParser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 26/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class TokenParser : Parser {
    func from(json: JSON) -> Token {
        return Token(value: json.string!)
    }
}
