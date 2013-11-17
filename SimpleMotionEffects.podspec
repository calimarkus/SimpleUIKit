Pod::Spec.new do |s|

  s.name         = "SimpleMotionEffects"
  s.version      = "0.0.1"
  s.summary      = "This UIView Category provides the most simple API to create motion effects faster and in only a single line of code."
  s.description  = "This UIView Category provides the most simple API to create motion effects faster and in only a single line of code."

  s.homepage     = "http://EXAMPLE/SimpleMotionEffects"
  s.license      = { :type => 'MIT' }
  s.author       = { "Markus Emrich" => "markus@nxtbgthng.com" }
  s.platform     = :ios

  s.source       = { :git => "https://github.com/jaydee3/SimpleMotionEffects.git", :tag => "1.0.0" }
  s.source_files  = 'Classes', 'SimpleMotionEffects/**/*.{h,m}'

end
