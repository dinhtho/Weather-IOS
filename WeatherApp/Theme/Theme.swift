//
//  Theme.swift
//  WeatherApp
//
//  Created by LAP15789 on 15/05/2023.
//

import Foundation
import SwiftUI

protocol Theme {
    var screenColor: Color { set get }
    var backgroundColor: Color { set get }
    var textColor: Color { set get }
    var statusColor: Color { set get }
}
