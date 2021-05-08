//
//  CreditsView.swift
//  Africa
//
//  Created by Jeren Ott on 4/4/21.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text("""
        Copyright © Jeren Ott
        All rights reserved
        Better Apps, Less Code
        """)
                .font(.footnote)
                .multilineTextAlignment(.center)
        }//VStack
        .padding()
        .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
