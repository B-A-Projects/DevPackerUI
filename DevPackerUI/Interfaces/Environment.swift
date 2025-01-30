//
//  PackageProtocol.swift
//  DevPackerUI
//
//  Created by Yannick de Boer on 20/01/2025.
//

import Foundation
import SwiftData

import DevPackerLib

@Model
final class Environment {
    
    var id: UUID { get { return _uuid } }
    
    var directory: URL { get { return _url } }
    
    var titleKey: String { get { return _titleKey } }
    
    var commonKey: String { get { return _commonKey } }
    
    private var _uuid: UUID = UUID()
    private var _type: PackageType
    private var _url: URL
    private var _titleKey: String
    private var _commonKey: String
    
    private var _disc: Disc? = nil
    private var _download: CdnPackage? = nil
    
    init(DirectoryPath url: URL, PackageType type: PackageType) throws {
        _url = url
        _type = type
        
        switch type {
        case .Disc:
            _disc = try Disc(Directory: _url)
        case .Digital:
            _download = try CdnPackage(Directory: _url, DecryptionKey: [0x2F, 0x5C, 0x1B, 0x29, 0x44, 0xE7, 0xFD, 0x6F, 0xC3, 0x97, 0x96, 0x4B, 0x05, 0x76, 0x91, 0xFA])
        default:
            throw ReadError.InvalidValue
        }
    }
}
