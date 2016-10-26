//
//  Activity.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 26/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public struct Activity {
    public let id : Int
    public let resourceState : ResourceState
    public let externalID : String?
    public let uploadID : Int?
    public let athlete : Athlete?
    public let name : String?
    public let description : String?
    public let distance : Distance?
    public let movingTime : Time?
    public let elapsedTime : Time?
    public let totalElevationGain : Distance?
    public let elevationHigh : Distance?
    public let elevationLow : Distance?
    public let type : ActivityType?
    public let startDate : Date?
    public let startDateLocal : Date?
    public let timezone : String?
    public let startCoordinates : Coordinates?
    public let endCoordinates : Coordinates?
    public let achievementCount : Int?
    public let kudosCount : Int?
    public let commentCount : Int?
    public let athleteCount : Int?
    public let photoCount : Int?
    public let totalPhotoCount : Int?
    public let photos : PhotoSummary?
    public let map : Map?
    public let hasTrainer : Bool?
    public let isCommute : Bool?
    public let isManual : Bool?
    public let isPrivate : Bool?
    public let deviceName : String?
    public let embedToken : String?
    public let isFlagged : Bool?
    public let workoutType : WorkoutType?
    public let gearID : String?
    public let gear : Gear?
    public let averageSpeed : Speed?
    public let maxSpeed : Speed?
    public let averageCadence : Double?
    public let averageTemperature : Temperature?
    public let averageWatts : Double?
    public let maxWatts : Double?
    public let weightedAverageWatts : Double?
    public let kilojoules : Double?
    public let hasDeviceWatts : Bool?
    public let hasHeartRate : Bool?
    public let averageHeartRate : Double?
    public let maxHeartRate : Int?
    public let calories : Double?
    public let sufferScore : Int?
    public let hasKudoed : Bool?
    public let splitsMetric : EquatableArray<Split>?
    public let splitsStandard : EquatableArray<Split>?
}
