//
//  PickerView.swift
//  SUIPlayground_1
//
//  Created by Sadananda P on 6/27/19.
//  Copyright © 2019 Sadananda P. All rights reserved.
//

import SwiftUI

struct PickerView : View {
    
    @State var selection: String = ""
    @State var isOn = false
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section {
                        Toggle(isOn: $isOn) {
                            Text("Bluetooth")
                        }
                        Picker(selection: $selection, label:
                            Text("Picker Name")
                            , content: {
                                Text( isOn ? "Bluetooth is On" : "Bluetooth is Off").tag(0)
                                Text("Value 2").tag(1)
                        })
                        
                    }
                }
            }
        }
    }
}
