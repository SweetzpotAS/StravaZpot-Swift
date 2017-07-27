//
//  LeaveClubRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 7/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

public class LeaveClubRequest : PostRequest<LeaveResult> {
    init(client : HTTPClient, id : Int) {
        super.init(client: client, url: "clubs/\(id)/leave", parse: { $0.leaveResult })
    }
}
