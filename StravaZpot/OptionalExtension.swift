//
//  OptionalExtension.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

protocol OptionalType {
    var isNil: Bool {get}
}

extension Optional: OptionalType {
    var isNil: Bool {
        return self == nil
    }
}
