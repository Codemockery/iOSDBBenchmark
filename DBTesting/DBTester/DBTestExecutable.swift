//
//  DBTestExecutable.swift
//  DBTesting
//
//  Created by Abhishek Kumar Singh on 18/01/23.
//

import Foundation
protocol DBTestExecutable {
    func writeAll() -> UInt64
    func writeBatch() -> UInt64
    func readAll() -> UInt64
    func updateAll() -> UInt64
    func updateBatch() -> UInt64
}
