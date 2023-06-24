//
//  ContentView.swift
//  RegUi
//
//  Created by Ozeito on 24/06/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var userName: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack{
            Image("bg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            GeometryReader{ geometry in
                VStack(alignment: .center,spacing: 20){
                    Text("Create new account")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.2)
                    
                    VStack(spacing: 20){
                        InputField(text: $userName, image: "person", hint: "Username")
                        InputField(text: $password, image: "heart.fill", hint: "Password")
                        
                        Button(action: {
                            print(userName)
                            print(password)
                        }, label: {
                            Text("Next")
                                .padding(10)
                                .frame(width: UIScreen.main.bounds.width*0.5)
                        })
                        .background(Color.black)
                        .foregroundColor(Color.white)
                        .cornerRadius(5)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height*0.7)
                }
            }
        }
    }
}

//height: geometry.size.height * 0.3, alignment: .top
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct InputField: View {
    
    @Binding var text: String
    let image: String
    let hint: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 50)
            .foregroundColor(Color.white)
            .overlay(HStack{
                Image(systemName: image)
                    .padding(15)
                TextField(hint, text: $text)
                    .padding(10)
            })
            .padding(10)
    }
}
