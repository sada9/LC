//
//  NumberPad.swift
//  SUIPlayground_1
//
//  Created by Sadananda P on 7/12/19.
//  Copyright © 2019 Sadananda P. All rights reserved.
//

import SwiftUI

struct NumberPad : View {
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            HStack(spacing: 0) {
                padButton("1")
                Spacer()
                padButton("2")
                Spacer()
                padButton("3")
            }.padding()
            
            HStack(spacing: 0) {
                padButton("4")
                Spacer()
                padButton("5")
                Spacer()
               padButton("6")
            }.padding()
            
            HStack(spacing: 0) {
               padButton("7")
                Spacer()
                padButton("8")
                Spacer()
                padButton("9")
            }.padding()
            
            HStack(alignment: .center) {
                 padButton(".")
                Spacer()
                padButton("0")
                Spacer()
                padButton("<<")
            }.padding()
            
            }
    }
    
    func padButton(_ text: String) -> some View {
        
        Button(action: { }) {
            Text(text).font(Font.system(.largeTitle)).color(.black)
        }.frame(width: 44, height: 44)
        
    }
}

//here is another way

//GeometryReader { geometry in
//    HStack(spacing: 0) {
//        ForEach([a, b, c]) { n in
//            Button(action: { self.add(n) }) { Text("\(n)") }
//                .frame(width: geometry.size.width/3)
//        }
//    }
//    }.frame(height: 80)

#if DEBUG
struct NumberPad_Previews : PreviewProvider {
    static var previews: some View {
        NumberPad()
    }
}
#endif
