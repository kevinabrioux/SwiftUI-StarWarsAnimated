//
//  ContentView.swift
//  starwarsanimated
//
//  Created by Kevin ABRIOUX on 11/03/2020.
//  Copyright © 2020 Kevin ABRIOUX. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    private let startAnimationDuration = 11.0
    private let endAnimationDuration = 1.5
    
    @State private var animationStart = false
    @State private var animationEnd = false
    
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Text("Episode IV, A NEW HOPE It is a period of civil war. Rebel spaceships, striking from a hidden base, have won their first victory against the evil Galactic Empire. During the battle, Rebel spies managed to steal secret plans to the Empire’s ultimate weapon, the DEATH STAR, an armored space station with enough power to destroy an entire planet...")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.yellow)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
                .rotation3DEffect(.degrees(self.animationEnd ? 0 : 60), axis: (x: 1, y: 0, z: 0))
                .shadow(color: .yellow, radius: 4, x: 0, y: self.animationEnd ? 0 : 15)
                .frame(height: animationStart ? 750 : 0)
                .animation(Animation.linear(duration: self.animationEnd ? self.endAnimationDuration : self.startAnimationDuration))
                .onAppear() {
                    self.animationStart.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + self.startAnimationDuration) {
                        self.animationEnd.toggle()
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
