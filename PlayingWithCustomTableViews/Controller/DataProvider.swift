//
//  DataProvider.swift
//  PlayingWithCustomTableViews
//
//  Created by Michael Vilabrera on 6/4/16.
//  Copyright © 2016 Michael Vilabrera. All rights reserved.
//

import UIKit

private enum Section: Int {
    case Top
    case Middle
    case Bottom
}

private struct CellIdentifier {
    let cell = "cell"
    let embed = "EmbeddedButtonCell"
}

class DataProvider: NSObject, UITableViewDataSource, UITableViewDelegate, EmbeddedDelegate {
    
    var itemKind: NSObject?
    var value: Int?
    
    // MARK: UITableView Delegate methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    
    // MARK: UITableView DataSource methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let theSection = Section(rawValue: indexPath.section) else { fatalError() }
        
        switch theSection {
        case .Top, .Bottom:
            let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier().cell)
            return cell!
        case .Middle:
            let cell = tableView.dequeueReusableCellWithIdentifier(CellIdentifier().embed) as? EmbeddedButtonCell
            cell?.delegate = self
            return cell!
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        self.value = section
        let button = UIButton()
        button.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 50)
        button.addTarget(self, action: #selector(DataProvider.buttonHeaderAction), forControlEvents: .TouchUpInside)
        button.backgroundColor = UIColor.greenColor()
        let view = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 50))
        button.titleLabel?.text = "\(section)"
        view.addSubview(button)
        return view
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func buttonHeaderAction() {
        print("button in Header tapped")
    }
    
    func cellDidTapButton(sender: EmbeddedButtonCell) {
        print("button tapped")
    }
}
