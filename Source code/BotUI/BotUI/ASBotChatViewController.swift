//
//  ASBotChatViewController.swift
//  BotUI
//
//  Created by Ankit on 10/09/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import UIKit

class ASBotChatViewController: UIViewController {

    @IBOutlet weak var collectionViewBot: UICollectionView!
    @IBOutlet weak var textFieldBot: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewBot.delegate = self
        collectionViewBot.dataSource = self
        textFieldBot.delegate = self
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ASBotChatViewController: UICollectionViewDelegate {
    
}


extension ASBotChatViewController: UICollectionViewDataSource {
    
}

extension ASBotChatViewController: UITextFieldDelegate {
    
}


