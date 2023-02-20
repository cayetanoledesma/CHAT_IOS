//
//  Message.swift
//  ChatNotification
//
//  Created by Jesús Fernández on 18/2/23.
//

import Foundation
import UIKit

class Message: Identifiable, Decodable, Encodable {

    var messageText: String?
    var messageUserId: Int?
    
    init(messageText: String?, messageUserId: Int?){
        self.messageUserId = messageUserId
        self.messageText = messageText
    }
    
}
