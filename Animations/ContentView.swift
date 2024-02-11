//
//  ContentView.swift
//  Animations
//
//  Created by User on 1/28/24.
//

//ANIMATION STEPS
//PART 1 - @STATE BOOL
//PART 2 - withAnimation {}
//PART 3 - TERNARY ? OPERATOR



import SwiftUI

struct ContentView: View {
    @State private var dougyDoug = false
    @State private var animatingCircle = false
    @State private var buttonAnimate = false
   
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            //list cell
            VStack(spacing: 50) {
                //Button Example
                Button(action: {
                    buttonAnimate.toggle()
                },
                       label: {
                    Text("Animate")
                        .bold()
                        .frame(width: 200, height: 50)
                        .foregroundColor(.indigo)
                        .background(LinearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                        .onTapGesture {
                            withAnimation {
                                animatingCircle.toggle()
                        }
                    }
                })
                
                //shape with spring
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.linearGradient(colors: [.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing))
                //This moves the circle around on the x and y axis
                    .offset(x: animatingCircle ? 145 : 0, y: animatingCircle ? 0 : 0)
                
                //This changes the size of the circle, makes it bigger or smaller
                    .scaleEffect(animatingCircle ? 1.0 : 1.0)
                    .onTapGesture {
                        //The response is how fast it moves to the x and y and the dampingFraction is the bounciness of the circle
                        withAnimation(.default) {
                            animatingCircle.toggle()
                        }
                    }
                
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.linearGradient(colors: [.yellow, .green], startPoint: .topLeading, endPoint: .bottom))
                    .offset(x: animatingCircle ? -145 : 0, y: animatingCircle ? 0 : 0)
                    .scaleEffect(animatingCircle ? 1.0 : 1.0)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            animatingCircle.toggle()
                        }
                    }
                
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.linearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .offset(x: animatingCircle ? 145 : 0, y: animatingCircle ? 0 : 0)
                    .scaleEffect(animatingCircle ? 1.0 : 1.0)
                    .onTapGesture {
                        withAnimation(.bouncy(duration: 3.0)) {
                            animatingCircle.toggle()
                        }
                    }
                
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.linearGradient(colors: [.purple, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .offset(x: animatingCircle ? -145 : 0, y: animatingCircle ? 0 : 0)
                    .scaleEffect(animatingCircle ? 1.0 : 1.0)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.2, dampingFraction: 0.1)) {
                            animatingCircle.toggle()
                        }
                    }
            }
        }
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}















