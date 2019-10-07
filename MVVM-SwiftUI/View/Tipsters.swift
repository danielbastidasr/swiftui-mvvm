//
//  Tipsters.swift
//  MVVM-SwiftUI
//
//  Copyright © 2019 Daniel Bastidas. All rights reserved.
//

import SwiftUI

struct TipstersView: View {
    
    @ObservedObject var tipstersViewModel:TipstersViewModel
    @EnvironmentObject var authService:AuthService
    
    var body: some View {
        ZStack{
            List{
                ForEach(tipstersViewModel.tipsters, id: \.self) { tip in
                    NavigationLink(destination: DetailView(tipster: tip)) {
                        Text("\(tip)")
                            .padding(10)
                    }
                }
            }
            if tipstersViewModel.tipsters.count == 0 {
                LoadingView(isAnimating: .constant(true), style: .large)
            }
        }
        .onAppear {
            UITableView.appearance().separatorColor = .clear
            self.tipstersViewModel.getTipstersList(uid: self.authService.getUid())
        }
        .navigationBarTitle(Text("Tipsters"))
        .navigationBarItems(trailing: LogOutButton(logOutFunction: authService.signOut))
    }
}

// MARK:- Preview
struct Tipsters_Previews: PreviewProvider {
    static var previews: some View {
        TipstersView(tipstersViewModel: TipstersViewModel(dataService: DataService()))
    }
}
