//
//  Data.swift
//  echotags-db-importer
//
//  Created by bkzl on 25/05/16.
//  Copyright © 2016 bkzl. All rights reserved.
//

import Foundation
import RealmSwift
import Alamofire
import SwiftyJSON

struct API {
    static let baseURL = "http://marker.echotags.io"
    private static let user = "echotags"
    private static let password = "iwantabanana"
    static var vc: UIViewController = UIViewController()
    
    static var credentials: NSURLCredential {
        return NSURLCredential(user: user, password: password, persistence: .ForSession)
    }
    
    static func get(resource: String, completion: (JSON) -> ()) {
        Alamofire.request(.GET, "\(baseURL)/\(resource).json").authenticate(usingCredential: credentials).responseJSON { response in
            switch response.result {
            case .Success:
                if let data = response.data {
                    completion(JSON(data: data))
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
}

class Data {
    static let db = try! Realm()
    
    static func populate(vc: UIViewController) {
        let hvc = vc as! HomeViewController
        
        try! db.write {
            db.deleteAll()
        }
        
        API.get("categories") { json in
            for (_, category) in json {
                let title = category["title"].string!
                let visible = true
                try! db.write {
                    db.add(Category(value: [title, visible]))
                }
            }
            
            hvc.categoriesCountLabel.text = String(Data.db.objects(Category).count)
        }
        
        API.get("points") { json in
            for (_, point) in json {
                let title = point["title"].string!
                let latitude = point["latitude"].double!
                let longitude = point["longitude"].double!
                try! db.write {
                    db.add(Point(value: [title, latitude, longitude]))
                }
            }
            
            hvc.pointsCountLabel.text = String(Data.db.objects(Point).count)
        }
        
        API.get("markers") { json in
            for (_, marker) in json {
                let point = db.objects(Point).filter("title = %@", marker["point"].string!)[0]
                let category = db.objects(Category).filter("title = %@", marker["category"].string!)[0]
                
                try! db.write {
                    db.add(Marker(value: [point, category]))
                }
            }
            
            hvc.markersCountLabel.text = String(Data.db.objects(Marker).count)
        }
    }
}