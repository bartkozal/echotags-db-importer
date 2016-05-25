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
            pathTextField.text = Realm.Configuration.defaultConfiguration.fileURL?.absoluteString
            pathTextField.becomeFirstResponder()
            
        }
    }
    
    @IBOutlet weak var categoriesCountLabel: UILabel! {
        didSet {
            dispatch_async(dispatch_get_main_queue()) {
                self.categoriesCountLabel.text = String(Data.db.objects(Category).count)
            }
        }
    }
    
    @IBOutlet weak var pointsCountLabel: UILabel! {
        didSet {
            dispatch_async(dispatch_get_main_queue()) {
                self.pointsCountLabel.text = String(Data.db.objects(Point).count)
            }
        }
    }
    
    @IBOutlet weak var markersCountLabel: UILabel! {
        didSet {
            dispatch_async(dispatch_get_main_queue()) {
                self.markersCountLabel.text = String(Data.db.objects(Marker).count)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dispatch_async(dispatch_get_main_queue()) {
            Data.populate()
        }
    }
}
