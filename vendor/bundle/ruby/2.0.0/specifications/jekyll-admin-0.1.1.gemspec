# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "jekyll-admin"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org" } if s.respond_to? :metadata=
  s.authors = ["Mert Kahyao\u{11f}lu", "GitHub Open Source"]
  s.bindir = "exe"
  s.date = "2016-09-01"
  s.description = "Jekyll::Admin is a drop in administrative framework for Jekyll sites."
  s.email = ["mertkahyaoglu93@gmail.com", "opensource@github.com"]
  s.homepage = "https://github.com/jekyll/jekyll-admin"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.14"
  s.summary = "wp-admin for Jekyll, but better"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jekyll>, ["~> 3.1"])
      s.add_runtime_dependency(%q<sinatra>, ["~> 1.4"])
      s.add_runtime_dependency(%q<sinatra-contrib>, ["~> 1.4"])
      s.add_runtime_dependency(%q<addressable>, ["~> 2.4"])
      s.add_development_dependency(%q<bundler>, ["~> 1.7"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>, ["~> 3.4"])
      s.add_development_dependency(%q<rubocop>, ["~> 0.35"])
      s.add_development_dependency(%q<sinatra-cross_origin>, ["~> 0.3"])
      s.add_development_dependency(%q<gem-release>, ["~> 0.7"])
    else
      s.add_dependency(%q<jekyll>, ["~> 3.1"])
      s.add_dependency(%q<sinatra>, ["~> 1.4"])
      s.add_dependency(%q<sinatra-contrib>, ["~> 1.4"])
      s.add_dependency(%q<addressable>, ["~> 2.4"])
      s.add_dependency(%q<bundler>, ["~> 1.7"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rspec>, ["~> 3.4"])
      s.add_dependency(%q<rubocop>, ["~> 0.35"])
      s.add_dependency(%q<sinatra-cross_origin>, ["~> 0.3"])
      s.add_dependency(%q<gem-release>, ["~> 0.7"])
    end
  else
    s.add_dependency(%q<jekyll>, ["~> 3.1"])
    s.add_dependency(%q<sinatra>, ["~> 1.4"])
    s.add_dependency(%q<sinatra-contrib>, ["~> 1.4"])
    s.add_dependency(%q<addressable>, ["~> 2.4"])
    s.add_dependency(%q<bundler>, ["~> 1.7"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rspec>, ["~> 3.4"])
    s.add_dependency(%q<rubocop>, ["~> 0.35"])
    s.add_dependency(%q<sinatra-cross_origin>, ["~> 0.3"])
    s.add_dependency(%q<gem-release>, ["~> 0.7"])
  end
end
