//
//  DataFetcherService.swift
//  Nikitin
//
//  Created by Ivan Nikitin on 26.02.2020.
//  Copyright © 2020 Ivan Nikitin. All rights reserved.
//

import Foundation


class DataFetcherService {
    
    
    var networkDatataFetcher: DataFetcher
    
    init(networkDatataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.networkDatataFetcher = networkDatataFetcher
    }
    
    func fetchSchedule(completion: @escaping ([Schedule]?) -> Void) {
        let urlString = "https://sample.fitnesskit-admin.ru/schedule/get_group_lessons_v2/1/#"
        networkDatataFetcher.fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
}
