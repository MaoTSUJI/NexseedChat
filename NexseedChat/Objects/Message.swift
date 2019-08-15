//
//  Message.swift
//  NexseedChat
//
//  Created by 辻真緒 on 2019/08/15.
//  Copyright © 2019 辻真緒. All rights reserved.
//

import MessageKit

struct Message: MessageType {

    // 送信者
    let user: ChatUser
    
    // 本文
    let text: String
    
    // メッセージ1件ごとに振られた固有ID
    let messageId: String
    
    // 送信日時
    let sentDate: Date
    
    var sender: SenderType {
        return Sender(id: user.uid, displayName: user.name)
    }
    
    var kind: MessageKind {
        return .text(text)
    }
    
}
