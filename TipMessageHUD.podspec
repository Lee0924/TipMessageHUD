# 一个顺序：修改完本地的项目后要先上传到gitlab的仓库，再在gitlab的仓库添加标签，然后再把本地的项目push到pod的仓库，让后在终端更新下本地的pod仓库 pod repo update,然后把项目中的pod文件都删除只剩下Podfile文件，再重新pod install，按照这个顺序才有效
Pod::Spec.new do |s|

s.name         = 'TipMessageHUD'
s.version      = '0.0.1'
#总结
s.summary      = '标签指示器'
# 说明
s.description  = <<-DESC
    标签的指示器
DESC
#   项目地址
s.homepage     = 'https://github.com/Lee0924/TipMessageHUD'
# s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
s.author             = { "Lee0924" => "Leejialin0924@163.com" }
s.platform     = :ios, "9.0"
s.source       = { :git => "https://github.com/Lee0924/TipMessageHUD.git", :tag => "v#{s.version}"}
#   开源许可
s.license          = "MIT"


# s.library   = "iconv"
# s.libraries = "iconv", "xml2"
s.requires_arc = true

# s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }

 s.dependency "MBProgressHUD", '~> 1.1.0' #在项目引用时一定要用 <MBProgressHUD/MBProgressHUD.h>,不能用<Masonry.h>,其他第三方的也是一样


s.subspec 'TipMessageHUD' do |ss|
    ss.source_files = 'TipMessageHUD/MessageHUD/*.{h,m}'
end


end
