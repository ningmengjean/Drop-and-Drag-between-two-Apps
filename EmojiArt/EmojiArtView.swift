//
//  EmojiArtView.swift
//  EmojiArt
//
//  Created by wangchi on 2018/1/24.
//  Copyright © 2018年 Zhu xiaojin. All rights reserved.
//

import UIKit

class EmojiArtView: UIView {

    var backgroundImage: UIImage? { didSet{setNeedsDisplay()} }
    
    override func draw(_ rect: CGRect) {
        backgroundImage?.draw(in: bounds)
    }
}
