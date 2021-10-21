//
//  Word.swift
//  DailyDoseOfDefinitions
//
//  Created by Raul Rodriguez III on 10/20/21.
//

import Foundation

struct Word: Codable {
    
    let word: String?
    let results: [WordDetail]?
}

struct WordDetail: Codable {
    
    let definition: String?
    let synonyms: [String]?
    let antonyms: [String]?
    let examples: [String]?
    let partOfSpeech: String?
}
