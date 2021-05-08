//
//  CoverImageView.swift
//  Africa
//
//  Created by Jeren Ott on 3/25/21.
//

import SwiftUI

struct CoverImageView: View {
    //Properties
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    //Body
    
    
    var body: some View {
        TabView {
            ForEach(coverImages) { item in
                Image(item.name)
                    .resizable()
                    .scaledToFill()
            }//Loop
        }//TabView
        .tabViewStyle(PageTabViewStyle())
    }
}

//Preview

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
