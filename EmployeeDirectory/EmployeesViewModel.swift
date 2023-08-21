//
//  EmployeesViewModel.swift
//  EmployeeDirectory
//
//  Created by Sameer Shaligram on 2023-08-12.
//

import Foundation

class EmployeesViewModel: ObservableObject {
    @Published var employees: [Employee] = []
    @Published var searchText = ""
    private var cachedEmployees: [Employee] = []
    
    var filteredEmployees: [Employee] {
            if searchText.isEmpty {
                return employees
            } else {
                return employees.filter {
                    $0.full_name.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    
    init() {
        fetchData()
    }

    func fetchData() {
        // Fetch data from the JSON endpoint, parse it, and update employees
        guard let url = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json") else {
                return
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Error fetching data: \(error)")
                    return
                }
                
                guard let data = data else {
                    print("No data received.")
                    return
                }

                do {
                    let employeesData = try JSONDecoder().decode(EmployeesData.self, from: data)
                        DispatchQueue.main.async {
                            self.employees = employeesData.employees
                            self.cachedEmployees = employeesData.employees
                        }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }.resume()
    }

    func refreshData() {
        // Refresh employee data from the local cache
        self.employees = self.cachedEmployees
    }
    
    func searchEmployees() {
            // Filter employees based on the search text
        if searchText.isEmpty {
                employees = cachedEmployees
            } else {
                employees = cachedEmployees.filter {
                    $0.full_name.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
}
