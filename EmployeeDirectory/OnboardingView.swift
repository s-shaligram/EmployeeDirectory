//
//  OnboardingView.swift
//  EmployeeDirectory
//
//  Created by Sameer Shaligram on 2023-08-12.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasOnboarded") private var hasOnboarded = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Image(systemName: "person.3.fill")
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                    .padding(.bottom, 30)

                Text("Welcome to Employee Directory App!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()

                Text("Explore and manage your employee information with ease.")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()

                Spacer()

                Button(action: {
                    hasOnboarded = true
                }) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 50)
            }
            .padding()
        }
        .navigationBarHidden(true)
    }
}

