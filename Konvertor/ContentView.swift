//
//  ContentView.swift
//  Konvertor
//
//  Created by Marcel Saltiel on 23/10/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView
            {
                
            
            NavigationLink {
                KonverVzdialenostView()
            } label: {
                LinkView(topColor: .blue, bottomColor: .cyan, headerTitle: "Vzdialenost", titleImage: "imageKM")
            }
            
            NavigationLink {
                ContentObjemView()
            } label: {
                LinkView(topColor: .orange, bottomColor: .yellow, headerTitle: "Objem", titleImage: "imageML")
            }
                
            }
//            List {
//                NavigationLink("Vzdialenost", destination: KonverVzdialenostView())
//                NavigationLink ("Objem", destination: ContentObjemView())
//            }
            .navigationTitle("Konvertor")
        }
        .navigationViewStyle(.stack)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

