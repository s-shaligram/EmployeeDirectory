//
//  EmployeeDetailView.swift
//  EmployeeDirectory
//
//  Created by Sameer Shaligram on 2023-08-12.
//

import Foundation
import SwiftUI

struct EmployeeDetailView: View {
    var employee: Employee

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 8) {
                    RemoteImage(url: employee.photoURLLarge!)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .shadow(radius: 6)
                    Text(employee.full_name)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .padding(.vertical)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Team:")
                        .font(.headline)
                    Text(employee.team)
                        .font(.subheadline)

                    Text("Employee Type:")
                        .font(.headline)
                    Text(employee.formattedEmployeeType)
                        .font(.subheadline)

                    // Add other employee details here

                    Divider() // Add a divider for separation

                    Text("Contact Information")
                        .font(.headline)
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.blue)
                        Text(employee.email_address)
                            .font(.subheadline)
                    }
                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundColor(.green)
                        Text(employee.phone_number)
                            .font(.subheadline)
                    }

                    Divider() // Add a divider for separation

                    Text("Biography")
                        .font(.headline)
                    Text(employee.biography)
                        .font(.subheadline)
                }
                .padding(.horizontal)
            }
            .padding()
            .navigationTitle(employee.full_name)
        }
    }
}


