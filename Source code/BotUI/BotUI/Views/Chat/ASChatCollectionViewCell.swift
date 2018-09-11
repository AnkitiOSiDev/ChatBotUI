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
    
    let screenWidth = UIScreen.main.bounds.width
    
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        for views in self.subviews {
            views.removeFromSuperview()
        }
    }
    func configureCell(_ cell: ASChatCollectionViewCell, at indexPath: IndexPath){
        
        if indexPath.row % 2 == 0 {
            //cell.frame.size =  CGSize(width: 375, height: 100)
            //cell.backgroundColor = UIColor.green
            showOutgoingMessage(color: .red, text: "Hi Welcome tchat world")
        }else {
           // cell.frame.size =  CGSize(width: 375, height: 50)
          //  cell.backgroundColor = UIColor.yellow
            showIncomingMessage()
        }
        
    }
    
    func showIncomingMessage() {
        let halfScreen = screenWidth / 2
        
        let bubbleImageSize = CGSize(width: halfScreen,
                                     height: halfScreen / 0.75)
        
        let incomingMessageView = UIImageView(frame:
            CGRect(x: 0,
                   y: 0,
                   width: bubbleImageSize.width,
                   height: bubbleImageSize.height))
        
        let bubbleImage = UIImage(named: "incoming")?
            .resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21),
                            resizingMode: .stretch)
            .withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        
        incomingMessageView.image = bubbleImage
        incomingMessageView.tintColor = UIColor.cyan
        
//        let maskView = UIImageView(image: bubbleImage)
//        maskView.frame = incomingMessageView.bounds
//          incomingMessageView.image = UIImage(named: "photo")
//          incomingMessageView.mask = maskView
        self.frame.size = CGSize(width: screenWidth, height: incomingMessageView.frame.size.height)
       
        self.addSubview(incomingMessageView)
        
    }
    
    func showOutgoingMessage(color: UIColor, text: String) {
        let label =  UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.text = text
        
        let constraintRect = CGSize(width: 0.66 * screenWidth,
                                    height: .greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [.font: label.font],
                                            context: nil)
        label.frame.size = CGSize(width: ceil(boundingBox.width),
                                  height: ceil(boundingBox.height))
        
        let bubbleImageSize = CGSize(width: label.frame.width + 28,
                                     height: label.frame.height + 20)
        
        let outgoingMessageView = UIImageView(frame:
            CGRect(x: screenWidth - bubbleImageSize.width - 20,
                   y: 0,
                   width: bubbleImageSize.width,
                   height: bubbleImageSize.height))
        
        let bubbleImage = UIImage(named: "outgoing")?
            .resizableImage(withCapInsets: UIEdgeInsets(top: 17, left: 21, bottom: 17, right: 21),
                            resizingMode: .stretch)
            .withRenderingMode(UIImageRenderingMode.alwaysTemplate)
        
        outgoingMessageView.image = bubbleImage
        outgoingMessageView.tintColor = color
        
        self.frame.size = CGSize(width: screenWidth, height: outgoingMessageView.frame.size.height)
        self.addSubview(outgoingMessageView)
        
        label.center = outgoingMessageView.center
        
        self.addSubview(label)
    }

}
