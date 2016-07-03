//
//  Schema.swift
//  echotags-db-importer
//
//  Created by bkzl on 25/05/16.
//  Copyright © 2016 bkzl. All rights reserved.
//

import RealmSwift

// Point has many Categories through Markers
// Category has many Points through Markers
// Point has many Triggers
// Trigger belongs to Point

class Point: Object {
    dynamic var title = ""
    dynamic var latitude = 0.0
    dynamic var longitude = 0.0
    dynamic var audio = ""
    dynamic var visited = false
    dynamic var color = ""
    let triggers = List<Trigger>()
}

class Marker: Object {
    dynamic var point: Point?
    dynamic var category: Category?
}

class Category: Object {
    dynamic var name = ""
    dynamic var visible = true
}

class Trigger: Object {
    dynamic var id = ""
    dynamic var latitude = 0.0
    dynamic var longitude = 0.0
    let point = LinkingObjects(fromType: Point.self, property: "triggers")
}
