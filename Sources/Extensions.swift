// Copyright (c) 2017 Timofey Solomko
// Licensed under MIT License
//
// See LICENSE for license information

import Foundation

extension Data {

    @inline(__always)
    func to<T>(type: T.Type) -> T {
        return self.withUnsafeBytes { $0.pointee }
    }

    @inline(__always)
    func toArray<T>(type: T.Type, count: Int) -> [T] {
        return self.withUnsafeBytes {
            [T](UnsafeBufferPointer(start: $0, count: count))
        }
    }

    @inline(__always)
    func toArray<T>(type: T.Type) -> [T] {
        return self.toArray(type: type, count: self.count / MemoryLayout<T>.size)
    }

}
