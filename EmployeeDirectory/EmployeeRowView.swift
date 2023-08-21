//
//  EmployeeRowView.swift
//  EmployeeDirectory
//
//  Created by Sameer Shaligram on 2023-08-12.
//

import Foundation
import SwiftUI

struct EmployeeRowView: View {
    var employee: Employee
    var photoURL: URL
    @StateObject private var imageLoader = ImageLoader()
    
    var body: some View {
        
        HStack(spacing: 12) {
                    RemoteImage(url: photoURL)
                        .frame(width: 40, height: 40)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(employee.full_name)
                            .font(.headline)
                        Text(employee.team)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
        
    }
}

