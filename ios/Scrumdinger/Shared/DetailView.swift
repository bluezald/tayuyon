//
//  DetailView.swift
//  Scrumdinger (iOS)
//
//  Created by Vincent Bacalso on 11/15/22.
//

import SwiftUI

struct DetailView: View {
  let scrum: DailyScrum
  
  var body: some View {
    List {
      Section(header: Text("Meeting Info")) {
        NavigationLink(destination: MeetingView()) {
          Label("Start Meeting", systemImage: "timer")
            .accessibilityLabel("Start Meeting")
            .font(.headline)
            .foregroundColor(.accentColor)
        }
        HStack {
          Label("Length", systemImage: "clock")
          Spacer()
          Text("\(scrum.lengthInMinutes) minutes")
        }
        .accessibilityElement(children: .combine)
        HStack {
          Label("Theme", systemImage: "paintpalette")
          Spacer()
          Text(scrum.theme.name)
            .padding(4)
            .foregroundColor(scrum.theme.accentColor)
            .background(scrum.theme.mainColor)
            .cornerRadius(4)
        }
      }
      Section(header: Text("Attendees")) {
        ForEach(scrum.attendees) { attendee in
          Label(attendee.name, systemImage: "person")
        }
      }
    }
    .navigationTitle(scrum.title)
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    DetailView(scrum: DailyScrum.sampleData[0])
  }
}
