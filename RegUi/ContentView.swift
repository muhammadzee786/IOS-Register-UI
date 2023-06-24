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
            VStack(alignment: .center, spacing: 20){
                Spacer()
                Text("Create new account")
                    .font(.largeTitle)
                    .foregroundColor(Color.white)
                    .alignmentGuide(.top) { _ in
                                            return UIScreen.main.bounds.height * 0.1 // Adjust the value as needed
                                        }
                InputField(text: $userName, image: "person", hint: "Username")
                InputField(text: $password, image: "heart.fill", hint: "Password")
                Button(action: {
                    print(userName)
                    print(password)
                }, label: {
                    Text("Sign up")
                        .padding(10)
                })
                .background(Color.white)
                .foregroundColor(Color.gray)
                .cornerRadius(10)
                .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                
                Spacer()
            }
        }
    }
}

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
                    .padding(5)
                TextField(hint, text: $text)
                    .padding(5)
            })
            .padding(10)
    }
}
