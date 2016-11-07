//
//  PutRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class PutRequest<T : Equatable> : Request<T> {
    override public func execute(callback: @escaping (StravaResult<T>) -> ()) {
        client.put(url: url, parameters: getParameters().flatten(), callback: processResult(callback: callback))
    }
}
