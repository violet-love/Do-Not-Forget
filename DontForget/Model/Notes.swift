//
//  Notes.swift
//  Don'tForget!
//
//  Created by Jason Hoover on 5/26/20.
//  Copyright © 2020 Love. All rights reserved.
//

import UIKit

struct Notes: Codable {
    let noteBlock: String
    let dateCreated: Date
    var alarm: TimeInterval
}

