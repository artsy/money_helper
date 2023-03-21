# frozen_string_literal: true

appraise 'activesupport_52' do
  gem 'activesupport', '~> 5.2.6'
end

appraise 'activesupport_60' do
  gem 'activesupport', '~> 6.0.4'
end

appraise 'activesupport_61' do
  gem 'activesupport', '~> 6.1.4'
end

appraise 'activesupport_edge' do
  git 'https://github.com/rails/rails.git', branch: 'main' do
    gem 'activesupport', require: 'active_support'
  end
end
