//
//  FilterKey.swift
//  CoreDataProject
//
//  Created by Berardino Chiarello on 26/05/23.
//

import Foundation

enum FilterKey: String, CaseIterable, Identifiable {
    case firstName = "firstName"
    case lastName = "lastName"
    
    var id: Self { self }
      
}

extension FilterKey {
    var text : String {
        switch self {
        case .firstName: return "first name"
        case .lastName: return "last name"
        }
    }
}

