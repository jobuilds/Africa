//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Jeren Ott on 3/31/21.
//

import SwiftUI

struct AnimalGridItemView: View {
    //Properties
    let animal: Animal
    
    //Body
    
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}

//Preview

struct AnimalGridItemView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
