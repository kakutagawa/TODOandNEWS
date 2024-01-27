//
//  ContentView.swift
//  TODOandNEWS2
//
//  Created by 芥川浩平 on 2024/01/27.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case todo = "ToDo"
    case news = "News"
}

struct ContentView: View {
    @State private var selectedTab: Tab = .todo
    
    var body: some View {
        UIKitTabBarController(selectedTab: $selectedTab)
            .onAppear {
                UITabBar.appearance().barTintColor = UIColor.systemBackground
            }
    }
}

#Preview {
    ContentView()
}
