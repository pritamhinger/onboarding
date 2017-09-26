//
//  ViewController.swift
//  OnBoarding
//
//  Created by Pritam Hinger on 25/09/17.
//  Copyright © 2017 AppDevelapp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    let cellId = "CellId"
    
    let pages: [Page] = {
        let firstPage = Page(title: "Welcome Onboard", message: "Share your basic details in case you need some help.", imageName: "page1")
        let secondPage = Page(title: "Connect", message: "Connect with other members. A friend in need is friend indeed.", imageName: "page1")
        let thirdPage = Page(title: "Share", message: "Share information in case someone needs your help. Share to Care", imageName: "page1")
        return [firstPage, secondPage, thirdPage]
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.isPagingEnabled = true
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
    }
}

// MARK: - UICollectionViewDataSource Implementation
extension ViewController{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        
        let page = pages[indexPath.row]
        cell.page = page
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Implementation
extension ViewController{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
