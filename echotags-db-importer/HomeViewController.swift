//
//  HomeViewController.swift
//  echotags-db-importer
//
//  Created by bkzl on 25/05/16.
//  Copyright © 2016 bkzl. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var pathTextField: UITextField! {
        didSet {
            let path = Realm.Configuration.defaultConfiguration.fileURL
            print(path)
            pathTextField.text = path?.absoluteString
            pathTextField.becomeFirstResponder()

        }
    }
    
    @IBOutlet weak var categoriesCountLabel: UILabel! {
        didSet {
            categoriesCountLabel.text = String(Data.db.objects(Category).count)
        }
    }
    
    @IBOutlet weak var pointsCountLabel: UILabel! {
        didSet {
            pointsCountLabel.text = String(Data.db.objects(Point).count)
        }
    }
    
    @IBOutlet weak var markersCountLabel: UILabel! {
        didSet {
            markersCountLabel.text = String(Data.db.objects(Marker).count)
        }
    }
}
