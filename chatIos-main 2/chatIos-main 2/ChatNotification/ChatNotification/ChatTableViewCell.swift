//
//  ChatTableViewCell.swift
//  ChatNotification
//
//  Created by Jesús Fernández on 17/2/23.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var foto: UIImage!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
