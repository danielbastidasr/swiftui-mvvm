//
//  TipsViewModel.swift
//  MVVM-SwiftUI
//
//  Copyright © 2019 Daniel Bastidas. All rights reserved.
//

import Foundation
import SwiftUI

protocol TipsViewModelProtocol {
    func getTipList(uid:String?)
}

class TipsViewModel: TipsViewModelProtocol, ObservableObject{
    
    var dataService:DataService
    @Published var tips: [String] = []
    
    init(dataService:DataService) {
        self.dataService = dataService
    }
    
    func getTipList(uid: String?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
            [weak self] in
            self?.tips = self?.dataService.getTipList(uid: uid) ?? []
        })
    }
}
