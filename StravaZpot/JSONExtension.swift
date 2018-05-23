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
    
    var activityArray : EquatableArray<Activity>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.activity }) : nil
    }
    
    var athlete : Athlete? {
        return exists() ? AthleteParser().from(json: self) : nil
    }
    
    var athleteArray : EquatableArray<Athlete>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.athlete }) : nil
    }
    
    var time : Time? {
        return exists() ? TimeParser().from(json: self) : nil
    }
    
    var date : Date? {
        return exists() ? DateParser().from(json: self) : nil
    }
    
    var dateArray : EquatableArray<Date>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.date }) : nil
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
    
    var photoSummary : PhotoSummary? {
        return exists() ? PhotoSummaryParser().from(json: self) : nil
    }
    
    var map : Map? {
        return exists() ? MapParser().from(json: self) : nil
    }
    
    var workoutType : WorkoutType? {
        return exists() ? WorkoutTypeParser().from(json: self) : nil
    }
    
    var gear : Gear? {
        return exists() ? GearParser().from(json: self) : nil
    }
    
    var gearArray : EquatableArray<Gear>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.gear }) : nil
    }
    
    var temperature : Temperature? {
        return exists() ? TemperatureParser().from(json: self) : nil
    }
    
    var split : Split? {
        return exists() ? SplitParser().from(json: self) : nil
    }
    
    var splitArray : EquatableArray<Split>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.split }) : nil
    }
    
    var segmentEffort : SegmentEffort? {
        return exists() ? SegmentEffortParser().from(json: self) : nil
    }
    
    var segmentEffortArray : EquatableArray<SegmentEffort>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.segmentEffort }) : nil
    }
    
    var gender : Gender? {
        return exists() ? GenderParser().from(json: self) : nil
    }
    
    var friendStatus : FriendStatus? {
        return exists() ? FriendStatusParser().from(json: self) : nil
    }
    
    var athleteType : AthleteType? {
        return exists() ? AthleteTypeParser().from(json: self) : nil
    }
    
    var measurementPreference : MeasurementPreference? {
        return exists() ? MeasurementPreferenceParser().from(json: self) : nil
    }
    
    var club : Club? {
        return exists() ? ClubParser().from(json: self) : nil
    }
    
    var clubArray : EquatableArray<Club>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.club }) : nil
    }
    
    var clubType : ClubType? {
        return exists() ? ClubTypeParser().from(json: self) : nil
    }
    
    var skillLevel : SkillLevel? {
        return exists() ? SkillLevelParser().from(json: self) : nil
    }
    
    var terrain : Terrain? {
        return exists() ? TerrainParser().from(json: self) : nil
    }
    
    var frameType : FrameType? {
        return exists() ? FrameTypeParser().from(json: self) : nil
    }
    
    var interval : Interval<Double>? {
        return exists() ? IntervalDoubleParser().from(json: self) : nil
    }
    
    var intervalArray : EquatableArray<Interval<Double>>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.interval }) : nil
    }
    
    var membership : Membership? {
        return exists() ? MembershipParser().from(json: self) : nil
    }
    
    var leaderboardEntry : LeaderboardEntry? {
        return exists() ? LeaderboardEntryParser().from(json: self) : nil
    }
    
    var leaderboardEntryArray : EquatableArray<LeaderboardEntry>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.leaderboardEntry }) : nil
    }
    
    var photoSource : PhotoSource? {
        return exists() ? PhotoSourceParser().from(json: self) : nil
    }
    
    var primaryPhoto : PrimaryPhoto? {
        return exists() ? PrimaryPhotoParser().from(json: self) : nil
    }
    
    var imageURLs : [String : String]? {
        let pairs : [(String, String)] = self.map { key, value in (key, value.string!) }
        var urls = [String : String]()
        pairs.forEach{ urls[$0.0] = $0.1 }
        return urls
    }
    
    var routeType : RouteType? {
        return exists() ? RouteTypeParser().from(json: self) : nil
    }
    
    var routeSubtype : RouteSubtype? {
        return exists() ? RouteSubtypeParser().from(json: self) : nil
    }
    
    var segment : Segment? {
        return exists() ? SegmentParser().from(json: self) : nil
    }
    
    var segmentArray : EquatableArray<Segment>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.segment }) : nil
    }
    
    var percentage : Percentage? {
        return exists() ? PercentageParser().from(json: self) : nil
    }
    
    var totals : Totals? {
        return exists() ? TotalsParser().from(json: self) : nil
    }
    
    var streamType : StreamType? {
        return exists() ? StreamTypeParser().from(json: self) : nil
    }
    
    var seriesType : SeriesType? {
        return exists() ? SeriesTypeParser().from(json: self) : nil
    }
    
    var resolution : Resolution? {
        return exists() ? ResolutionParser().from(json: self) : nil
    }
    
    var heartRate : HeartRate? {
        return exists() ? HeartRateParser().from(json: self) : nil
    }
    
    var power : Power? {
        return exists() ? PowerParser().from(json: self) : nil
    }
    
    var timedInterval : TimedInterval<Double>? {
        return exists() ? TimedDoubleIntervalParser().from(json: self) : nil
    }
    
    var timedIntervalArray : EquatableArray<TimedInterval<Double>>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.timedInterval }) : nil
    }
    
    var zones : Zones? {
        return exists() ? ZonesParser().from(json: self) : nil
    }
    
    var zonesArray : EquatableArray<Zones>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.zones }) : nil
    }
    
    var stats : Stats? {
        return exists() ? StatsParser().from(json: self) : nil
    }
    
    var activityZone : ActivityZone? {
        return exists() ? ActivityZoneParser().from(json: self) : nil
    }
    
    var activityZoneArray : EquatableArray<ActivityZone>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.activityZone }) : nil
    }
    
    var activityLap : ActivityLap? {
        return exists() ? ActivityLapParser().from(json: self) : nil
    }
    
    var activityLapArray : EquatableArray<ActivityLap>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.activityLap }) : nil
    }
    
    var photo : Photo? {
        return exists() ? PhotoParser().from(json: self) : nil
    }
    
    var photoArray : EquatableArray<Photo>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.photo }) : nil
    }
    
    var comment : Comment? {
        return exists() ? CommentParser().from(json: self) : nil
    }
    
    var commentArray : EquatableArray<Comment>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.comment }) : nil
    }
    
    var announcement : Announcement? {
        return exists() ? AnnouncementParser().from(json: self) : nil
    }
    
    var announcementArray : EquatableArray<Announcement>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.announcement }) : nil
    }
    
    var event : Event? {
        return exists() ? EventParser().from(json: self) : nil
    }
    
    var eventArray : EquatableArray<Event>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.event }) : nil
    }
    
    var joinResult : JoinResult? {
        return exists() ? JoinResultParser().from(json: self) : nil
    }
    
    var leaveResult : LeaveResult? {
        return exists() ? LeaveResultParser().from(json: self) : nil
    }
    
    var route : Route? {
        return exists() ? RouteParser().from(json: self) : nil
    }
    
    var routeArray : EquatableArray<Route>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.route }) : nil
    }
    
    var leaderboard : Leaderboard? {
        return exists() ? LeaderboardParser().from(json: self) : nil
    }
    
    var stream : Stream? {
        return exists() ? StreamParser().from(json: self) : nil
    }
    
    var streamArray : EquatableArray<Stream>? {
        return exists() ? EquatableArray(array: self.compactMap{ $1.stream }) : nil
    }
    
    var uploadStatus : UploadStatus? {
        return exists() ? UploadStatusParser().from(json: self) : nil
    }
    
    var token : Token? {
        return exists() ? TokenParser().from(json: self) : nil
    }
    
    var loginResult : LoginResult? {
        return exists() ? LoginResultParser().from(json: self) : nil
    }
    
    var exploreResult : ExploreResult? {
        return exists() ? ExploreResultParser().from(json: self) : nil
    }
}
