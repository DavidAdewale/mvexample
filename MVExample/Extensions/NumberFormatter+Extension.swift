//
//  NumberFormatter+Extension\.swift
//  MVExample
//
//  Created by David Adewale on 11/07/2024.
//

import Foundation

extension NumberFormatter {
    static var currency: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }
}
