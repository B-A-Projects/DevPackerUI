//
//  Disc.swift
//  DevPackerUI
//
//  Created by Yannick de Boer on 19/01/2025.
//

import Foundation
import SwiftData

import DevPackerLib

@Model
final class GameDisc: WiiUGame {
    
    var name = "dummy"
    
    var content: Disc?
    
    init(DirectoryPath url: URL) {
        super.init(Directory: url, Type: .Disc)
        
        //let key: [UInt8] = [0xD7, 0xB0, 0x04, 0x02, 0x65, 0x9B, 0xA2, 0xAB, 0xD2, 0xCB, 0x0D, 0xB2, 0x7F, 0xA2, 0xB6, 0x56]
        let key: [UInt8] = [0x2F, 0x5C, 0x1B, 0x29, 0x44, 0xE7, 0xFD, 0x6F, 0xC3, 0x97, 0x96, 0x4B, 0x05, 0x76, 0x91, 0xFA]
        do {
            content = try Disc(Directory: url)
            print("Success!")
        }
        catch  {
            print("Error: \(error)")
            content = nil
        }
    }
}
