//
//  PageCell.swift
//  OnBoarding
//
//  Created by Pritam Hinger on 25/09/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .yellow
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        backgroundColor = .blue
        addSubview(imageView)
        imageView.anchorToTop(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        
        imageView.image = UIImage(named: "page1")
    }
}
