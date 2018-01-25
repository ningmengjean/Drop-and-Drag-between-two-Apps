//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by wangchi on 2018/1/24.
//  Copyright © 2018年 Zhu xiaojin. All rights reserved.
//

import UIKit

class EmojiArtView: UIView, UIDropInteractionDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addInteraction(UIDropInteraction(delegate: self))
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSAttributedString.self)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, sessionDidUpdate session: UIDropSession) -> UIDropProposal {
        return UIDropProposal(operation: .copy)
    }
    
    func dropInteraction(_ interaction: UIDropInteraction, performDrop session: UIDropSession) {
        session.loadObjects(ofClass: NSAttributedString.self) { providers in
            let dropPoint = session.location(in: self)
            for attibutedString in providers as? [NSAttributedString] ?? [] {
                self.addLabel(with: attibutedString, centeredAt: dropPoint)
            }
        }
    }
    
    private func addLabel(with attributedString: NSAttributedString, centeredAt point: CGPoint)  {
        let label = UILabel()
        label.backgroundColor = .clear
        label.attributedText = attributedString
        label.sizeToFit()
        label.center = point
        
        addSubview(label)
    }
    
    var backgroundImage: UIImage? { didSet{setNeedsDisplay()} }
    
    override func draw(_ rect: CGRect) {
        backgroundImage?.draw(in: bounds)
    }
}
