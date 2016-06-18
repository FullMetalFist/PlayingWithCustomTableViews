//
//  EmbeddedButtonCell.swift
//  PlayingWithCustomTableViews
//
//  Created by Michael Vilabrera on 6/18/16.
//  Copyright © 2016 Michael Vilabrera. All rights reserved.
//

import UIKit

protocol EmbeddedDelegate: NSObjectProtocol {
    func cellDidTapButton(sender: EmbeddedButtonCell)
}

class EmbeddedButtonCell: UITableViewCell {
    
    var delegate: EmbeddedDelegate?
    
    @IBOutlet weak var buttonToTap: UIButton!
    @IBAction func embeddedButtonTapped(sender: UIButton) {
        self.delegate?.cellDidTapButton(self)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
