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
    
    public func listAthleteClubs() -> ListAthleteClubsRequest {
        return ListAthleteClubsRequest(client: client)
    }
    
    public func listClubMembers(withID id : Int) -> ListClubMembersRequest {
        return ListClubMembersRequest(client: client, id: id)
    }
    
    public func listClubAdmins(withID id : Int) -> ListClubAdminsRequest {
        return ListClubAdminsRequest(client: client, id: id)
    }
    
    public func listClubActivities(withID id : Int, before : Int? = nil) -> ListClubActivitiesRequest {
        return ListClubActivitiesRequest(client: client, id: id, before: before)
    }
    
    public func joinClub(withID id : Int) -> JoinClubRequest {
        return JoinClubRequest(client: client, id: id)
    }
    
    public func leaveClub(withID id : Int) -> LeaveClubRequest {
        return LeaveClubRequest(client: client, id: id)
    }
}
