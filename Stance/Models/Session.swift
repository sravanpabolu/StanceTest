//
//  Session.swift
//  Stance
//
//  Created by Sravan Kumar Pabolu on 21/08/24.
//

import Foundation

struct Session: Codable {
    var sets: [SetData]?
}

struct SetData: Codable {
    var timestamp: String?
    var reps: [Rep]
}

struct Rep: Codable {
    var speed, intensity: Double?
    var timestamp: String?
}
