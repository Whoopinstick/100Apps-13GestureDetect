//
//  ContentView.swift
//  13 - GestureDetect
//
//  Created by Kevin Paul on 8/26/20.
//  Copyright © 2020 Whoopinstick. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var gestureText = ""
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ZStack {
                    Color.clear
                        .contentShape(Rectangle())
                        .frame(width: geo.size.width, height: geo.size.height)
                        .onTapGesture {
                            withAnimation {
                                self.gestureText = "Tapped"
                            }
                            print("tapped")
                    }
                    
                    Text("\(self.gestureText)")
                    
                }
                    
                .navigationBarTitle("Gesture Detect")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
