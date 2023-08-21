//
//  EmployeeModel.swift
//  EmployeeDirectory
//
//  Created by Sameer Shaligram on 2023-08-12.
//

import Foundation

struct Employee: Identifiable, Decodable {
    let uuid: String
    let full_name: String
    let phone_number: String
    let email_address: String
    let biography: String
    let photo_url_small: String
    let photo_url_large: String
    let team: String
    let employee_type: String

    var formattedEmployeeType: String {
        switch employee_type {
        case "FULL_TIME":
            return "Full Time"
        case "PART_TIME":
            return "Part Time"
        case "CONTRACTOR":
            return "Contractor"
        default:
            return "Unknown"
        }
    }
    
    var photoURLLarge: URL? {
            return URL(string: photo_url_large)
        }
    
    var id: String { uuid }
}
