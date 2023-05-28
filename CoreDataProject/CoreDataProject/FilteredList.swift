//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Berardino Chiarello on 26/05/23.
//
import CoreData
import SwiftUI

struct FilteredList<T : NSManagedObject, Content : View>: View {
    
    @FetchRequest var fetchRequest : FetchedResults<T>
    let content : (T) -> Content


    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
            
        }
    }
    
    init(filterKey : FilterKey, typeOfFiltering: FilteringType, filterValue : String, @ViewBuilder content: @escaping (T) -> Content) {
        
        var sortDescriptor : NSSortDescriptor {
            return NSSortDescriptor(key: filterKey.rawValue, ascending: true)
        }
        
        
        var predicate : NSPredicate{
            if filterValue == "" {
                return NSPredicate(value: true)
            }
            return NSPredicate(format: "%K \(typeOfFiltering.stringComparison)[c] %@", filterKey.rawValue, filterValue)
        }
        
        
        _fetchRequest = FetchRequest<T>(sortDescriptors: [sortDescriptor], predicate: predicate, animation: .easeIn)
        self.content = content
    }
    
}
