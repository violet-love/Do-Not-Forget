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
        let x = Notes(noteBlock: "Hello This is a test Note", dateCreated: Date(), alarm: 65.87)
        notesCreated.append(x)
        saveToPersistanceStore()
    }


//MARK: - Persistence
var persistentFileURL: URL? {
    let fileManager = FileManager.default
    let documentsDir = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
    let dontForgetURL = documentsDir?.appendingPathComponent("notes.plist")
    return dontForgetURL
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
        let decodeditems = try decoder.decode(notesCreated.self, from: notesPlist)
        self.notes = decodeditems
    } catch {
        print("Error loading items from plist: \(error)")
    }
}
    
}
