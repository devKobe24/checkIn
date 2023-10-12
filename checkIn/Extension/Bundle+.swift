//
//  Bundle+.swift
//  checkIn
//
//  Created by Minseong Kang on 2023/10/12.
//

import Foundation
import OSLog
import UIKit

extension Bundle {
    var nmClientId: String? {
        guard let file = self.path(forResource: "Info", ofType: "plist"),
              let resource = NSDictionary(contentsOfFile: file),
              let nmClientId = resource["NMFClientId"] as? String else {
            Logger().log("⛔️ Naver Map Client ID를 가져오는데 실패하였습니다.")
            return nil
        }
        return nmClientId
    }
}
