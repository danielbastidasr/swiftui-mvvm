//
//  Detail.swift
//  MVVM-SwiftUI
//
//  Copyright © 2019 Daniel Bastidas. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    let tipster:String
    
    var body: some View {
        Text("Tipster Name: \(tipster)")
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(tipster: "Tipster Name")
    }
}
