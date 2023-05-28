//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Berardino Chiarello on 25/05/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var filterKey : FilterKey = .firstName
    @State private var filterValue = ""
    @State private var typeOfFiltering : FilteringType = .contains

    
    var body: some View {
        VStack {
            Form{
                Section{
                    Picker("Filter for:", selection: $filterKey) {
                        ForEach(FilterKey.allCases, id: \.self) { filter in
                            Text(filter.text)
                        }
                    }
                    Picker("Filter criteria:", selection: $typeOfFiltering) {
                        ForEach(FilteringType.allCases) { filter in
                            Text(filter.rawValue)
                        }
                    }
                    TextField("\(filterKey.text) \(typeOfFiltering.rawValue): ", text: $filterValue)
                        .autocorrectionDisabled(true)
                } header: {
                    Text("Search criterium")
                }
                
                Section{
                    FilteredList(filterKey: filterKey,typeOfFiltering: typeOfFiltering, filterValue: filterValue) { (singer:Singer) in
                        Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
                    }
                }
                Section{
                    Button("Add singer") {
                        addSinger()
                    }
                }
            }
        }
    }
    
    func addSinger(){
        let singer1 = Singer(context: moc)
        singer1.firstName = "Taylor"
        singer1.lastName = "Swift"
        
        let singer2 = Singer(context: moc)
        singer2.firstName = "Vasco"
        singer2.lastName = "Rossi"
        
        let singer3 = Singer(context: moc)
        singer3.firstName = "Biagio"
        singer3.lastName = "Antonacci"
        
        let singer4 = Singer(context: moc)
        singer4.firstName = "Michael"
        singer4.lastName = "Bubble"
        
        try? moc.save()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
