//
//  ListView.swift
//  NYCSchools
//
//  Created by christopher.lubera on 3/15/23.
//

import SwiftUI

struct ListView: View {
    
    let listViewModel = ListViewModel()
    
    // A simple view that displays the list of schools, and takes you to a details view if you tap on a school
    var body: some View {
        NavigationView {
            List(listViewModel.listOfSchools()) { school in
                NavigationLink {
                    DetailView(school: school)
                } label: {
                    Text(school.returnSchoolName())
                }
            }
            .navigationTitle("Schools")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
