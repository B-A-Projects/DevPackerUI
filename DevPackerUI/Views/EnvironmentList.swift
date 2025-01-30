//
//  EnvironmentList.swift
//  DevPackerUI
//
//  Created by Yannick de Boer on 29/08/2024.
//

import Foundation
import SwiftUI
import SwiftData

struct EnvironmentList: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var environments: [WiiUGame]
    
    @State private var viewDetails: Bool = false
    
    var body: some View {
        HStack {
            NavigationSplitView() {
                List {
                    ForEach(environments) { environment in
                        NavigationLink {
                            let filesystemList = FilesystemTableEntryModel(FilesystemTableEntry: environment.content!.fileSystem.entryTable)
                            FilesystemTableList(filesystemTableRows: [filesystemList])
                        } label: {
                            Text("Package at \(environment.content?.directoryUrl.path(percentEncoded: false) ?? "empty")")
                        }
                    }
                }
                .navigationSplitViewColumnWidth(min: 180, ideal: 200)
                .toolbar {
                    ToolbarItem {
                        Button(action: {
                            let url = getDirectory()
                            if (url != nil) {
                                let newItem = (DirectoryPath: url!)
                                modelContext.insert(newItem)
                            }
                        }) {
                            Label("Add environment", systemImage: "plus")
                        }
                    }
                }
            } content: {
                Text("Content view.")
            } detail: {
                if viewDetails {
                    Text("Detail view.")
                } else {
                    Spacer()
                        .navigationSplitViewColumnWidth(0)
                }
            }
        }
        .toolbar {
            ToolbarItem {
                Toggle(isOn: $viewDetails, label: {
                    Label("Show details", systemImage: "sidebar.right")
                })
                .toggleStyle(.button)
            }
        }
    }
    
    private func getDirectory() -> URL? {
        let panel = NSOpenPanel()
        panel.title = "Select working directory"
        panel.allowsMultipleSelection = false
        panel.canChooseDirectories = true
        panel.canChooseFiles = false
        panel.canCreateDirectories = false
        return panel.runModal() == .OK ? panel.urls.first : nil
    }
    
    private func parseGame(Directory url: URL) -> WiiUGame? {
        let discPath = url.append(Component: "game.wud")
        if FileManager().fileExists(atPath: discPath.path()) {
            return GameDisc(DirectoryPath: url)
        }
        return GamePackage(DirectoryPath: url)
    }
}

#Preview {
    EnvironmentList()
}
