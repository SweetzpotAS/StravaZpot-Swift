//
//  ClubAPI.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ClubAPI {
    private let client : HTTPClient
    
    public init(client : HTTPClient) {
        self.client = client
    }
    
    public func retrieveClub(withID id : Int) -> RetrieveClubRequest {
        return RetrieveClubRequest(client: client, id: id)
    }
    
    public func listClubAnnouncements(withID id : Int) -> ListClubAnnouncementsRequest {
        return ListClubAnnouncementsRequest(client: client, id: id)
    }
    
    public func listClubGroupEvents(withID id : Int) -> ListClubGroupEventsRequest {
        return ListClubGroupEventsRequest(client: client, id: id)
    }
}
