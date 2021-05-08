//
//  CenterModifier.swift
//  Africa
//
//  Created by Jeren Ott on 4/4/21.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
