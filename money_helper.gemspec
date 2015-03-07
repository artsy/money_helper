Gem::Specification.new do |s|
  s.name        = 'money_helper'
  s.version     = '1.0.0'
  s.date        = '2015-03-07'
  s.summary     = "MoneyHelper international price formatting utility"
  s.description = "A simple module to assist in formatting unambiguous prices and price ranges in international currencies in a Roman Script context."
  s.authors     = ["Sahil Yakhmi", "Joey Aghion"]
  s.email       = 'sahil@artsymail.net'
  s.files       = Dir['lib/*.rb']
  s.test_files  = Dir['spec/*.rb']
  s.homepage    = 'https://github.com/syakhmi/money_helper'
  s.add_dependency('money', '~> 6.5')
  s.add_dependency('activesupport', '~> 4')
  s.add_development_dependency('rspec', '~> 3')
  s.licenses = ['MIT']
end
