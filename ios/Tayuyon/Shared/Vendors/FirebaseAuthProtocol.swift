//
//  FirebaseAuthProtocol.swift
//  Tayuyon (iOS)
//
//  Created by Vincent Bacalso on 7/19/22.
//

import Foundation

protocol FirebaseAuthProtocol {
  
  func authorizeByEmail()
  func authorizeByGoogle()
  func authorizeByFacebook()
  
}
