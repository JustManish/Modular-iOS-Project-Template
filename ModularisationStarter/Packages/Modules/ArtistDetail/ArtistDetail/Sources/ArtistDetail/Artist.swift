//
//  Artist.swift
//
//
//  Created by Emre Havan on 05.03.24.
//

import CommonModels
import Foundation

struct Artist: Codable {
    let name: String
    let birthDate: Date
    let songs: [Song]
}
