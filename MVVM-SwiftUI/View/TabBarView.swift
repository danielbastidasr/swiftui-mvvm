//
//  TabBarView.swift
//  MVVM-SwiftUI
//
//  Copyright © 2019 Daniel Bastidas. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    
    @EnvironmentObject var authService:AuthService
    var dataService:DataService
    var tipstersViewModel:TipstersViewModel
    var tipsViewModel:TipsViewModel
   
    init() {
        self.dataService = DataService()
        self.tipstersViewModel = TipstersViewModel(dataService: dataService)
        self.tipsViewModel = TipsViewModel(dataService: dataService)
    }
    
    var body: some View {
        
        TabView {
            NavigationView{
                TipstersView(tipstersViewModel: tipstersViewModel)
            }
            .tabItem {
                VStack{
                    Image("tipsters")
                    Text("Tipsters")
                }
            }
            NavigationView{
                TipsView(tipsViewModel: tipsViewModel)
            }
            .tabItem {
                VStack{
                    Image("tips")
                    Text("Tips")
                }
            }
        }
    }
}

struct LogOutButton: View {
    var logOutFunction:() -> Void

    var body: some View {
        Button(action: logOutFunction , label: {
            Text("Log Out")
        })
    }
}
// MARK:- Preview
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
