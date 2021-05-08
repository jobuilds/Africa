//
//  HeadingView.swift
//  Africa
//
//  Created by Jeren Ott on 3/28/21.
//

import SwiftUI

struct HeadingView: View {
    //Properties
    var headingImage: String
    var headingText: String
    
    //Body
    
    var body: some View {
        HStack {
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
        }//HStack
        .padding(.vertical)
    }
}

//Preview

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.recatangle.andgled", headingText: "Pictures in the Wilderness")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
