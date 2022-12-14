//
//  Model.swift
//  Store
//
//  Created by Ян Нурков on 03.12.2022.
//

import Foundation
import UIKit
import SDWebImage


struct Sections {
    let title: String
    let settings: [SettingsCellsType]
}

struct SectionsNew {
    let title: String
    let settings: [SettingsCellsType]
}

enum SettingsCellsType {
    case buttonCell(model: SettingsButton)
}

struct SettingsButton {
    let name: String
    let image: UIImage?
}

extension Sections {
    static func getSections() -> [Sections] {
        return [
            Sections(title: "", settings: [
                .buttonCell(model: SettingsButton(name: "Phones", image: UIImage(named: "phone"))),
                .buttonCell(model: SettingsButton(name: "Computers", image: UIImage(named: "computer"))),
                .buttonCell(model: SettingsButton(name: "Heath", image: UIImage(named: "heart"))),
                .buttonCell(model: SettingsButton(name: "Books", image: UIImage(named: "book"))),
                .buttonCell(model: SettingsButton(name: "Tools", image: UIImage(named: "tools")))
            ]),
        ]
    }
}

