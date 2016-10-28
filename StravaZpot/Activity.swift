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
    public let segmentEfforts : EquatableArray<SegmentEffort>?
    public let bestEfforts : EquatableArray<SegmentEffort>?
}

extension Activity : Equatable {}

public func ==(lhs : Activity, rhs : Activity) -> Bool {
    return  lhs.id == rhs.id &&
            lhs.resourceState        == rhs.resourceState &&
            lhs.externalID           == rhs.externalID &&
            lhs.uploadID             == rhs.uploadID &&
            lhs.athlete              == rhs.athlete &&
            lhs.name                 == rhs.name &&
            lhs.description          == rhs.description &&
            lhs.distance             == rhs.distance &&
            lhs.movingTime           == rhs.movingTime &&
            lhs.elapsedTime          == rhs.elapsedTime &&
            lhs.totalElevationGain   == rhs.totalElevationGain &&
            lhs.elevationHigh        == rhs.elevationHigh &&
            lhs.elevationLow         == rhs.elevationLow &&
            lhs.type                 == rhs.type &&
            lhs.startDate            == rhs.startDate &&
            lhs.startDateLocal       == rhs.startDateLocal &&
            lhs.timezone             == rhs.timezone &&
            lhs.startCoordinates     == rhs.startCoordinates &&
            lhs.endCoordinates       == rhs.endCoordinates &&
            lhs.achievementCount     == rhs.achievementCount &&
            lhs.kudosCount           == rhs.kudosCount &&
            lhs.commentCount         == rhs.commentCount &&
            lhs.athleteCount         == rhs.athleteCount &&
            lhs.photoCount           == rhs.photoCount &&
            lhs.totalPhotoCount      == rhs.totalPhotoCount &&
            lhs.photos               == rhs.photos &&
            lhs.map                  == rhs.map &&
            lhs.hasTrainer           == rhs.hasTrainer &&
            lhs.isCommute            == rhs.isCommute &&
            lhs.isManual             == rhs.isManual &&
            lhs.isPrivate            == rhs.isPrivate &&
            lhs.deviceName           == rhs.deviceName &&
            lhs.embedToken           == rhs.embedToken &&
            lhs.isFlagged            == rhs.isFlagged &&
            lhs.workoutType          == rhs.workoutType &&
            lhs.gearID               == rhs.gearID &&
            lhs.gear                 == rhs.gear &&
            lhs.averageSpeed         == rhs.averageSpeed &&
            lhs.maxSpeed             == rhs.maxSpeed &&
            lhs.averageCadence       == rhs.averageCadence &&
            lhs.averageTemperature   == rhs.averageTemperature &&
            lhs.averageWatts         == rhs.averageWatts &&
            lhs.maxWatts             == rhs.maxWatts &&
            lhs.weightedAverageWatts == rhs.weightedAverageWatts &&
            lhs.kilojoules           == rhs.kilojoules &&
            lhs.hasDeviceWatts       == rhs.hasDeviceWatts &&
            lhs.hasHeartRate         == rhs.hasHeartRate &&
            lhs.averageHeartRate     == rhs.averageHeartRate &&
            lhs.maxHeartRate         == rhs.maxHeartRate &&
            lhs.calories             == rhs.calories &&
            lhs.sufferScore          == rhs.sufferScore &&
            lhs.hasKudoed            == rhs.hasKudoed &&
            lhs.splitsMetric         == rhs.splitsMetric &&
            lhs.splitsStandard       == rhs.splitsStandard &&
            lhs.segmentEfforts       == rhs.segmentEfforts &&
            lhs.bestEfforts          == rhs.bestEfforts
}
