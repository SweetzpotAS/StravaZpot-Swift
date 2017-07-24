//
//  BoolExtension.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import Foundation

extension Bool {
    func intValue() -> Int {
        return self ? 1 : 0
    }
}
