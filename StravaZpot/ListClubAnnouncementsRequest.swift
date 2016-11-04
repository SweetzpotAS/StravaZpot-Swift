//
//  ListClubAnnouncementsRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 4/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class ListClubAnnouncementsRequest {
    private let client : HTTPClient
    private let id : Int
    
    init(client : HTTPClient, id : Int) {
        self.client = client
        self.id = id
    }
    
    public func execute(callback : @escaping (StravaResult<EquatableArray<Announcement>>) -> ()) {
        client.get(url: "clubs/\(id)/announcements", parameters: [:]) { result in
            switch(result) {
            case let .success(json):
                if let announcementArray = json.announcementArray {
                    callback(.success(announcementArray))
                } else {
                    callback(.error(.apiError(message: "Error parsing announcement list")))
                }
            case let .error(content):
                callback(.error(content))
            }
        }
    }
}
