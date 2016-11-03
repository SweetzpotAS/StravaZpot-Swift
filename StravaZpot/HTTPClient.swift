//
//  HTTPClient.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public protocol HTTPClient {
    func get(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON>) -> ())
    func post(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON>) -> ())
    func put(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON>) -> ())
    func delete(url : String, parameters : [String : Any], callback : @escaping (StravaResult<JSON>) -> ())
}
