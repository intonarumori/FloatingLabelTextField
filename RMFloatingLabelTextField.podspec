Pod::Spec.new do |s|

  s.name = "RMFloatingLabelTextField"
  s.version = "0.0.1"
  s.license = { :type => "MIT", :file => "LICENSE.md" }
  s.summary = "A clean and flexible Swift implementation of the floating label UI pattern for UITextField"
  s.homepage = "http://github.com/intonarumori/FloatingLabelTextField"
  s.social_media_url = "http://twitter.com/rumori"
  s.authors = { "Daniel Langh" => "intonarumori@gmail.com" }
  s.source = { :git => "https://github.com/Intonarumori/FloatingLabelTextField.git", :tag => s.version }
  
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
                   DESC

  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.ios.deployment_target = '8.0'
  s.source_files = 'Source/*.swift'
end
