//
//  Gear.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 24/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Gear {
    public let id : String
    public let resourceState : ResourceState
    public let primary : Bool
    public let name : String
    public let distance : Distance
    public let brandName : String?
    public let modelName : String?
    public let frameType : FrameType?
    public let description : String?
}
