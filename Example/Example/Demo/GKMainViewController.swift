//
//  GKMainViewController.swift
//  GKNavigationBarSwift
//
//  Created by QuintGao on 2020/4/1.
//  Copyright © 2020 QuintGao. All rights reserved.
//

import UIKit
import GKNavigationBarSwift

class GKMainViewController: GKBaseViewController {

    var tableView: UITableView?
    
    var dataSource: [String] = {
        return ["导航功能测试",
                "UIScrollView使用（手势冲突）",
                "TZImagePickerController使用",
                "系统导航",
                "UITableViewController",
                "WKWebView",
                "系统功能",
                "分类页面",
                "横屏播放器",
                "网易新闻push",
                "抖音左右滑动",
                "今日头条",
                "网易云音乐",
                "网易新闻",
                "微信(自定义push、pop)",
                "present非全屏"
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.gk_navigationItem.title = "MainVC"
        self.gk_statusBarStyle = .lightContent
        self.gk_navTitleFont = UIFont.systemFont(ofSize: 18)
//        self.gk_navTitleColor = .white
        if #available(iOS 13.0, *) {
            self.gk_navTitleColor = UIColor(dynamicProvider: { collection in
                if collection.userInterfaceStyle == .dark {
                    return .black
                }else {
                    return .white
                }
            })
        } else {
            self.gk_navTitleColor = .white
        }
        self.gk_navLeftBarButtonItem = UIBarButtonItem.gk_item(title: "菜单", target: self, action: #selector(menuAction))
        
        setupTableView()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if #available(iOS 13.0, *) {
            if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                if traitCollection.userInterfaceStyle == .dark {
                    self.gk_navLeftBarButtonItem = UIBarButtonItem.gk_item(title: "黑色", target: self, action: #selector(menuAction))
                }else {
                    self.gk_navLeftBarButtonItem = UIBarButtonItem.gk_item(title: "菜单", target: self, action: #selector(menuAction))
                }
            }
        }
    }
    
    deinit {
        print("GKMainViewController deinit")
    }
    
    @objc func switchAction() {
        self.tableView?.dataSource = nil;
        self.tableView?.delegate = nil;
        
        let keywindow = UIApplication.shared.delegate?.window
        keywindow!?.rootViewController = GKWXViewController()
    }
    
    @objc func menuAction() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView?.reloadData()
    }

    func setupTableView() {
        self.tableView = UITableView(frame: .zero, style: .plain)
        self.tableView?.dataSource = self
        self.tableView?.delegate = self
        if #available(iOS 11.0, *) {
            self.tableView?.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        self.view.addSubview(self.tableView!)
        self.tableView!.snp.makeConstraints {
            $0.left.right.bottom.equalTo(self.view)
            $0.top.equalTo(self.gk_navigationBar.snp.bottom)
        }
        self.tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension GKMainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = self.dataSource[indexPath.row]
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let num: String = String(format: "%03zd", indexPath.row)

        let appName = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String

        let className = appName + "." + "GKDemo" + num + "ViewController"

        let cls = NSClassFromString(className) as? UIViewController.Type
        
        if cls != nil {
            let vc = cls!.init()
            self.navigationController?.pushViewController(vc, animated: true)
        }else {
            if indexPath.row == 9 {
                let wyNewsVC = GKWYNewsViewController()
                self.navigationController?.pushViewController(wyNewsVC, animated: true)
            }else if indexPath.row == 10 {
                let nav = UINavigationController(rootVC: GKDouyinHomeViewController())
                nav.gk_openScrollLeftPush = true
                nav.modalPresentationStyle = .fullScreen
                
                self.present(nav, animated: true, completion: nil)
                return
            }else if indexPath.row == 11 {
                let toutiaoVC = GKToutiaoViewController()
                toutiaoVC.modalPresentationStyle = .fullScreen
                self.present(toutiaoVC, animated: true, completion: nil)
            }else if indexPath.row == 12 {
                let wyMusicVC = GKWYMusicViewController()
                wyMusicVC.modalPresentationStyle = .fullScreen
                self.present(wyMusicVC, animated: true, completion: nil)
            }else if indexPath.row == 13 {
                let wyNewsVC = GKWYNewsViewController()
                wyNewsVC.modalPresentationStyle = .fullScreen
                self.present(wyNewsVC, animated: true, completion: nil)
            }else if indexPath.row == 14 {
                let wxVC = GKWXViewController()
                wxVC.modalPresentationStyle = .fullScreen
                self.present(wxVC, animated: true, completion: nil)
            }else if indexPath.row == 15 {
                let presentVC = GKPresentViewController()
                
                let nav = UINavigationController(rootVC: presentVC)
                nav.modalPresentationCapturesStatusBarAppearance = true
                present(nav, animated: true)
            }
        }
    }
}
