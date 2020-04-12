//
//  ContentView.swift
//  CustomButtonWithPopOverBadge
//
//  Created by Ramill Ibragimov on 12.04.2020.
//  Copyright © 2020 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View {
    @State private var count = 0
    @State private var show = false
    
    var body: some View {
        NavigationView {
            GeometryReader { _ in
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        VStack(spacing: 4) {
                            
                            if self.show && self.count != 0 {
                                HStack(spacing: 12) {
                                    Image(systemName: "suit.heart.fill")
                                        .resizable()
                                        .frame(width: 20, height: 18)
                                        .foregroundColor(.red)
                                    Text("\(self.count) Likes")
                                }.padding([.horizontal, .top], 15)
                                .padding(.bottom, 30)
                                .background(Color.white)
                                .cornerRadius(4)
                                .clipShape(ArrowShape())
                            }
                            
                            Button(action: {
                                
                            }) {
                                Image(systemName: !self.show ? "suit.heart" : "suit.heart.fill")
                                    .resizable()
                                    .frame(width: 20, height: 18)
                                    .foregroundColor(.red)
                                    .padding()
                                    .background(Color.white)
                                    .clipShape(Circle())
                            }
                        }.padding()
                    }
                }
            }
            .navigationBarTitle("Home")
            .animation(.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1))
            .background(Color.black.opacity(0.06).edgesIgnoringSafeArea(.all))
                .onTapGesture {
                    self.count += 1
                    self.show.toggle()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                        self.show.toggle()
                    }
            }
        }
    }
}

struct ArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height - 10))
            
            path.addLine(to: CGPoint(x: (rect.width / 2) - 10, y: rect.height - 10))
            path.addLine(to: CGPoint(x: (rect.width / 2), y: rect.height))
            path.addLine(to: CGPoint(x: (rect.width / 2) + 10, y: rect.height - 10))
            
            path.addLine(to: CGPoint(x: 0, y: rect.height - 10))
        }
    }
}
