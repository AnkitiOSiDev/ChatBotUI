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

        collectionViewBot.register(ASChatCollectionViewCell.nib, forCellWithReuseIdentifier: ASChatCollectionViewCell.identifier)
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

extension ASBotChatViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if  let sizingCell = ASChatCollectionViewCell.sizingCell {
            sizingCell.prepareForReuse()
            configureCell(sizingCell, at: indexPath)
            sizingCell.setNeedsLayout()
            sizingCell.layoutIfNeeded()
            return sizingCell.frame.size
        }
        return CGSize(width: 0, height: 0)
    }
    
    func configureCell(_ cell: ASChatCollectionViewCell, at indexPath: IndexPath){
       
        if indexPath.row % 2 == 0 {
            cell.frame.size =  CGSize(width: 375, height: 100)
            cell.backgroundColor = UIColor.red
        }else {
            cell.frame.size =  CGSize(width: 375, height: 50)
            cell.backgroundColor = UIColor.blue
        }
        
    }
}

extension ASBotChatViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ASChatCollectionViewCell.identifier, for: indexPath) as? ASChatCollectionViewCell {
            configureCell(cell, at: indexPath)
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension ASBotChatViewController: UITextFieldDelegate {
    
}


