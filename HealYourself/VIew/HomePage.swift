//
//  HomePage.swift
//  HealYourself
//
//  Created by Fatih OKSUZOGLU on 18.03.2023.
//

import FirebaseAuth
import Foundation
import SwiftUI

struct Home: View {
    @State var index = 0
    var body: some View {
        GeometryReader { _ in
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                ZStack {
                    SignUp(index: self.$index)
                        .zIndex(Double(self.index))
                    Login(index: self.$index)

                }.padding(.vertical)
                HStack(spacing: 15) {
                    Rectangle()
                        .fill(Color("Color1"))
                        .frame(height: 1)

                    Text("OR")
                        .foregroundColor(Color("Color1"))

                    Rectangle()
                        .fill(Color("Color1"))
                        .frame(height: 1)

                }.padding(.horizontal, 30)
                    .padding(.top, 50)

                HStack(spacing: 25) {
                    Button(action: {
                    }) {
                        Image("apple")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    Button(action: {
                    }) {
                        Image("fb")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    Button(action: {
                    }) {
                        Image("twitter")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                }.padding(.top, 30)
            }.padding(.vertical)
        }.background(Color("Color").edgesIgnoringSafeArea(.all
        ))
    }
}

struct ErrorView: View {
    var body: some View {
        GeometryReader {
            _ in
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
