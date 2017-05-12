//
//  ArgCapture.swift
//  InstantMock
//
//  Created by Patrick on 12/05/2017.
//  Copyright © 2017 pirishd. All rights reserved.
//


/** This class represents the configuration of an argument that captures passed values */
class ArgCapture<T>: Argument  {

    /// Type description for the arg
    fileprivate let typeDescription: String

    /// Inner captured values
    fileprivate var values = [T?]()

    /// Last captured value
    var value: T? {
        var ret: T? = nil
        if let val = self.values.last as? T {
            ret = val
        }
        return ret
    }

    /// All captured values
    var allValues: [T?] {
        return values
    }


    // MARK: Initializer

    /** Initialize with given type description */
    init(_ typeDescription: String) {
        self.typeDescription = typeDescription
    }

}


/** Extension that performs matching */
extension ArgCapture: ArgumentMatching {

    func match(_ value: Any?) -> Bool {
        // all capture objects match anything
        return true
    }

}


/** Extension that sets a captured value */
extension ArgCapture {

    func setValue(_ value: Any?) {
        if value == nil {
            self.values.append(nil as T?)
        } else if let tValue = value as? T {
            self.values.append(tValue)
        }
    }

}


/** Extension to return a description */
extension ArgCapture: CustomStringConvertible {

    var description: String {
        return "captured<\(typeDescription)>"
    }

}