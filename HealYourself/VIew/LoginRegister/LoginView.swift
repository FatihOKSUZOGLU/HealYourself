//
//  LoginView.swift
//  HealYourself
//
//  Created by Fatih OKSUZOGLU on 19.03.2023.
//

import FirebaseAuth
import Foundation
import SwiftUI

struct Login: View {
    @State var email = ""
    @State var pass = ""
    @State var isVisible = true
    @Binding var index: Int

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    VStack(spacing: 10) {
                        Text("Log In")
                            .foregroundColor(self.index == 0 ?.white : .gray)
                            .font(.title)
                            .fontWeight(.bold)

                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }

                    Spacer(minLength: 0)

                }.padding(.top, 10)
                    .padding(.horizontal, 20)

                VStack {
                    HStack(spacing: 15) {
                        TextField("Email Adress", text: self.$email)
                            .foregroundColor(.white)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 50)

                VStack {
                    ComponentUtil.getPasswordView(imageColor: Color("Color1"), name: "Password", pass: $pass, color: .white, visible: $isVisible)
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 20)

                HStack {
                    Spacer(minLength: 0)
                    Button(action: {
                    }) {
                        Text("Forget Password")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }
                .frame(height: 30)
                .padding(.horizontal)
                .padding(.top, 20)
            }
            .padding()
            .padding(.bottom, 175)
            .background(Color("Color2"))
            .clipShape(CShapeLogin())
            .contentShape(CShapeLogin())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)

            Button(action: {
                Auth.auth().signIn(withEmail: email, password: pass) {
                    authResult, error in
                    if let error = error {
                        print(error)
                        return
                    }

                    if let authResult = authResult {
                        print(authResult.user.uid)
                    }
                }

            }) {
                Text("LOG IN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }.offset(y: 25)
                .opacity(self.index == 0 ? 1 : 0)
        }
    }
}

struct CShapeLogin: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {
            path in
            path.move(to: CGPoint(x: rect.width, y: 80))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width / 2, y: 0))
            path.addLine(to: CGPoint(x: rect.width / 2, y: 80))
        }
    }
}
