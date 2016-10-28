//
//  Parser.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 28/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol Parser {
    associatedtype ParsedType
    
    func from(json : JSON) -> ParsedType
    func toDictionary() -> [String : Any]
}
