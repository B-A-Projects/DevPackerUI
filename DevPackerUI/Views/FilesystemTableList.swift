//
//  FilesystemTableList.swift
//  DevPackerUI
//
//  Created by Yannick de Boer on 22/08/2024.
//

import Foundation
import SwiftUI

struct FilesystemTableList: View {
    
    var filesystemTableRows: [FilesystemTableEntryModel]
    
    var body: some View {
        List(filesystemTableRows, children: \.subEntries) { item in
            NavigationLink {
                
            } label: {
                Label(item.name, systemImage: item.isFolder ? "folder" : "doc")
            }
            //Text(item.description)
        }
    }
}

//#Preview {
//    FilesystemTableList()
//}
