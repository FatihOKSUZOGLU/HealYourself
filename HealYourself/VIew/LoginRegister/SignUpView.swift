//
//  SignUp.swift
//  HealYourself
//
//  Created by Fatih OKSUZOGLU on 19.03.2023.
//

import FirebaseAuth
import Foundation
import SwiftUI

struct SignUp: View {
    @State var email = ""
    @State var pass = ""
    @State var name = ""
    @State var surName = ""
    @State var passVisible = true
    @State var rePass = ""
    @Binding var index: Int
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    Spacer(minLength: 0)
                    VStack(spacing: 10) {
                        Text("Sign Up")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }

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
                    ComponentUtil.getPasswordView(imageColor: Color("Color1"), name: "Password", pass: $pass, color: .white, visible: $passVisible)
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 20)

                VStack {
                    ComponentUtil.getPasswordView(imageColor: Color("Color1"), name: "Re-Password", pass: $rePass, color: .white, visible: $passVisible)
                    Divider().background(Color.white.opacity(0.5))
                }
                .frame(height: 30)
                .padding(.horizontal)
                .padding(.top, 20)

                VStack {
                    TextField("Name", text: self.$name)
                        .foregroundColor(.white)
                    Divider().background(Color.white.opacity(0.5))
                }
                .frame(height: 30)
                .padding(.horizontal)
                .padding(.top, 20)

                VStack {
                    TextField("Surname", text: self.$surName)
                        .foregroundColor(.white)
                    Divider().background(Color.white.opacity(0.5))
                }
                .frame(height: 30)
                .padding(.horizontal)
                .padding(.top, 20)
            }
            .padding()
            .padding(.bottom, 60)
            .background(Color("Color2"))
            .clipShape(CShapeSignUp())
            .contentShape(CShapeSignUp())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)

            Button(action: {
                Auth.auth().createUser(withEmail: email, password: pass) {
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
                Text("SIGN UP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }.offset(y: 25)
                .opacity(self.index == 1 ? 1 : 0)
        }
    }
}

struct CShapeSignUp: Shape {
    func path(in rect: CGRect) -> Path {
        return Path {
            path in
            path.move(to: CGPoint(x: 0, y: 80))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width / 2, y: 0))
            path.addLine(to: CGPoint(x: rect.width / 2, y: 80))
        }
    }
}
