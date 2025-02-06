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
final class GameModel {
    
    public var id: UUID { get { return _uuid } }
    
    public var type: MediaType { get { return _type } }
    
    public var content: Game? {
        get {
            switch _type {
            case .Disc:
                return _disc
            case .Digital:
                return _download
            default:
                return nil
            }
        }
    }
    
    private var _uuid: UUID = UUID()
    private var _type: MediaType
    private var _url: URL
    
    private var _disc: Disc? = nil
    private var _download: Download? = nil
    
    init(DirectoryPath url: URL,
         ConsoleType consoleType: ConsoleType,
         MediaType mediaType: MediaType,
         TitleKey titleKey: [UInt8],
         CommonKey commonKey: [UInt8]
    ) throws {
        _url = url
        _type = mediaType
        
        switch mediaType {
        case .Disc:
            _disc = try Disc(Directory: url,
                             TitleKey: titleKey,
                             CommonKey: commonKey,
                             ConsoleType: consoleType)
        case .Digital:
            _download = try Download(Directory: url,
                                     TitleKey: titleKey,
                                     CommonKey: commonKey,
                                     ConsoleType: consoleType)
        default:
            throw ReadError.InvalidValue
        }
    }
}
