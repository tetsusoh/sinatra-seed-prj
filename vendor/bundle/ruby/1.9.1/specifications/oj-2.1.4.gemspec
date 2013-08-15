# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "oj"
  s.version = "2.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Peter Ohler"]
  s.date = "2013-07-04"
  s.description = "The fastest JSON parser and object serializer. "
  s.email = "peter@ohler.com"
  s.extensions = ["ext/oj/extconf.rb"]
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md", "ext/oj/extconf.rb"]
  s.homepage = "http://www.ohler.com/oj"
  s.licenses = ["MIT", "GPL-3.0"]
  s.rdoc_options = ["--main", "README.md"]
  s.require_paths = ["lib", "ext"]
  s.rubyforge_project = "oj"
  s.rubygems_version = "2.0.6"
  s.summary = "A fast JSON parser and serializer."
end
