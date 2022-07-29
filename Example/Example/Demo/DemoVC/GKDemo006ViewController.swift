//
//  GKDemo006ViewController.swift
//  Example
//
//  Created by QuintGao on 2022/7/29.
//  Copyright © 2022 QuintGao. All rights reserved.
//

import UIKit

class GKDemo006ViewController: GKBaseViewController {

    lazy var printBtn: UIButton = {
       let btn = UIButton()
        btn.setTitle("打印机", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(printAction(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var shareBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("系统分享", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(shareAction(_:)), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gk_navTitle = "系统功能"
        gk_navRightBarButtonItem = UIBarButtonItem.gk_item(title: "哈哈", target: self, action: #selector(systemAction(_:)))
        gk_navItemRightSpace = 40
        
        view.addSubview(printBtn)
        view.addSubview(shareBtn)
        
        printBtn.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(gk_navigationBar.snp.bottom).offset(50)
            $0.width.equalTo(100.0)
            $0.height.equalTo(40.0)
        }
        
        shareBtn.snp.makeConstraints {
            $0.centerX.equalTo(self.view)
            $0.top.equalTo(printBtn.snp.bottom).offset(50)
            $0.width.equalTo(100.0)
            $0.height.equalTo(40.0)
        }
    }
    
    @objc func printAction(_ sender: Any) {
        let pic = UIPrintInteractionController.shared
        let url = URL(string: "https://img2.baidu.com/it/u=566500983,3412942035&fm=253&fmt=auto&app=138&f=JPEG?w=440&h=955")
        if UIPrintInteractionController.canPrint(url!) {
            pic.delegate = self
            
            let printInfo = UIPrintInfo.printInfo()
            printInfo.outputType = .general
            printInfo.jobName = "PintingImage"
            printInfo.duplex = .shortEdge
            pic.printInfo = printInfo
            pic.showsPageRange = false
            pic.printingItem = url
            
            let completion: UIPrintInteractionController.CompletionHandler = { pic, completed, error in
                if !completed && error != nil {
                    print("failed with error = \(String(describing: error))")
                }
            }
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                pic.present(from: self.view.frame, in: self.view, animated: true, completionHandler: completion)
            }else {
                pic.present(animated: true, completionHandler: completion)
            }
        }
    }
    
    @objc func shareAction(_ sender: Any) {
        // 分享文件
        let url = URL(string: "https://img2.baidu.com/it/u=566500983,3412942035&fm=253&fmt=auto&app=138&f=JPEG?w=440&h=955")
        let activityVC = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
        activityVC.excludedActivityTypes = [.mail, .postToTwitter, .message, .print, .assignToContact, .addToReadingList, .postToFlickr, .postToVimeo, .postToTencentWeibo, .openInIBooks]
        activityVC.completionWithItemsHandler = { activityType, completed, returnedItems, error in
            if completed {
                print("分享成功")
            }else {
                print("分享失败")
            }
        }
        
        let popover = activityVC.popoverPresentationController
        if popover != nil {
            popover?.sourceView = self.shareBtn
            popover?.permittedArrowDirections = .down
        }
        
        self.present(activityVC, animated: true)
    }
    
    @objc func systemAction(_ sender: Any) {
        let demoVC = GKDemo003ViewController()
        navigationController?.pushViewController(demoVC, animated: true)
    }
}

extension GKDemo006ViewController: UIPrintInteractionControllerDelegate {
    
}
