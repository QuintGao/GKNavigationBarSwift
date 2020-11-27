//
//  GKDemo008ViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/4.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarSwift

class GKDemo002ViewController: GKBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.gk_navTitle = "嵌套TZImagePickerController"
        self.gk_statusBarStyle = .default
        self.gk_navItemLeftSpace = 20
        self.gk_backImage = UIImage(named: "Mine_selected")
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "点击屏幕选取图片"
        label.sizeToFit()
        label.frame = CGRect(x: 0, y: 200, width: view.frame.size.width, height: label.frame.size.height)
        self.view.addSubview(label)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let pickerVC = TZImagePickerController(maxImagesCount: 9, delegate: self)
        pickerVC?.allowCrop = true
        pickerVC?.modalPresentationStyle = .fullScreen
        present(pickerVC!, animated: true, completion: nil)
    }
}

extension GKDemo002ViewController: TZImagePickerControllerDelegate {
    func tz_imagePickerControllerDidCancel(_ picker: TZImagePickerController!) {
//        GKConfigure.gk_disableFixSpace = false
    }
    
    func imagePickerController(_ picker: TZImagePickerController!, didFinishPickingPhotos photos: [UIImage]!, sourceAssets assets: [Any]!, isSelectOriginalPhoto: Bool) {
//        GKConfigure.gk_disableFixSpace = false
    }
}
