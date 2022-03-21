//
//  GKDemo007ViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/4.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit

class GKDemo001ViewController: GKBaseViewController {

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: self.view.bounds)
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = .red
        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        scrollView.gk_openGestureHandle = true
        
        
        let scrollW = scrollView.frame.size.width
        let scrollH = scrollView.frame.size.height
        
        for i in 0..<self.images.count {
            let imageView = UIImageView()
            imageView.frame = CGRect(x: CGFloat(i) * scrollW, y: 0, width: scrollW, height: scrollH)
            imageView.image = self.images[i]
            scrollView.addSubview(imageView)
        }
        scrollView.contentSize = CGSize(width: CGFloat(self.images.count) * scrollW, height: 0)
        
        return scrollView
    }()
    
    lazy var images: [UIImage] = {
        var images: [UIImage] = [UIImage]()
        for i in 0..<7 {
            let imageName = String(format: "00%zd", i+1)
            images.append(UIImage(named: imageName)!)
        }
        return images
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.gk_navigationBar.isHidden = true
        self.view.addSubview(scrollView)
    }
}
