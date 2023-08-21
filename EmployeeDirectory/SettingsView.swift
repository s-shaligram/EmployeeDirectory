//
//  SettingsView.swift
//  EmployeeDirectory
//
//  Created by Sameer Shaligram on 2023-08-12.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "gearshape")
                    .font(.largeTitle)
                    .padding(.trailing)
                Text("App Settings")
                    .font(.title)
            }
            .padding()
            
            Text("Your Name: Sameer Shaligram")
            Text("Your Student Number: 1121361")
        }
    }
}

