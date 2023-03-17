//
//  Login.swift
//  HealYourself
//
//  Created by Fatih OKSUZOGLU on 16.03.2023.
//

import SwiftUI

struct SignView: View {
    @State private var loginUsername = ""
    @State private var loginPassword = ""

    @State private var signupUsername = ""
    @State private var signupEmail = ""
    @State private var signupPassword = ""

    var body: some View {
        TabView {
            LoginView(username: $loginUsername, password: $loginPassword)
                .tabItem {
                    Label("Login", systemImage: "person.fill")
                }

            SignupView(username: $signupUsername, email: $signupEmail, password: $signupPassword)
                .tabItem {
                    Label("Signup", systemImage: "person.crop.circle.badge.plus")
                }
        }
    }
}

struct LoginView: View {
    @Binding var username: String
    @Binding var password: String

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)

            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)

            Button("Login") {
                // login işlemleri burada yapılabilir
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}

struct SignupView: View {
    @Binding var username: String
    @Binding var email: String
    @Binding var password: String

    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)

            TextField("Email", text: $email)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)

            SecureField("Password", text: $password)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.horizontal)

            Button("Signup") {
                // signup işlemleri burada yapılabilir
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding()
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        SignView()
    }
}
