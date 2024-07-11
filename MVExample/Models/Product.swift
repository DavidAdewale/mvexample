//
//  Product.swift
//  MVExample
//
//  Created by David Adewale on 11/07/2024.
//

import Foundation

struct Product: Decodable, Identifiable {
    let id: Int
    let title: String
    let price: Double
}
