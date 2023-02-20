//
//  MessageTableViewCellTableViewController.swift
//  ChatNotification
//
//  Created by Jesús Fernández on 18/2/23.
//

import UIKit

class MessageTableViewCell: UITableViewCell{

    @IBOutlet weak var messageLabel: UILabel!
    override func awakeFromNib(){
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
