//
//  EEPayRow.swift
//  SUIPlayground_1
//
//  Created by Sadananda P on 6/27/19.
//  Copyright © 2019 Sadananda P. All rights reserved.
//

import SwiftUI

struct EEPayRowView : View {
    
    @State var selection: String = ""
    @State var isOn = false
    
    var body: some View {
        VStack {
        
        HStack {
            Circle()
                .fill(Color.gray)
                .frame(width: 50, height: 50)
                .overlay(Text("SP").font(.title).color(.white))
            
            VStack(alignment: .leading) {
                Text("Sadnanda Pattana")
            }
            Spacer()
        }.padding()
            
        Divider()
        
        HStack {
            VStack(alignment: .leading) {
                Text("Standard rate")
                Text("$99/hour")
            }
            
            
            Spacer()
        }.padding()
        
    }
       
    }
}



#if DEBUG
struct EEPayRowView_Previews : PreviewProvider {
    static var previews: some View {
        EEPayRowView().frame(height: 150)
    }
}
#endif
