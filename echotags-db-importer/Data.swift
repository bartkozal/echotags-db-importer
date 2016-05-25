//
//  Data.swift
//  echotags-db-importer
//
//  Created by bkzl on 25/05/16.
//  Copyright © 2016 bkzl. All rights reserved.
//

import RealmSwift

class Data {
    static let db = try! Realm()
    
    static func populate() {
        let point = Point(value: ["Upstream Gallery", 52.369078, 4.89752539999995, ""])
        let category = Category(value: ["Art", true])
        let marker = Marker(value: [point, category])
        
        try! db.write {
            db.add(point)
            db.add(category)
            db.add(marker)
        }
    }
}