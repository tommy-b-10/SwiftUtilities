//
//  Walker.swift
//  SwiftUtilities
//
//  Created by Jonathan Wight on 8/12/14.
//
//  Copyright © 2016, Jonathan Wight
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


// TODO: This should be nested but Swift b5 can't deal with that quite yet.
public struct WalkerState <T> {
    public var depth: Int = 0
    public var stack: [T] = []

    public func filler(_ string: String = " ") -> String {
        return String(repeating: string, count: self.depth)
    }
}

public struct Walker <T> {

    public typealias State = WalkerState <T>
    public typealias Children = (_ node: T) -> [T]?
    public typealias StatelessVisitor = (_ node: T, _ depth: Int) -> Void
    public typealias StatefulVisitor = (_ node: T, _ state: State) -> Void

    public let childrenBlock: Children!

    public init(childrenBlock: @escaping Children) {
        self.childrenBlock = childrenBlock
    }

    public func walk(_ node: T, visitor: StatefulVisitor) {
        self.walk(node, state: State(), visitor: visitor)
    }

    public func walk(_ node: T, state: State, visitor: StatefulVisitor) {
        var state = state
        visitor(node, state)
        state = State(depth: state.depth + 1, stack: state.stack + [node])
        if let children = self.childrenBlock(node) {

            for child in children {
                walk(child, state: state, visitor: visitor)
            }
        }
    }

    public func walk(_ node: T, visitor: StatelessVisitor) {
        self.walk(node, depth: 0, visitor: visitor)
    }

    func walk(_ node: T, depth: Int, visitor: StatelessVisitor) {
        visitor(node, depth)
        if let children = self.childrenBlock(node) {

            for child in children {
                walk(child, depth: depth + 1, visitor: visitor)
            }
        }
    }
}

/*

// MARK: Example

// MARK: Types
class Node <T> {
    var value: T
    var children: [Node <T>] = []

    init(_ value: T) {
        self.value = value
    }
}

typealias StringNode = Node <String>

// MARK: Setup
let root = StringNode("Hello world")
root.children = [ StringNode("Child A"), StringNode("Child B") ]

// MARK: Walk
let walker = Walker <StringNode> () {
    node in
    return node.children
    }

walker.walk(root) {
    (node: StringNode, depth: Int) in
    print("\(depth): \(node)")
    }

walker.walk(root) {
    (node: StringNode, state: _State <StringNode>) in
    let filler = state.filler("\t")
    print("\(filler)\(node)\(state.stack)")
    }


*/
