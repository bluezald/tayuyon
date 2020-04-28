//
//  ContentView.swift
//  Vegan-on
//
//  Created by Vincent Bacalso on 28/04/2020.
//  Copyright © 2020 bindevs. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            Text("Home")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Home")
                    }
                }
                .tag(0)
            Text("Discover")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Discover")
                    }
                }
                .tag(1)
          Text("Library")
            .font(.title)
            .tabItem {
                VStack {
                    Image("first")
                    Text("Library")
                }
            }
            .tag(1)
          Text("Profile")
            .font(.title)
            .tabItem {
                VStack {
                    Image("first")
                    Text("Profile")
                }
            }
            .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
