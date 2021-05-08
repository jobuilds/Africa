//
//  ContentView.swift
//  Africa
//
//  Created by Jeren Ott on 3/23/21.
//

import SwiftUI

struct ContentView: View {
    //Properties
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive: Bool = false
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    
    @State private var gridColumn: Int = 1
    
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //Functions
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid number: \(gridColumn)")
        
        //Toolbar Image
        switch gridColumn {
        case 1: toolbarIcon = "square.grid.2x2"
        case 2: toolbarIcon = "square.grid.3x2"
        case 3: toolbarIcon = "rectangle.grid.1x2"
        default: toolbarIcon = "square.grid.2x2"
        }//switch gridColumn
    }//gridSwitch
    
    //Basic gridLayout
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    var body: some View {
        //Body
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }//Link
                        }//Loop
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    }//List
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }//NavigationLink
                            }//Loop
                        }//LazyVGrid
                        .padding(10)
                        .animation(.easeIn)
                    }//ScrollView
                }//Condition
            }//Group
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 16) {
                        //List
                        Button(action: {
                            print("List view is activated")
                            isGridViewActive = false
                            hapticImpact.impactOccurred()
                        }) {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }//List Button
                        
                        //Grid
                        Button(action: {
                            print("Grid view is activated")
                            isGridViewActive = true
                            hapticImpact.impactOccurred()
                            gridSwitch()
                        }) {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }//Grid Button
                    }//HStack
                }//ToolbarItem
            }//toolbar
        }//NavigationView
    }
}

//Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
