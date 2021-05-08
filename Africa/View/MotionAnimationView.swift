//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Jeren Ott on 3/29/21.
//

import SwiftUI

struct MotionAnimationView: View {
    //Properties
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    //Functions
    
    //No1 Random Coordinate
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    //No2 Random Size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    //No3 Random Scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //No4 Random Speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    //No5 Random Delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    //Body
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { item in
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )//position
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        )//animation
                        .onAppear(perform: {
                            isAnimating = true
                        })
                }//Loop
            }//ZStack
            .drawingGroup()
        }//Geometry Reader
    }
}

//Preview

struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
