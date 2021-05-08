//
//  InsertFactView.swift
//  Africa
//
//  Created by Jeren Ott on 3/28/21.
//

import SwiftUI

struct InsertFactView: View {
    //Properties
    let animal: Animal
    
    //Body
    
    var body: some View {
        GroupBox {
            TabView {
                ForEach(animal.fact, id: \.self) { item in
                    Text(item)
                }
            }//TabView
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
        }//GroupBox
    }
}

//Preview

struct InsertFactView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsertFactView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
