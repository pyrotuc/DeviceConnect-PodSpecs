# TODO: plistの変数展開はどうすれば良いだろうか。
Pod::Spec.new do |s|
    
    s.name         = "DeviceConnectSDK"
    s.version      = "2.0.0"
    s.summary      = "Device Connect SDK"
    
    s.description  = <<-DESC
    Device Connect SDK for iOS.
    
    Device Connect is an IoT solution for interconnecting various modern devices.
    Also available in Android: https://github.com/DeviceConnect/DeviceConnect-Android .
    DESC
    
    s.homepage     = "https://github.com/DeviceConnect/DeviceConnect-iOS"
    # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
    
    s.license      = {:type => "MIT", :file => "LICENSE.TXT"}
    
    s.author       = "NTT DOCOMO, INC."
    # s.authors            = { "NTT DOCOMO, INC." => "*****@*****" }
    # s.social_media_url   = "https://www.facebook.com/docomo.official"
    
    # プロパティのweak属性と、automatic property synthesisをサポートするために6.0以降が必要。
    s.platform     = :ios, "8.0"
    
    s.source       = {
        :git => "https://github.com/Shigerelloooo/DeviceConnect-iOS", :branch => "modify_cocoapods_support"
    }
    
    # エンドターゲット（アプリとか）のDebugビルドの際、対応するアーキテクチャが含まれていない
    # という旨で提供するライブラリがビルドされない問題への対処。
    s.pod_target_xcconfig = { 'ONLY_ACTIVE_ARCH' => 'NO' }
    
    common_resource_exts = "plist,lproj,storyboard,strings,xcdatamodeld,png"
    base_path = "dConnectSDK/dConnectSDKForIOS"
    
    s.preserve_path = base_path + "/NOTICE.TXT"
    
    # エンドターゲット（アプリとか）のプリコンパイルドヘッダー汚染の恐れあり。
    s.prefix_header_file = base_path + "/DConnectSDK/DConnectSDK-Prefix.pch"
    s.header_dir = "DConnectSDK"
    s.public_header_files = base_path + "/DConnectSDK/DConnectSDK/*.h"
    s.source_files = base_path + "/DConnectSDK/DConnectSDK/*.h", base_path + "/DConnectSDK/{Classes,Dependencies}/**/*.{h,m,c}"
    s.resource_bundles = {"DConnectSDK_resources" => [base_path + "/DConnectSDK/Resources/**/*.{#{common_resource_exts}}"]}
    
    s.library = "sqlite3"
    
end
