//
//  AccessScope.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 26/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import Foundation

public enum AccessScope : String {
    case Public = "public"
    case Write = "write"
    case ViewPrivate = "view_private"
    case ViewPrivateWrite = "view_private,write"
}
