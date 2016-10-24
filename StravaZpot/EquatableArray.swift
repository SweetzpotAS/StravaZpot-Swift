//
//  EquatableArray.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class EquatableArray<T : Equatable> {
    public let array : [T]
    
    public init(array : [T]) {
        self.array = array
    }
}
