//
//  SearchBar.swift
//  EmployeeDirectory
//
//  Created by Sameer Shaligram on 2023-08-12.
//

import Foundation

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @ObservedObject var viewModel = EmployeesViewModel()

    var body: some View {
        HStack {
            TextField("Search employees", text: $text, onEditingChanged: { _ in
                viewModel.searchEmployees()
            })
            .padding(8)
            .background(Color(.systemGray5))
            .cornerRadius(8)
            .padding(.horizontal, 15)
            
            if !text.isEmpty {
                Button(action: {
                    text = ""
                    viewModel.searchEmployees() // Clear the search
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
            }
        }
    }
}


