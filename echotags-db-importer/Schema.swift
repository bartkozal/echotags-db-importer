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

class Point: Object {
    dynamic var title: String?
    dynamic var latitude = 0.0
    dynamic var longitude = 0.0
}

class Marker: Object {
    dynamic var point: Point?
    dynamic var category: Category?
}

class Category: Object {
    dynamic var title: String?
    dynamic var visible = true
}