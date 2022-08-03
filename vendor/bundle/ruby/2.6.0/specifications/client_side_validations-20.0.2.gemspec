# -*- encoding: utf-8 -*-
# stub: client_side_validations 20.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "client_side_validations".freeze
  s.version = "20.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/DavyJonesLocker/client_side_validations/issues", "changelog_uri" => "https://github.com/DavyJonesLocker/client_side_validations/blob/main/CHANGELOG.md", "rubygems_mfa_required" => "true", "source_code_uri" => "https://github.com/DavyJonesLocker/client_side_validations" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Geremia Taglialatela".freeze, "Brian Cardarella".freeze]
  s.date = "2021-12-22"
  s.description = "Client Side Validations made easy for your Rails 5 applications".freeze
  s.email = ["tagliala.dev@gmail.com".freeze, "bcardarella@gmail.com".freeze]
  s.homepage = "https://github.com/DavyJonesLocker/client_side_validations".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.5".freeze)
  s.rubygems_version = "3.0.9".freeze
  s.summary = "Client Side Validations".freeze

  s.installed_by_version = "3.0.9" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 5.2", "< 7.1"])
      s.add_runtime_dependency(%q<js_regex>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<appraisal>.freeze, ["~> 2.4"])
      s.add_development_dependency(%q<byebug>.freeze, ["~> 11.1"])
      s.add_development_dependency(%q<m>.freeze, ["~> 1.5"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.14"])
      s.add_development_dependency(%q<mocha>.freeze, ["~> 1.13"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 13.0"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.21.2"])
      s.add_development_dependency(%q<simplecov-lcov>.freeze, ["~> 0.8.0"])
      s.add_development_dependency(%q<sqlite3>.freeze, ["~> 1.4"])
      s.add_development_dependency(%q<shotgun>.freeze, ["~> 0.9.2"])
      s.add_development_dependency(%q<sinatra>.freeze, ["~> 2.1"])
      s.add_development_dependency(%q<webrick>.freeze, ["~> 1.7"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 5.2", "< 7.1"])
      s.add_dependency(%q<js_regex>.freeze, ["~> 3.1"])
      s.add_dependency(%q<appraisal>.freeze, ["~> 2.4"])
      s.add_dependency(%q<byebug>.freeze, ["~> 11.1"])
      s.add_dependency(%q<m>.freeze, ["~> 1.5"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.14"])
      s.add_dependency(%q<mocha>.freeze, ["~> 1.13"])
      s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.21.2"])
      s.add_dependency(%q<simplecov-lcov>.freeze, ["~> 0.8.0"])
      s.add_dependency(%q<sqlite3>.freeze, ["~> 1.4"])
      s.add_dependency(%q<shotgun>.freeze, ["~> 0.9.2"])
      s.add_dependency(%q<sinatra>.freeze, ["~> 2.1"])
      s.add_dependency(%q<webrick>.freeze, ["~> 1.7"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 5.2", "< 7.1"])
    s.add_dependency(%q<js_regex>.freeze, ["~> 3.1"])
    s.add_dependency(%q<appraisal>.freeze, ["~> 2.4"])
    s.add_dependency(%q<byebug>.freeze, ["~> 11.1"])
    s.add_dependency(%q<m>.freeze, ["~> 1.5"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.14"])
    s.add_dependency(%q<mocha>.freeze, ["~> 1.13"])
    s.add_dependency(%q<rake>.freeze, ["~> 13.0"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.21.2"])
    s.add_dependency(%q<simplecov-lcov>.freeze, ["~> 0.8.0"])
    s.add_dependency(%q<sqlite3>.freeze, ["~> 1.4"])
    s.add_dependency(%q<shotgun>.freeze, ["~> 0.9.2"])
    s.add_dependency(%q<sinatra>.freeze, ["~> 2.1"])
    s.add_dependency(%q<webrick>.freeze, ["~> 1.7"])
  end
end
