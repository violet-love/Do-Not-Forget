//
//  NotesList.swift
//  Don'tForget!
//
//  Created by Jason Hoover on 5/26/20.
//  Copyright © 2020 Love. All rights reserved.
//

import UIKit

class NotesList {
    
    var notesCreated: [Notes] = []
    
    init() {
        loadFromPersistentStore()
    }
    
    func createItem() {
        saveToPersistanceStore()
    }
}

//MARK: - Persistence
var persistentFileURL: URL? {
    let fileManager = FileManager.default
    let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
    let notesURL = documentsDir?.appendingPathComponent("notes.plist")
    return notesURL
}

func saveToPersistanceStore() {
    do {
        guard let persistentFileURL = persistentFileURL else {return}
        let encoder = PropertyListEncoder()
        let notesPlist = try encoder.encode(notesCreated)
        try notesPlist.write(to: persistentFileURL)
    } catch {
        print("Error saving items: \(error)")
    }
}

func loadFromPersistentStore() {
    do {
        guard let persistentFileURL = persistentFileURL else { return }
        let notesPlist = try Data(contentsOf: persistentFileURL)
        let decoder = PropertyListDecoder()
        let decodeditems = try decoder.decode([Notes].self, from: notesPlist)
        self.notes = decodeditems
    } catch {
        print("Error loading items from plist: \(error)")
    }
}
    
}
