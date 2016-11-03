//
//  FriendAPI.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class FriendAPI {
    private let client : HTTPClient
    
    public init(client : HTTPClient) {
        self.client = client
    }
    
    public func listMyFriends() -> ListMyFriendsRequest {
        return ListMyFriendsRequest(client: client)
    }
    
    public func listAhtleteFriends(withID id : Int) -> ListAthleteFriendsRequest {
        return ListAthleteFriendsRequest(client: client, id: id)
    }
    
    public func listMyFollowers() -> ListMyFollowersRequest {
        return ListMyFollowersRequest(client: client)
    }
}
