Pod::Spec.new do |s|
  s.name         = "PSRouter"
  s.version      = "0.0.4"
  s.summary      = "页面跳转路由"
  s.description  = <<-DESC
                   页面之间跳转路由
                   DESC
  s.homepage     = "https://github.com/yangmiemie1116/PSRouter"
  s.license      = "MIT"
  s.author             = { "杨志强" => "yangzhiqiang1116@gmail.com" }
  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/yangmiemie1116/PSRouter.git", :tag => "#{s.version}" }
  s.source_files  = "PSRouter/*.{h,m}"
  s.requires_arc = true
end
