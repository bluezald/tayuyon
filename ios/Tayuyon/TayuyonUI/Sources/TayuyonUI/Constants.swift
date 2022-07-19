//
//  Constants.swift
//  TayuyonUI
//
//  Created by Vincent Bacalso on 7/19/22.
//

import SwiftUI

public struct Constants {
  public static let cornerRadius: CGFloat = 6.0
  public static let textFieldHeight: CGFloat = 45.0
  public static let buttonHeight: CGFloat = 45.0
  public static let padding: CGFloat = 4
    
  public static var title3: Font {
    if #available(iOS 14, *) {
      return .title3
    } else {
      return Font(UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title3))
    }
  }
  
  public static var title2: Font {
    if #available(iOS 14, *) {
      return .title2
    } else {
      return Font(UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title2))
    }
  }
  
  public static var caption2: Font {
    if #available(iOS 14, *) {
      return .caption2
    } else {
      return Font(UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption2))
    }
  }
}
