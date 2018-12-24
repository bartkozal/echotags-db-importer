//
//  HomeViewController.swift
//  echotags-db-importer
//
//  Created by bkzl on 25/05/16.
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
    
    @IBOutlet weak var categoriesCountLabel: UILabel!
    @IBOutlet weak var pointsCountLabel: UILabel!
    @IBOutlet weak var markersCountLabel: UILabel!
    @IBOutlet weak var triggersCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Data.populate(self)
    }
}
