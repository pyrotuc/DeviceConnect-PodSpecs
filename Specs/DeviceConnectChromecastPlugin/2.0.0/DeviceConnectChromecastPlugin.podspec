# TODO: plistの変数展開はどうすれば良いだろうか。
Pod::Spec.new do |s|
    
    s.name         = "DeviceConnectChromecastPlugin"
    s.version      = "2.0.0"
    s.summary      = "Device Connect Plugin for Chromecast"
    
    s.description  = <<-DESC
    A Device Connect plugin for Chromecast.
    
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
    base_path = "dConnectDevicePlugin/dConnectDeviceChromeCast"
    
    # エンドターゲット（アプリとか）のプリコンパイルドヘッダー汚染の恐れあり。
    s.prefix_header_file = base_path + "/dConnectDeviceChromecast/dConnectDeviceChromecast-Prefix.pch"
    s.private_header_files = base_path + "/dConnectDeviceChromecast/Classes/**/*.h"
    s.source_files = base_path + "/dConnectDeviceChromecast/Classes/**/*.{h,m}"
    s.resource_bundles = {"dConnectDeviceChromecast_resources" => [base_path + "/dConnectDeviceChromecast/Resources/**/*.{#{common_resource_exts}}"]}
    
    s.dependency "DeviceConnectSDK"
    s.vendored_frameworks = base_path + "/GoogleCastSDK-2.6.0-Release/GoogleCast.framework"
    
end
