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
    @State private var backgroundColor = Color.clear
    
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ZStack {
                    self.backgroundColor
                        .contentShape(Rectangle())
                        .frame(width: geo.size.width, height: geo.size.height)
                        .onTapGesture(count: 2) {
                            withAnimation {
                                self.gestureText = "Double Tapped"
                            }
                    }
                    .onTapGesture {
                        withAnimation {
                            self.gestureText = "Tapped"
                        }
                    }
                    .onLongPressGesture {
                        withAnimation {
                            self.gestureText = "Long Pressed"
                        }
                    }
                    .gesture(DragGesture(minimumDistance: 5, coordinateSpace: .local)
                        .onEnded(
                            { value in
                                if value.translation.width < 0 {
                                    // left
                                    self.gestureText = "swipe left"
                                }
                                
                                if value.translation.width > 0 {
                                    // right
                                    self.gestureText = "swipe right"
                                }
                                if value.translation.height < 0 {
                                    // up
                                    self.gestureText = "swipe up"
                                }
                                
                                if value.translation.height > 0 {
                                    // down
                                    self.gestureText = "swipe down"
                                }
                            }
                        )
                    )
                    
                    
                    
                    
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
