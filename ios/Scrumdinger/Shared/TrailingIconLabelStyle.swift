//
//  TrailingIconLabelStyle.swift
//  Scrumdinger (iOS)
//
//  Created by Vincent Bacalso on 11/13/22.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
  
  func makeBody(configuration: Configuration) -> some View {
    HStack {
      configuration.title
      configuration.icon
    }
  }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
  static var trailingIcon: Self { Self() }
}
