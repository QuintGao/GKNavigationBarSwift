//
//  GKDemoWebViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/6.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import WebKit
import GKNavigationBarSwift

class GKDemoWebViewController: GKBaseViewController {

    lazy var webView: WKWebView = {
        let jsScript = "var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);"
        let wkUScript = WKUserScript(source: jsScript, injectionTime: .atDocumentEnd, forMainFrameOnly: true)
        let wkUController = WKUserContentController()
        wkUController.addUserScript(wkUScript)
        
        let wkWebConfig = WKWebViewConfiguration()
        wkWebConfig.userContentController = wkUController
        
        let frame = CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 0)
        
        let webView = WKWebView(frame: frame, configuration: wkWebConfig)
        webView.scrollView.alwaysBounceVertical = false
        if #available(iOS 11.0, *) {
            webView.scrollView.contentInsetAdjustmentBehavior = .never
        }
        webView.scrollView.gk_openGestureHandle = true
        webView.navigationDelegate = self
        
        return webView
    }()
    
    lazy var backBtn: UIBarButtonItem = {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        btn.setImage(UIImage.gk_image(with: "btn_back_black"), for: .normal)
        btn.backgroundColor = .red
        
        return UIBarButtonItem(customView: btn)
    }()
    
    lazy var closeBtn: UIBarButtonItem = {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        btn.setTitle("关闭", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .red
        
        return UIBarButtonItem(customView: btn)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.gk_navTitle = "WebView测试"
        self.gk_navLeftBarButtonItem = self.backBtn
        self.gk_navRightBarButtonItem = self.closeBtn
        
        self.view.addSubview(self.webView)
        self.webView.frame = CGRect(x: 0, y: UIDevice.statusBarNavBarHeight(), width: view.bounds.width, height: view.bounds.height - UIDevice.statusBarNavBarHeight())
        
        let filePath = Bundle.main.path(forResource: "web", ofType: "txt")
        
        let htmlString = try! String(contentsOfFile: filePath!, encoding: .utf8)
        self.webView.loadHTMLString(htmlString, baseURL: nil)
    }
}

extension GKDemoWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.navigationType == .linkActivated {
            let demo001VC = GKDemo001ViewController()
            self.navigationController?.pushViewController(demo001VC, animated: true)
            decisionHandler(.cancel)
        }else {
            decisionHandler(.allow)
        }
    }
}
