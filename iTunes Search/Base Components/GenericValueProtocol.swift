//
//  GenericValueProtocol.swift
//  iTunes Search
//
//  Created by Mert Ergul on 25.10.2021.
//

import Foundation

protocol GenericValueProtocol {
    associatedtype Value
    var value: Value { get }
}
