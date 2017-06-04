//
//  GenericDispatchDataTest.swift
//  SwiftUtilities
//
//  Created by Jonathan Wight on 7/1/15.
//
//  Copyright (c) 2014, Jonathan Wight
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
//
//  * Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation
//    and/or other materials provided with the distribution.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
//  FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
//  DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
//  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
//  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
//  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


import XCTest

import SwiftUtilities

let deadbeef: UInt32 = 0xDEADBEEF

// TODO: Swift3
//class GenericDispatchDataTest: XCTestCase {
//
//    func testBasic1() {
//        let data = GenericDispatchData <Void> (value: UInt32(deadbeef).bigEndian)
//        XCTAssertEqual(data.elementSize, 1)
//        XCTAssertEqual(data.count, 4)
//        XCTAssertEqual(data.length, 4)
//        XCTAssertEqual(data.startIndex, 0)
//        XCTAssertEqual(data.endIndex, 4)
//    }
//
//    func testDefaulInit() {
//        let data = GenericDispatchData <Void> ()
//        XCTAssertEqual(data.elementSize, 1)
//        XCTAssertEqual(data.count, 0)
//        XCTAssertEqual(data.length, 0)
//        XCTAssertEqual(data.startIndex, 0)
//        XCTAssertEqual(data.endIndex, 0)
//    }
//
////    func testConcat() {
////        let data1 = GenericDispatchData <Void> (value: UInt16(0xDEAD).bigEndian)
////        let data2 = GenericDispatchData <Void> (value: UInt16(0xBEEF).bigEndian)
////        let result = data1 + data2
////        let expectedResult = GenericDispatchData <Void> (value: UInt32(deadbeef).bigEndian)
////        XCTAssertTrue(result == expectedResult)
////    }
//
//    func testSplit() {
//        let data = GenericDispatchData <Void> (value: UInt32(deadbeef).bigEndian)
//        let (lhs, rhs) = try! data.split(2)
//        XCTAssertTrue(lhs == GenericDispatchData <Void> (value: UInt16(0xDEAD).bigEndian))
//        XCTAssertTrue(rhs == GenericDispatchData <Void> (value: UInt16(0xBEEF).bigEndian))
//    }
//
//    func testInset() {
//        let data = GenericDispatchData <Void> (value: UInt32(deadbeef).bigEndian)
//        let insettedData = try! data.inset(startInset: 1, endInset: 1)
//        let expectedResult = GenericDispatchData <Void> (value: UInt16(0xADBE).bigEndian)
//        XCTAssertEqual(insettedData, expectedResult)
//    }
//
////    func testNonByteSized() {
////        let data = GenericDispatchData <UInt16> (array: [ 1, 2, 3, 4 ])
////        XCTAssertEqual(data.subBuffer(1 ..< 3), GenericDispatchData <UInt16> (array: [ 2, 3 ]))
////        XCTAssertEqual(data.subBuffer(startIndex: 1, count: 2), GenericDispatchData <UInt16> (array: [ 2, 3 ]))
////        XCTAssertEqual(data[1 ..< 3], GenericDispatchData <UInt16> (array: [ 2, 3 ]))
//////        XCTAssertEqual(data.subBuffer(startIndex: 1, length: 2 * sizeof(UInt16)), GenericDispatchData <UInt16> (array: [ 2, 3 ]))
////    }
//}
//
//extension GenericDispatchData {
//    init(array: Array <Element>) {
//        let data: GenericDispatchData = array.withUnsafeBufferPointer() {
//            return GenericDispatchData(buffer: $0)
//        }
//        self = data
//    }
//}
