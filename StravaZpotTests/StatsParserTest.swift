//
//  StatsParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 31/10/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class StatsParserTest: XCTestCase {
    
    func testJSONisParsedToStats() {
        let json = JSON(parseJSON: "{" +
            "  \"biggest_ride_distance\": 0," +
            "  \"biggest_climb_elevation_gain\": 0," +
            "  \"recent_ride_totals\": {" +
            "    \"count\": 0," +
            "    \"distance\": 0," +
            "    \"moving_time\": 0," +
            "    \"elapsed_time\": 0," +
            "    \"elevation_gain\": 0," +
            "  }," +
            "  \"recent_run_totals\": {" +
            "    \"count\": 0," +
            "    \"distance\": 0," +
            "    \"moving_time\": 0," +
            "    \"elapsed_time\": 0," +
            "    \"elevation_gain\": 0," +
            "  }," +
            "  \"recent_swim_totals\": {" +
            "    \"count\": 0," +
            "    \"distance\": 0," +
            "    \"moving_time\": 0," +
            "    \"elapsed_time\": 0," +
            "    \"elevation_gain\": 0.0," +
            "  }," +
            "  \"ytd_ride_totals\": {" +
            "    \"count\": 0," +
            "    \"distance\": 0," +
            "    \"moving_time\": 0," +
            "    \"elapsed_time\": 0," +
            "    \"elevation_gain\": 0" +
            "  }," +
            "  \"ytd_run_totals\": {" +
            "    \"count\": 0," +
            "    \"distance\": 0," +
            "    \"moving_time\": 0," +
            "    \"elapsed_time\": 0," +
            "    \"elevation_gain\": 0" +
            "  }," +
            "  \"ytd_swim_totals\": {" +
            "    \"count\": 0," +
            "    \"distance\": 0," +
            "    \"moving_time\": 0," +
            "    \"elapsed_time\": 0," +
            "    \"elevation_gain\": 0" +
            "  }," +
            "  \"all_ride_totals\": {" +
            "    \"count\": 0," +
            "    \"distance\": 0," +
            "    \"moving_time\": 0," +
            "    \"elapsed_time\": 0," +
            "    \"elevation_gain\": 0" +
            "  }," +
            "  \"all_run_totals\": {" +
            "    \"count\": 0," +
            "    \"distance\": 0," +
            "    \"moving_time\": 0," +
            "    \"elapsed_time\": 0," +
            "    \"elevation_gain\": 0" +
            "  }," +
            "  \"all_swim_totals\": {" +
            "    \"count\": 0," +
            "    \"distance\": 0," +
            "    \"moving_time\": 0," +
            "    \"elapsed_time\": 0," +
            "    \"elevation_gain\": 0" +
            "  }" +
            "}")
        let parser = StatsParser()
        
        let result = parser.from(json: json)
        let totals = Totals(count: 0, distance: Distance(meters:0), movingTime: Time(seconds:0), elapsedTime: Time(seconds:0), elevationGain: Distance(meters:0), achievementCount: nil)
        let expected = Stats(biggestRideDistance: Distance(meters: 0),
                             biggestClimbElevationGain: Distance(meters: 0),
                             recentRideTotals: totals,
                             recentRunTotals: totals,
                             recentSwimTotals: totals,
                             yearToDateRideTotals: totals,
                             yearToDateRunTotals: totals,
                             yearToDateSwimTotals: totals,
                             allRideTotals: totals,
                             allRunTotals: totals,
                             allSwimTotals: totals)
        
        expect(result).to(equal(expected))
    }
    
}
