Pod::Spec.new do |s|
  s.name         = "GKNavigationBarSwift"
  s.version      = "1.0.2"
  s.summary      = "Customize navigation bar, adding navigation bar for each controller"
  s.homepage     = "https://github.com/QuintGao/GKNavigationBarSwift"
  s.license      = 'MIT'
  s.authors      = { "高坤" => "1094887059@qq.com" }
  s.social_media_url   = "https://github.com/QuintGao"
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/QuintGao/GKNavigationBarSwift.git", :tag => s.version }
  s.source_files  = 'Sources/*.swift'
  s.resource      = 'Sources/GKNavigationBarSwift.bundle'

  s.swift_version = '5.0'
  s.requires_arc  = true

end
