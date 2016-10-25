//
//  StreamType.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 25/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public enum StreamType : String {
    case time           = "time",
         latlng         = "latlng",
         distance       = "distance",
         altitude       = "altitude",
         velocitySmooth = "velocity_smooth",
         heartRate      = "heartrate",
         cadence        = "cadence",
         watts          = "watts",
         temperature    = "temp",
         moving         = "moving",
         gradeSmooth    = "grade_smooth"
}
