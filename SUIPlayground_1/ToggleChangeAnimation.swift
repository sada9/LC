//
//  ToggleChangeAnimation.swift
//  SUIPlayground_1
//
//  Created by Sadananda P on 7/7/19.
//  Copyright © 2019 Sadananda P. All rights reserved.
//

import SwiftUI
import Combine

struct ToggleChangeAnimation : View {
    @ObjectBinding var settingsStore: SettingsStore
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $settingsStore.settingActivated) {
                    Text("Setting Activated")
                }
                
                if settingsStore.settingActivated {
                    withAnimation() {
                        VStack(alignment: .leading) {
                            Text("Speed Control")
                            HStack {
                                Image(systemName: "tortoise")
                                Slider(value: .constant(10), from: 0, through: 50, by: 1)
                                Image(systemName: "hare")
                            }
                            }.transition(.opacity)
                    }
                    
                 }
             }.navigationBarTitle(Text("Settings"))
            }
     
    }
}

class SettingsStore: BindableObject {
    
    let didChange = PassthroughSubject<Void, Never>()
    
    var settingActivated: Bool = UserDefaults.settingActivated {
        didSet {
            
            UserDefaults.settingActivated = settingActivated
            
            didChange.send()
        }
    }
}

extension UserDefaults {
    
    private struct Keys {
        static let settingActivated = "SettingActivated"
    }
    
    static var settingActivated: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.settingActivated)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Keys.settingActivated)
        }
    }
}

#if DEBUG
struct ToggleChangeAnimation_Previews : PreviewProvider {
    static var previews: some View {
        ToggleChangeAnimation(settingsStore: SettingsStore())
    }
}
#endif
