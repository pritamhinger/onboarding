//
//  PageCell.swift
//  OnBoarding
//
//  Created by Pritam Hinger on 25/09/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import UIKit
//import Foundation

class PageCell: UICollectionViewCell {
    
    var page: Page?{
        didSet{
            guard let page = page else {
                return
            }
            
            imageView.image = UIImage(named: page.imageName)
            
            let color = UIColor(white: 0.2, alpha: 1)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center
            let attributedText = NSMutableAttributedString(string: page.title, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20, weight: .medium), NSAttributedStringKey.foregroundColor: color])
            attributedText.append(NSAttributedString(string: "\n\n\(page.message)", attributes:[NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14, weight: .medium), NSAttributedStringKey.foregroundColor: color]))
            
            let length = attributedText.string.characters.count
            attributedText.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: length))
            textView.attributedText = attributedText
        }
    }
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .yellow
        view.clipsToBounds = true
        return view
    }()
    
    let lineSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        return view
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.text = "PAGE TEST WILL GO HERE"
        tv.isEditable = false
        tv.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        addSubview(imageView)
        addSubview(textView)
        addSubview(lineSeparator)
        
        imageView.anchorToTop(topAnchor, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        textView.anchorWithConstantsToTop(nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        lineSeparator.anchorToTop(nil, left: leftAnchor, bottom: textView.topAnchor, right: rightAnchor)
        lineSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        imageView.image = UIImage(named: "page1")
    }
}
