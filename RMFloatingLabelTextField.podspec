Pod::Spec.new do |s|

  s.name = "RMFloatingLabelTextField"
  s.version = "0.0.4"
  s.license = { :type => "MIT", :file => "LICENSE.md" }
  s.summary = "A clean and flexible Swift implementation of the floating label UI pattern for UITextField"
  s.homepage = "http://github.com/intonarumori/FloatingLabelTextField"
  s.social_media_url = "http://twitter.com/rumori"
  s.authors = { "Daniel Langh" => "intonarumori@gmail.com" }
  s.source = { :git => "https://github.com/Intonarumori/FloatingLabelTextField.git", :tag => s.version }

  s.description  = <<-DESC
  A flexible implementation of the floating label text field UI pattern. Features include text insets, underline support, additional icon handling with subclassing, tint color support and flexible animations.
                   DESC

  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.ios.deployment_target = '8.0'
  s.source_files = 'Source/*.swift'
end
