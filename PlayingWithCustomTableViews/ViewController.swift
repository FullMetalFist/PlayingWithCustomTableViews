//
//  ViewController.swift
//  PlayingWithCustomTableViews
//
//  Created by Michael Vilabrera on 6/4/16.
//  Copyright © 2016 Michael Vilabrera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dataProvider: protocol<UITableViewDataSource, UITableViewDelegate>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "EmbeddedButtonCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "EmbeddedButtonCell")
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
}

