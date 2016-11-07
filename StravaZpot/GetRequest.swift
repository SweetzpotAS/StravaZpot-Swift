//
//  GetRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class GetRequest<T : Equatable> : Request<T>{
    override public func execute(callback : @escaping (StravaResult<T>) -> ()) {
        client.get(url: url, parameters: getParameters().flatten(), callback: processResult(callback: callback))
    }
}
