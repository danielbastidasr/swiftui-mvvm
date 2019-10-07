//
//  DataService.swift
//  MVVM-SwiftUI
//
//  Copyright © 2019 Daniel Bastidas. All rights reserved.
//

import Foundation
import SwiftUI

class DataService {
    
    // Get from API/Database
    func getTipList(uid:String?) -> [String] {
        if(uid != nil){
            return ["Hello World","Code Clean","Test it!"]
        }
        else{
            return []
        }
    }
    
    // Get from API/Database
    func getTipstersList(uid:String?) -> [String]{
        if(uid != nil){
            return ["Matt Vanderman","Daniel Bastidas","Craig Saxby"]
        }
        else{
            return []
        }
    }
}
