//
//  ScrumdingerApp.swift
//  Shared
//
//  Created by Vincent Bacalso on 10/6/22.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
  var body: some Scene {
    WindowGroup {
      NavigationView {
        ScrumsView(scrums: DailyScrum.sampleData)
      }
    }
  }
}
