//
//  Token.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 26/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Token {
    let value : String
}

extension Token : CustomStringConvertible {
    public var description : String {
        return "Bearer \(value)"
    }
}
