//
//  PrimaryPhoto.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct PrimaryPhoto {
    public let id : Int?
    public let uniqueID : String?
    public let source : PhotoSource
    public let urls : [String : String]
}
