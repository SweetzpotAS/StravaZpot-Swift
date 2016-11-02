//
//  JSONExtension.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 2/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation
import SwiftyJSON

extension JSON {
    var achievementType : AchievementType? {
        return exists() ? AchievementTypeParser().from(json: self) : nil
    }
    
    var resourceState : ResourceState? {
        return exists() ? ResourceStateParser().from(json: self) : ResourceState.meta
    }
    
    var activity : Activity? {
        return exists() ? ActivityParser().from(json: self) : nil
    }
    
    var athlete : Athlete? {
        return exists() ? AthleteParser().from(json: self) : nil
    }
    
    var time : Time? {
        return exists() ? TimeParser().from(json: self) : nil
    }
    
    var date : Date? {
        return exists() ? DateParser().from(json: self) : nil
    }
    
    var distance : Distance? {
        return exists() ? DistanceParser().from(json: self) : nil
    }
    
    var speed : Speed? {
        return exists() ? SpeedParser().from(json: self) : nil
    }
    
    var activityType : ActivityType? {
        return exists() ? ActivityTypeParser().from(json: self) : nil
    }
    
    var coordinates : Coordinates? {
        return exists() ? CoordinatesParser().from(json: self) : nil
    }
}
