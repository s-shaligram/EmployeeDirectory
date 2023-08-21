//
//  EmployeesView.swift
//  EmployeeDirectory
//
//  Created by Sameer Shaligram on 2023-08-12.
//

import Foundation
import SwiftUI

struct EmployeesView: View {
    @ObservedObject var viewModel = EmployeesViewModel()

    var body: some View {
        NavigationView {
            VStack {
                
                SearchBar(text: $viewModel.searchText)
                    .padding(.horizontal)

                List(viewModel.filteredEmployees) { employee in
                    NavigationLink(destination: EmployeeDetailView(employee: employee)) {
                        EmployeeRowView(employee: employee, photoURL: URL(string: employee.photo_url_large)!)
                    }
                }
                .refreshable {
                    viewModel.refreshData()
                }
                .navigationTitle("Employees")
            }
        }
    }
}


