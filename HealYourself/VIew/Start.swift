//
//  ContentView.swift
//  HealYourself
//
//  Created by Fatih OKSUZOGLU on 16.03.2023.
//

import SwiftUI

struct StartView: View {
    @State private var currentPageIndex = 0

    var body: some View {
        VStack {
            TabView(selection: $currentPageIndex) {
                Page1View()
                    .tag(0)
                Page2View()
                    .tag(1)
                Page3View()
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

            HStack {
                Spacer()
                Button(action: {
                    withAnimation {
                        currentPageIndex = max(currentPageIndex - 1, 0)
                    }
                }) {
                    Image(systemName: "chevron.left.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(currentPageIndex == 0 ? Color.gray : Color.blue)
                }
                .padding(.trailing, 10)

                ForEach(0 ..< 3) { index in
                    Circle()
                        .fill(index == currentPageIndex ? Color.orange : Color.gray)
                        .frame(width: 10, height: 10)
                        .padding(.horizontal, 5)
                }

                Button(action: {
                    withAnimation {
                        currentPageIndex = min(currentPageIndex + 1, 2)
                    }
                }) {
                    Image(systemName: "chevron.right.circle.fill")
                        .font(.largeTitle)
                        .foregroundColor(currentPageIndex == 2 ? Color.gray : Color.blue)
                }
                .padding(.leading, 10)
                Spacer()
            }
        }
    }
}

struct Page1View: View {
    var body: some View {
        VStack {
            Text("Page 1")
                .font(.largeTitle)

            Spacer()
        }
    }
}

struct Page2View: View {
    var body: some View {
        VStack {
            Text("Page 2")
                .font(.largeTitle)

            Spacer()
        }
    }
}

struct Page3View: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showSignView = false
    var body: some View {
        VStack {
            Text("Page 3")
                .font(.largeTitle)

            Spacer()
            Button("Go to Sign In") {
                self.showSignView = true
            }
            .sheet(isPresented: $showSignView) {
                Home()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
