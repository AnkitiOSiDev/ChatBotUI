//
//  ASChatCollectionViewCell.swift
//  BotUI
//
//  Created by Ankit on 10/09/18.
//  Copyright © 2018 Ankit. All rights reserved.
//

import UIKit


class ASChatCollectionViewCell: UICollectionViewCell {

    static let sizingCell =  Bundle.main.loadNibNamed(ASChatCollectionViewCell.identifier, owner: self, options: nil)?.first as? ASChatCollectionViewCell
    
    
    static var identifier: String {
        return String(describing: self)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
