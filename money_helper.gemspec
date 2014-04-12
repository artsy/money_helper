Gem::Specification.new do |s|
  s.name        = 'money_helper'
  s.version     = '0.0.5'
  s.date        = '2014-04-12'
  s.summary     = "MoneyHelper international price formatting utility"
  s.description = "A simple module to assist in formatting unambiguous prices and price ranges in international currencies in a Roman Script context."
  s.authors     = ["Sahil Yakhmi", "Joey Aghion"]
  s.email       = 'sahil@artsymail.net'
  s.files       = Dir['lib/*.rb']
  s.test_files  = Dir['spec/*.rb']
  s.homepage    = 'https://github.com/syakhmi/money_helper'
  s.add_dependency('money', '>= 6.0')
  s.add_dependency('activesupport', '>= 3.0')
  s.add_development_dependency('rspec')
  s.licenses = ['MIT']
end
