//
//  LoginForm.swift
//  SUIPlayground_1
//
//  Created by Sadananda P on 6/27/19.
//  Copyright © 2019 Sadananda P. All rights reserved.
//

import SwiftUI

struct AppContentView: View {
    
    @State var signInSuccess = false
    
    var body: some View {
        return Group {
            if signInSuccess {
                AppHome()
            }
            else {
                LoginFormView(signInSuccess: $signInSuccess)
            }
        }
    }
}

struct LoginFormView : View {
    
    @State private var userName: String = ""
    @State private var password: String = ""
    
    @State private var showError = false
    
    @Binding var signInSuccess: Bool
    
    var body: some View {
        VStack {
            HStack {
                Text("User name")
                TextField($userName, placeholder: Text("type here"))
            }.padding()
            
            HStack {
                Text(" Password")
                TextField($password, placeholder: Text("type here"))
                    .textContentType(.password)
            }.padding()
            
            Button(action: {
                // Your Auth logic
                if(self.userName == self.password) {
                    self.signInSuccess.toggle()
                }
                else {
                    self.showError = true
                }
                
            }) {
                Text("Sign in")
            }
            
            if showError {
                Text("Incorrect username/password").foregroundColor(Color.red)
            }
        }
    }
}

struct AppHome: View {
    
    var body: some View {
        VStack {
        Text("Hello freaky world!")
        Text("You are signed in.")
        }
    }
}



#if DEBUG
struct LoginFormView_Previews : PreviewProvider {
    static var previews: some View {
        AppContentView()
    }
}
#endif
