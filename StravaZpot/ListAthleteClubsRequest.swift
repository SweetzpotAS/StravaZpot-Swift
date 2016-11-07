//
//  ListAthleteClubsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListAthleteClubsRequest : GetRequest<EquatableArray<Club>> {
    init(client : HTTPClient) {
        super.init(client: client, url: "athlete/clubs", parse: { $0.clubArray })
    }
}
