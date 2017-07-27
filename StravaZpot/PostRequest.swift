//
//  PostRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

public class PostRequest<T : Equatable> : Request<T> {
    override public func execute(callback : @escaping (StravaResult<T>) -> ()) {
        client.post(url: url, parameters: getParameters().flatten(), callback: processResult(callback: callback))
    }
}
