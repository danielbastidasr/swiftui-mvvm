//
//  DataService.swift
//  MVVM-SwiftUI
//
//  Copyright © 2019 Daniel Bastidas. All rights reserved.
//

import Foundation

class AuthService : ObservableObject {
    
    @Published var signedIn:Bool
    private var uid:String? = nil
    
    init(signedIn:Bool) {
        self.signedIn = signedIn
    }
    
    // Make sure the API calls once they are finished modify the values on the Main Thread
    func signIn() {
        self.signedIn = true
        self.uid = "USERIDSET"
    }
    
    func getUid() -> String? {
        if(self.signedIn){
            return self.uid
        }
        else{
            return nil
        }
    }
    
    func signOut(){
        self.signedIn = false
        self.uid = nil
    }
}
