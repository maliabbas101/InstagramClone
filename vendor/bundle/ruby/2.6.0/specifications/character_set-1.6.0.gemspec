# -*- encoding: utf-8 -*-
# stub: character_set 1.6.0 ruby lib
# stub: ext/character_set/extconf.rb

Gem::Specification.new do |s|
  s.name = "character_set".freeze
  s.version = "1.6.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Janosch Mu\u0308ller".freeze]
  s.date = "2022-02-16"
  s.email = ["janosch84@gmail.com".freeze]
  s.extensions = ["ext/character_set/extconf.rb".freeze]
  s.files = ["ext/character_set/extconf.rb".freeze]
  s.homepage = "https://github.com/jaynetics/character_set".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0".freeze)
  s.rubygems_version = "3.0.9".freeze
  s.summary = "Build, read, write and compare sets of Unicode codepoints.".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<sorted_set>.freeze, ["~> 1.0"])
    else
      s.add_dependency(%q<sorted_set>.freeze, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<sorted_set>.freeze, ["~> 1.0"])
  end
end
