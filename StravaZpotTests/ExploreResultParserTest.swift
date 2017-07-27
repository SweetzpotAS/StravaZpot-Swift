//
//  ExploreResultParserTest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 27/7/17.
//  Copyright © 2017 SweetZpot AS. All rights reserved.
//

import XCTest
import Nimble
import SwiftyJSON
@testable import StravaZpot

class ExploreResultParserTest: XCTestCase {
    
    func testExploreResultParsedCorrectly() {
        let json = JSON.parse(EXPLORE_RESULT_JSON)
        let parser = ExploreResultParser()
        
        let result = parser.from(json: json)
        expect(result.segments.array.count).to(equal(10))
    }
    
    let EXPLORE_RESULT_JSON = "{\n" +
        "  \"segments\": [\n" +
        "    {\n" +
        "      \"id\": 5462122,\n" +
        "      \"resource_state\": 2,\n" +
        "      \"name\": \"Traditions Downhill\",\n" +
        "      \"climb_category\": 0,\n" +
        "      \"climb_category_desc\": \"NC\",\n" +
        "      \"avg_grade\": -1.2,\n" +
        "      \"start_latlng\": [\n" +
        "        30.599526,\n" +
        "        -96.385803\n" +
        "      ],\n" +
        "      \"end_latlng\": [\n" +
        "        30.612589,\n" +
        "        -96.397798\n" +
        "      ],\n" +
        "      \"elev_difference\": 31.3,\n" +
        "      \"distance\": 2054,\n" +
        "      \"points\": \"_nwyDhjhkQi@v@w@zAkB|B}AvAgCfBuAx@_@\\\\eAnAYb@mAvAmAbBq@t@kAxAw@bAIPqCnDo@`BkAxDS`@e@h@[T]Ni@H]B_@Ck@IyA_@mAYq@CaEVmBFe@Dc@Pa@\\\\MRSf@GVoAtKKp@Sj@KR]d@o@j@OJc@Ns@Ha@Bc@E_@I\",\n" +
        "      \"starred\": false\n" +
        "    },\n" +
        "    {\n" +
        "      \"id\": 9583574,\n" +
        "      \"resource_state\": 2,\n" +
        "      \"name\": \"Into the Mines of Moria\",\n" +
        "      \"climb_category\": 0,\n" +
        "      \"climb_category_desc\": \"NC\",\n" +
        "      \"avg_grade\": -0.7,\n" +
        "      \"start_latlng\": [\n" +
        "        30.613478,\n" +
        "        -96.344982\n" +
        "      ],\n" +
        "      \"end_latlng\": [\n" +
        "        30.611537,\n" +
        "        -96.34709\n" +
        "      ],\n" +
        "      \"elev_difference\": 9.8,\n" +
        "      \"distance\": 298.7,\n" +
        "      \"points\": \"eezyDdk`kQh@d@zAz@pDpFVXf@d@JN\",\n" +
        "      \"starred\": false\n" +
        "    },\n" +
        "    {\n" +
        "      \"id\": 5436847,\n" +
        "      \"resource_state\": 2,\n" +
        "      \"name\": \"F&B Road - pre stoplight glitch...\",\n" +
        "      \"climb_category\": 0,\n" +
        "      \"climb_category_desc\": \"NC\",\n" +
        "      \"avg_grade\": -0.3,\n" +
        "      \"start_latlng\": [\n" +
        "        30.621958,\n" +
        "        -96.358991\n" +
        "      ],\n" +
        "      \"end_latlng\": [\n" +
        "        30.611386,\n" +
        "        -96.370663\n" +
        "      ],\n" +
        "      \"elev_difference\": 6.3,\n" +
        "      \"distance\": 1626.2,\n" +
        "      \"points\": \"ez{yDvbckQ~BfC`@f@d@b@~@bAZV`AdAnBxBf@r@vA~AzDbEfBpBfClC`CzCtDdEV\\\\d@d@vAdBXXz@fAjDrDvAjBd@d@^h@jArA^l@dBtB\",\n" +
        "      \"starred\": false\n" +
        "    },\n" +
        "    {\n" +
        "      \"id\": 1190203,\n" +
        "      \"resource_state\": 2,\n" +
        "      \"name\": \"Silver hill-hill pt2\",\n" +
        "      \"climb_category\": 0,\n" +
        "      \"climb_category_desc\": \"NC\",\n" +
        "      \"avg_grade\": 2.2,\n" +
        "      \"start_latlng\": [\n" +
        "        30.642852,\n" +
        "        -96.4535356\n" +
        "      ],\n" +
        "      \"end_latlng\": [\n" +
        "        30.6414042,\n" +
        "        -96.4551745\n" +
        "      ],\n" +
        "      \"elev_difference\": 4.9,\n" +
        "      \"distance\": 224.6,\n" +
        "      \"points\": \"y|_zDrqukQ`HfI\",\n" +
        "      \"starred\": false\n" +
        "    },\n" +
        "    {\n" +
        "      \"id\": 12320594,\n" +
        "      \"resource_state\": 2,\n" +
        "      \"name\": \"Windmeadows Dr. to Barron Rd.\",\n" +
        "      \"climb_category\": 0,\n" +
        "      \"climb_category_desc\": \"NC\",\n" +
        "      \"avg_grade\": 0.7,\n" +
        "      \"start_latlng\": [\n" +
        "        30.562544,\n" +
        "        -96.289809\n" +
        "      ],\n" +
        "      \"end_latlng\": [\n" +
        "        30.560465,\n" +
        "        -96.287359\n" +
        "      ],\n" +
        "      \"elev_difference\": 3.3,\n" +
        "      \"distance\": 330,\n" +
        "      \"points\": \"{fpyDhrujQTOb@o@NOb@s@|AkBzDaFVW\",\n" +
        "      \"starred\": false\n" +
        "    },\n" +
        "    {\n" +
        "      \"id\": 8977750,\n" +
        "      \"resource_state\": 2,\n" +
        "      \"name\": \"graham up hill\",\n" +
        "      \"climb_category\": 0,\n" +
        "      \"climb_category_desc\": \"NC\",\n" +
        "      \"avg_grade\": 2.2,\n" +
        "      \"start_latlng\": [\n" +
        "        30.551135,\n" +
        "        -96.329607\n" +
        "      ],\n" +
        "      \"end_latlng\": [\n" +
        "        30.553431,\n" +
        "        -96.32701\n" +
        "      ],\n" +
        "      \"elev_difference\": 8,\n" +
        "      \"distance\": 355.6,\n" +
        "      \"points\": \"q_nyD`k}jQyDkEqG{H\",\n" +
        "      \"starred\": false\n" +
        "    },\n" +
        "    {\n" +
        "      \"id\": 3591056,\n" +
        "      \"resource_state\": 2,\n" +
        "      \"name\": \"Roller Coaster Trail-1\",\n" +
        "      \"climb_category\": 0,\n" +
        "      \"climb_category_desc\": \"NC\",\n" +
        "      \"avg_grade\": -0.4,\n" +
        "      \"start_latlng\": [\n" +
        "        30.703297,\n" +
        "        -96.465861\n" +
        "      ],\n" +
        "      \"end_latlng\": [\n" +
        "        30.704132,\n" +
        "        -96.460136\n" +
        "      ],\n" +
        "      \"elev_difference\": 7.1,\n" +
        "      \"distance\": 893.5,\n" +
        "      \"points\": \"qvkzDt~wkQEDBIJERFJXPGRWNg@Cg@@SRENON[A}@@a@Ki@a@w@ASFMVOP[@]Ma@k@s@CWLUXKRBAb@HLLDHP\\\\G@SQe@I[BWEY[c@gAk@{@q@KYC]k@y@LMB_@Q]UU[QUS?IGQOQQICECDCCCG?[\",\n" +
        "      \"starred\": false\n" +
        "    },\n" +
        "    {\n" +
        "      \"id\": 11587059,\n" +
        "      \"resource_state\": 2,\n" +
        "      \"name\": \"The downhill surge into Bryan\",\n" +
        "      \"climb_category\": 0,\n" +
        "      \"climb_category_desc\": \"NC\",\n" +
        "      \"avg_grade\": -0.5,\n" +
        "      \"start_latlng\": [\n" +
        "        30.698618,\n" +
        "        -96.40323\n" +
        "      ],\n" +
        "      \"end_latlng\": [\n" +
        "        30.681176,\n" +
        "        -96.388355\n" +
        "      ],\n" +
        "      \"elev_difference\": 20.8,\n" +
        "      \"distance\": 2501.1,\n" +
        "      \"points\": \"iyjzDdwkkQxAkBxHgKbBwBxAaBbBsAvByA|A_B`EqExLgNl@k@pA}@tAe@jB]b@EjBCrDRtCCPChBe@v@[r@a@tAoAhKsLdDwDpCoDzBkC\",\n" +
        "      \"starred\": false\n" +
        "    },\n" +
        "    {\n" +
        "      \"id\": 10100990,\n" +
        "      \"resource_state\": 2,\n" +
        "      \"name\": \"Copperfield South \",\n" +
        "      \"climb_category\": 0,\n" +
        "      \"climb_category_desc\": \"NC\",\n" +
        "      \"avg_grade\": 0,\n" +
        "      \"start_latlng\": [\n" +
        "        30.661623,\n" +
        "        -96.302771\n" +
        "      ],\n" +
        "      \"end_latlng\": [\n" +
        "        30.65077,\n" +
        "        -96.295786\n" +
        "      ],\n" +
        "      \"elev_difference\": 8.7,\n" +
        "      \"distance\": 1874.3,\n" +
        "      \"points\": \"crczDjcxjQ^Vz@h@JLLHnA`Ah@Z~@t@f@Xn@N\\\\FnB@RBNCl@Db@@n@F^JLBlCt@h@HpAd@hATtA\\\\LFL?l@LR@JE\\\\D`AINCl@UXUHOp@y@FMhAqA^i@r@yAh@gBRe@TgAHQd@_CFiA@kAL{APuA@e@DOF}@HmBHa@NeAJ_@Lw@L]@M^gAb@_BLY^e@Lc@AGD[TUTKPMNUBM\",\n" +
        "      \"starred\": false\n" +
        "    },\n" +
        "    {\n" +
        "      \"id\": 12038469,\n" +
        "      \"resource_state\": 2,\n" +
        "      \"name\": \"60 heading east\",\n" +
        "      \"climb_category\": 0,\n" +
        "      \"climb_category_desc\": \"NC\",\n" +
        "      \"avg_grade\": 0.2,\n" +
        "      \"start_latlng\": [\n" +
        "        30.539395,\n" +
        "        -96.448925\n" +
        "      ],\n" +
        "      \"end_latlng\": [\n" +
        "        30.605207,\n" +
        "        -96.360478\n" +
        "      ],\n" +
        "      \"elev_difference\": 33.4,\n" +
        "      \"distance\": 11332.2,\n" +
        "      \"points\": \"evkyDxttkQf@m@DQUgA]e@qFmGkOyOoAyAs^y_@qSqTsA{AeD{D_QqTsAeB}@sAcAkBgA_Cm@eBaA_EeVomA}@aD}@uBc@aAu@wAcAaBsCoD{\\\\ga@_FwF_KsKaG{Gob@ki@oGqHwHkIeJeKuRkVoU}XeDcEeGgIqDmFUu@IO{AoBqCmEgCgEqAgCU[a@a@oHiMaFcIgAuB{GiKy@mAeAiAqAaBuL{OuCaD_DwD\",\n" +
        "      \"starred\": false\n" +
        "    }\n" +
        "  ]\n" +
    "}"
}
