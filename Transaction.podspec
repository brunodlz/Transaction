Pod::Spec.new do |s|

  s.name         = "Transaction"
  s.version      = "1.0.2"
  s.summary      = "Framework to transaction between segue"
  s.homepage     = "https://github.com/brunodlz/Transaction"
  s.license      = { type: 'MIT', file: 'LICENSE' }
  s.author             = { "Bruno da Luz" => "brunolabx@gmail.com" }
  s.social_media_url   = "http://twitter.com/brunodlz"

  s.platform     = :ios, "9.0"
  s.requires_arc = true
  s.source       = { :git => "https://github.com/brunodlz/Transaction.git", :tag => "#{s.version}" }
  s.source_files = "Transaction", "Transaction/**/*.{h,swift}"
  
end
