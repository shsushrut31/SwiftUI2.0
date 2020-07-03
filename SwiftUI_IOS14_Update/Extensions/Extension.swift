//
//  Extension.swift
//  SwiftUI_IOS14_Update
//
//  Created by Sushrut Shastri on 2020-07-03.
//

import Foundation
import SwiftUI

extension Color{
    static var randomColor: Color{
        return Color.init(.sRGB, red: .random(in: 0.2...1.0), green: .random(in: 0.2...1.0), blue: .random(in: 0.2...1.0), opacity: 1.0)
    }
}
