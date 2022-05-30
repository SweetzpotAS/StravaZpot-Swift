//
//  CreateActivityRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class CreateActivityRequest : PostRequest<Activity> {
    private var parameters : [String : Any] = [:]
    
    init(client: HTTPClient, name : String, type : ActivityType, startDate : Date, elapsedTime : Time, description : String?, distance : Distance?, isPrivate : Bool?, hasTrainer : Bool?, commute : Bool?, externalId: String?, totalElevationGain: Double?, location: Coordinates?, city: String?, gearId: String?, deviceName: String?) {
        parameters = ["name" : name,
                      "type" : type.rawValue,
                      "start_date_local" : startDate.iso8601,
                      "elapsed_time" : elapsedTime.seconds]
        parameters["description"] = description
        parameters["distance"] = distance?.meters
        parameters["private"] = isPrivate
        parameters["trainer"] = hasTrainer
        parameters["commute"] = commute
        parameters["external_id"] = externalId
        parameters["total_elevation_gain"] = totalElevationGain
        if let location = location {
            parameters["start_latlng"] = [location.latitude, location.longitude]
            parameters["start_latitude"] = location.latitude
            parameters["start_longitude"] = location.longitude
        }
        parameters["location_city"] = city
        parameters["gear_id"] = gearId
        parameters["device_name"] = deviceName
        super.init(client: client, url: "activities", parse: { $0.activity })
    }
    
    override func getParameters() -> [String : Any] {
        return parameters
    }
}
