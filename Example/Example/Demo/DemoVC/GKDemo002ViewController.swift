//
//  GKDemo008ViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/4.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import TZImagePickerController
import GKNavigationBarSwift

class GKDemo002ViewController: GKBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.gk_navTitle = "TZImagePickerController使用"
        self.gk_statusBarStyle = .default
        
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 200, width: 80, height: 30)
        btn.setTitle("选取图片", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .red
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func btnAction() {
        let pickerVC = TZImagePickerController(maxImagesCount: 1, delegate: self)
        GKConfigure.gk_disableFixSpace = true
        self.present(pickerVC!, animated: true, completion: nil)
    }
}

extension GKDemo002ViewController: TZImagePickerControllerDelegate {
    func tz_imagePickerControllerDidCancel(_ picker: TZImagePickerController!) {
        GKConfigure.gk_disableFixSpace = false
    }

    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingPhotos photos: [UIImage]!, sourceAssets assets: [Any]!, isSelectOriginalPhoto: Bool) {
        GKConfigure.gk_disableFixSpace = false
    }
}
