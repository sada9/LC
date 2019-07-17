//
//  RoundedCellTry.swift
//  SUIPlayground_1
//
//  Created by Sadananda P on 7/7/19.
//  Copyright © 2019 Sadananda P. All rights reserved.
//

import SwiftUI

struct RoundedCellTable: View {
    
    var body: some View {
        Group {
            List {
                
                Section(header: Text("Medical Details")) {
                    Text("Hello1 freaky world!")
                    Text("You are signed in.")
                 }
                
            }
            Spacer()
        }
    }
}


#if DEBUG
struct RoundedCellTable_Previews : PreviewProvider {
    static var previews: some View {
        RoundedCellTable()
    }
}
#endif
