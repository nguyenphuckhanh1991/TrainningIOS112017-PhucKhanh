//
//  DataServicces.swift
//  iOSTranning112017
//
//  Created by Joy on 12/7/17.
//  Copyright © 2017 nguyen.phuc.khanh. All rights reserved.
//

import Foundation

class DataServices {
  static let shared = DataServices()
  var status: [StatusCellItem] = []
  var request: Request?
  func fetchAllStatus(completion: @escaping([StatusCellItem]?) -> Void) {
    
  }
}
