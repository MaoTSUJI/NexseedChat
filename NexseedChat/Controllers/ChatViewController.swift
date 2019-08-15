//
//  ChatViewController.swift
//  NexseedChat
//
//  Created by 辻真緒 on 2019/08/15.
//  Copyright © 2019 辻真緒. All rights reserved.
//

import UIKit
import Firebase
import MessageKit
import InputBarAccessoryView

class ChatViewController: MessagesViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // 全メッセージを保持する変数
    var messages: [Message] = [] {
        // 変数が書き換わった時、
        didSet {
            messagesCollectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}

extension ChatViewController: MessagesDataSource {
    
    // 自分の情報(ログインユーザー)
    func currentSender() -> SenderType {
        let user = Auth.auth().currentUser!
        
        // ログイン中のユーザーのUID、displayNameを使って、
        // MessageKit用に送信者の情報を作成
        return Sender(id: user.uid, displayName: user.displayName!)
        
    }
    
    // 画面に表示するメッセージ
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
        // MessageKitの場合はrowではない
    }
    
    // メッセージの件数
    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messages.count
    }
    
}
// Messageのレイアウトデザインを変更する
extension ChatViewController: MessagesLayoutDelegate {
    
    
}
extension ChatViewController: MessageCellDelegate {
    
}
// 送信バーに関する設定
extension ChatViewController: InputBarAccessoryViewDelegate {
    
    // ボタンがクリックされた時の処理   // didpressって入力したら予測変換出現
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        
        // ログインユーザーの取得
        let user = Auth.auth().currentUser!
        
        // Firestoreに接続
        let db = Firestore.firestore()
        
        // Firestoreにメッセージや送信者の情報を登録
        db.collection("messages").addDocument(data: [
            String : Any
            
            ])
        
        
        
    }
    
}
