//
//  GenericProtocols.swift
//  Erudyte
//
//  Created by Denny Mathew on 18/04/18.
//  Copyright © 2018 Cabot. All rights reserved.
//

import Foundation

// MARK: - Protocol and Protocol Extension for Serializing Model Objects
protocol Serializable: Codable {
    func serialize() -> Data?
}

extension Serializable {
    func serialize() -> Data? {
        let encoder = JSONEncoder()
        return try? encoder.encode(self)
    }
}
