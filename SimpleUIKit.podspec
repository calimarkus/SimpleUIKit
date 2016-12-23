Pod::Spec.new do |s|

  s.name         = "SimpleUIKit"
  s.version      = "1.0.1"
  s.summary      = "This is a collection of a few UIKit API's simplified."
  s.description  = "This simplifies the usage for various UIKit classes. See the subpods description"

  s.homepage     = "https://github.com/calimarkus/SimpleUIKit"
  s.license      = { :type => 'MIT' }
  s.author       = { "Markus Emrich" => "markus.emrich@gmail.com" }
  s.platform     = :ios

  s.source       = { :git => "https://github.com/calimarkus/SimpleUIKit.git", :tag => "#{s.version}" }

  s.subspec 'SimpleActivityView' do |activity|
    activity.source_files  = 'SimpleUIKit/SimpleActivityView/*.{h,m}'
  end

  s.subspec 'SimpleAlertController' do |alert|
    alert.source_files  = 'SimpleUIKit/SimpleAlertController/*.{h,m}'
  end

  s.subspec 'SimpleAttributedString' do |attributed|
    attributed.source_files  = 'SimpleUIKit/SimpleAttributedString/*.{h,m}'
  end

  s.subspec 'SimpleLocalNotification' do |local|
    local.source_files  = 'SimpleUIKit/SimpleLocalNotification/*.{h,m}'
  end

  s.subspec 'SimpleUIKit' do |motion|
    motion.source_files  = 'SimpleUIKit/SimpleUIKit/*.{h,m}'
  end

  s.subspec 'SimplePositioning' do |positioning|
    positioning.source_files  = 'SimpleUIKit/SimplePositioning/*.{h,m}'
  end

  s.subspec 'SimpleTableView' do |tableView|
    tableView.source_files  = 'SimpleUIKit/SimpleTableView/*.{h,m}'
  end

end
