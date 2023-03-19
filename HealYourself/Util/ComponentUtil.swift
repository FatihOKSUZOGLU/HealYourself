//
//  ComponentUtil.swift
//  HealYourself
//
//  Created by Fatih OKSUZOGLU on 19.03.2023.
//

import Foundation
import SwiftUI

class ComponentUtil {
    static func getPasswordView(imageColor: Color, name: String, pass: Binding<String>, color: Color, visible: Binding<Bool>) -> some View {
        HStack(spacing: 15) {
            VStack {
                if visible.wrappedValue {
                    SecureField(name, text: pass)
                        .foregroundColor(color)
                } else {
                    TextField(name, text: pass)
                        .foregroundColor(color)
                }
            }
            Button(action: {
                visible.wrappedValue.toggle()
            }) {
                Image(systemName: visible.wrappedValue ? "eye.slash.fill" : "eye.fill")
                    .foregroundColor(imageColor)
            }
        }
    }
}
