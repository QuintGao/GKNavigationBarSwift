//
//  GKDemo004ViewController.swift
//  Example
//
//  Created by QuintGao on 2022/7/29.
//  Copyright © 2022 QuintGao. All rights reserved.
//

import UIKit

class GKDemo004ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        gk_navTitle = "UITableViewController"
        gk_navBackgroundColor = .blue
        gk_navBarAlpha = 0
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }else {
            automaticallyAdjustsScrollViewInsets = false
        }
        tableView.contentInset = UIEdgeInsets(top: gk_navigationBar.frame.size.height, left: 0, bottom: 0, right: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        var frame = gk_navigationBar.frame
        frame.origin.y = 0
        gk_navigationBar.frame = frame
        tableView.superview?.addSubview(gk_navigationBar)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        view.addSubview(gk_navigationBar)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        var frame = gk_navigationBar.frame
        if gk_navigationBar.superview == view {
            frame.origin.y += tableView.contentOffset.y
        }else {
            frame.origin.y = 0
        }
        gk_navigationBar.frame = frame
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "第\(indexPath.row + 1)行"
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let navBarH = gk_navigationBar.frame.size.height
        let offsetY = scrollView.contentOffset.y + navBarH
        
        var alpha: CGFloat = 0
        if offsetY <= 0 {
            alpha = 0
        }else if offsetY >= navBarH {
            alpha = 1
        }else {
            alpha = offsetY / navBarH
        }
        if alpha >= 1 {
            gk_backStyle = .white
            gk_navTitleColor = .white
            gk_statusBarStyle = .lightContent
        }else {
            gk_backStyle = .black
            gk_navTitleColor = .black
            gk_statusBarStyle = .default
        }
        gk_navBarAlpha = alpha
    }
    
    override var prefersStatusBarHidden: Bool {
        gk_statusBarHidden
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        gk_statusBarStyle
    }
}
