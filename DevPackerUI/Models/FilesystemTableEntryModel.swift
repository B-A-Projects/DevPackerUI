//
//  FilesystemTableEntryModel.swift
//  DevPackerUI
//
//  Created by Yannick de Boer on 22/08/2024.
//

import Foundation
import DevPackerLib

struct FilesystemTableEntryModel: Hashable, Codable, Identifiable {
    
    var id: Int
    
    var name: String
    
    var isFolder: Bool
    
//    var isDeleted: Bool
//    
//    var isHashed: Bool
//    
//    var byteSize: UInt64
//    
//    var groupHeaderIndex: UInt32
    
    var subEntries: [FilesystemTableEntryModel]?
    
    init(FilesystemTableEntry entry: FileSystemTableEntry) {
        id = Int(entry.index)
        name = entry.name
        isFolder = entry.type.Value & 0x1 != 0
//        isDeleted = entry.type.Value & 0x80 != 0
//        isHashed = entry.
        
        if entry.subEntries != nil {
            subEntries = []
            for index in 0...entry.subEntries!.count - 1 {
                subEntries!.insert(FilesystemTableEntryModel(FilesystemTableEntry: entry.subEntries![index]), at: index)
            }
        }
    }
}
