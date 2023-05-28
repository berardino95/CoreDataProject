//
//  FilterType.swift
//  CoreDataProject
//
//  Created by Berardino Chiarello on 26/05/23.
//

import Foundation

enum FilteringType : String, CaseIterable, Identifiable {
    case contains = "contains"//CONTAINS
    case beginsWith = "begin with"//BEGINSWITH
    case endswith = "ends with"//ENDSWITH
    
    var id: Self{ self }
}

extension FilteringType{
    
    var stringComparison : String {
        switch self {
        case .contains: return "CONTAINS"
        case .beginsWith: return "BEGINSWITH"
        case .endswith: return "ENDSWITH"
        }
    }
    
}
