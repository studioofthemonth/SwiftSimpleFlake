//
//  SimpleFlake.swift
//  SwiftSimpleFlake ❄️
//
//  Created by 🍕Chase McClure on 10/19/16.
//  Copyright © 2016 Studio of the Month. All rights reserved.
//

import Foundation
import Darwin
import Security

public class SimpleFlake {

    /**
        Options for flake encoding

        - binary
        - hex
        - base10
    */
    public enum Encoding {
        case binary, hex, base10
    }

    private let flake: UInt64

    /// Date used as a base for time bits
    public static var epoch = Date(timeIntervalSinceReferenceDate: 0)
    
    /// Number of bits to use from current timestamp. Must be less than 64
    public static var timeBitCount: UInt = 41
    
    private static var randomBitCount: UInt {
        get {
            return 64 - timeBitCount
        }
    }
    
    

    /**
        Initializes a new flake.

        - Parameters:
            - date: Date to be used for time bits
            - seedInt: UInt64 to be used as random bits

        - Returns: A SimpleFlake instance
    */
    public init(date: Date? = nil, seedInt: UInt64? = nil) {
        let date = date ?? Date()
        let time = UInt64(date.timeIntervalSince(SimpleFlake.epoch) * 1000)
        var random = seedInt ?? 0
        
        if seedInt == nil {
            arc4random_buf(&random, MemoryLayout.size(ofValue: random))
        }
        
        assert(time >= 0, "Date must be later than or equal to \(SimpleFlake.epoch)")
        assert(SimpleFlake.timeBitCount <= 64, "timeBitCount must be less than or equal to 64")
        
        let shiftedTime = time << UInt64(SimpleFlake.randomBitCount)
        let shiftedRandom = random >> UInt64(SimpleFlake.timeBitCount)
        
        self.flake = shiftedTime | shiftedRandom
    }

    
    /**
        Get a string representaion of the flake

        - Parameters:
            - encoding: Encoding of the string

        - Returns: A string representaion of the flake.
    */
    public func toString(encoding: Encoding = .base10) -> String {
        switch encoding {
        case .binary:
            return String(flake, radix: 2)
        case .hex:
            return String(flake, radix: 16)
        case .base10:
            return String(flake, radix: 10)
        }
    }

}
