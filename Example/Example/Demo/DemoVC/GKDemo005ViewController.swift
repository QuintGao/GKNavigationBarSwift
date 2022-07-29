//
//  GKDemo005ViewController.swift
//  Example
//
//  Created by QuintGao on 2022/7/29.
//  Copyright © 2022 QuintGao. All rights reserved.
//

import UIKit
import WebKit
import SnapKit
import GKNavigationBarSwift

class GKDemo005ViewController: GKBaseViewController {

    lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.allowsBackForwardNavigationGestures = true
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(webView)
        webView.snp.makeConstraints {
            $0.left.right.bottom.equalTo(self.view)
            $0.top.equalTo(self.gk_navigationBar.snp.bottom)
        }
        
        webView.addObserver(self, forKeyPath: "title", options: .new, context: nil)
        webView.addObserver(self, forKeyPath: "canGoBack", options: .new, context: nil)
        
        let url = "http://www.qukanvideo.com/cloud/h5/1609067279049903"
        webView.load(URLRequest(url: URL(string: url)!))
    }
    
    deinit {
        webView.removeObserver(self, forKeyPath: "title")
        webView.removeObserver(self, forKeyPath: "canGoBack")
    }
    
    
    // GKGesturePopHandleProtocol
    func popGestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
    // KVO
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "title" {
            gk_navTitle = webView.title
        }else if keyPath == "canGoBack" {
            if webView.canGoBack {
                gk_interactivePopDisabled = true
            }else {
                gk_interactivePopDisabled = false
            }
        }
    }
}
