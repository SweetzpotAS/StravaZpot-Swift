//
//  PaginatedRequest.swift
//  StravaZpot
//
//  Created by Tomás Ruiz López on 3/11/16.
//  Copyright © 2016 SweetZpot AS. All rights reserved.
//

import Foundation

protocol PaginatedRequest : class {
    var page : Int? { get set }
    var perPage : Int? { get set }
}

extension PaginatedRequest {
    func of(page: Int, itemsPerPage : Int) -> Self {
        self.page = page
        self.perPage = itemsPerPage
        return self
    }
    
    func pageParameters() -> [String : Any?] {
        return [ "page" : self.page,
                 "per_page" : self.perPage ].flatten()
    }
}
