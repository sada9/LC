//
//  ContentView.swift
//  SUIPlayground_1
//
//  Created by Sadananda P on 6/25/19.
//  Copyright © 2019 Sadananda P. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var selection: String = ""
    @State var isOn = false
    
    var body: some View {
        HStack {
         Text("23")
        }
    }
}



#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
