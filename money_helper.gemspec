# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'version'

Gem::Specification.new do |s|
  s.name = 'money_helper'
  s.version = MoneyHelper::VERSION
  s.summary = 'MoneyHelper international price formatting utility.'
  s.description = 'A simple module to assist in formatting unambiguous prices and price ranges in international currencies in a Roman Script context.'
  s.authors = ['Sahil Yakhmi', 'Joey Aghion', 'Matt Zikherman', 'Sarah Weir']
  s.email = 'matt@artsymail.com'
  s.platform = Gem::Platform::RUBY
  s.required_rubygems_version = '>= 1.3.6'
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ['lib']
  s.homepage = 'https://github.com/artsy/money_helper'
  s.add_dependency('activesupport')
  s.add_dependency('money', '6.16.0')
  s.add_development_dependency('appraisal')
  s.add_development_dependency('rspec', '~> 3')
  s.licenses = ['MIT']
end
