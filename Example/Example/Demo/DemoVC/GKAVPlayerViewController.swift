//
//  GKAVPlayerViewController.swift
//  Example
//
//  Created by QuintGao on 2025/1/16.
//  Copyright © 2025 QuintGao. All rights reserved.
//

import UIKit
import AVKit

class GKAVPlayerManager: NSObject {
    public static let shared = GKAVPlayerManager()
    
    public func playVideo(from: UIViewController) {
        let url = "https://vdept3.bdstatic.com/mda-qm4br6w8xehg6635/720p/h264/1733386683871039898/mda-qm4br6w8xehg6635.mp4?v_from_s=hkapp-haokan-hbf&auth_key=1736848119-0-0-d6adf27b5f58573a8be5c7120d2f7a4a&bcevod_channel=searchbox_feed&cr=2&cd=0&pd=1&pt=3&logid=2919366242&vid=5399183411636004740&klogid=2919366242&abtest="
        
        let vc = GKAVPlayerViewController()
        let item = AVPlayerItem(url: URL(string: url)!)
        let player = AVPlayer(playerItem: item)
        vc.player = player
        try? AVAudioSession.sharedInstance().setCategory(.playback)
        try? AVAudioSession.sharedInstance().setActive(true)
        
        from.present(vc, animated: true) {
            vc.player?.play()
        }
    }
}

class GKAVPlayerViewController: AVPlayerViewController {
    override var shouldAutorotate: Bool {
        false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .landscape
    }
}
