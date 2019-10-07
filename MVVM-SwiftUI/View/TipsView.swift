//
//  TipsView.swift
//  MVVM-SwiftUI
//
//  Copyright © 2019 Daniel Bastidas. All rights reserved.
//

import SwiftUI

struct TipsView: View {
    
    @ObservedObject var tipsViewModel:TipsViewModel
    @EnvironmentObject var authService:AuthService
    
    var body: some View {
        ZStack{
            List{
                ForEach(tipsViewModel.tips, id: \.self) { tip in
                    Text("\(tip)")
                    .foregroundColor(.black)
                    .padding(10)
                }
            }
            if tipsViewModel.tips.count == 0 {
                LoadingView(isAnimating: .constant(true), style: .large)
            }
        }
        .navigationBarTitle(Text("Tips"))
        .onAppear {
            self.tipsViewModel.getTipList(uid: self.authService.getUid())
        }
        .navigationBarItems(trailing: LogOutButton(logOutFunction: authService.signOut))
    }
}


// MARK:- Preview
struct Tips_Previews: PreviewProvider {
    static var previews: some View {
        TipsView(tipsViewModel: TipsViewModel(dataService: DataService()))
    }
}
