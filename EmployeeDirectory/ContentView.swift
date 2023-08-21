//
//  ContentView.swift
//  EmployeeDirectory
//
//  Created by Sameer Shaligram on 2023-08-12.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasOnboarded") private var hasOnboarded = false

       var body: some View {
           Group {
               if !hasOnboarded {
                   OnboardingView()
               } else {
                   MainTabView()
               }
           }
       }
}

#Preview {
    ContentView()
}
