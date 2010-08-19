Gem::Specification.new do |s|
  s.name = %q{machined-rails}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ['Jacob Lewallen']
  s.date = %q{2010-08-18}
  s.description = %q{}
  s.email = %q{jlewalle@gmail.com}
  s.extra_rdoc_files = [
  ]
  s.files = [
    "lib/machined-rails.rb",
    "lib/helpers/developer_helper.rb",
    "lib/helpers/dependency_helper.rb",
    "lib/helpers/title_helper.rb",
    "lib/helpers/attributes_helper.rb"
  ]
  s.homepage = %q{http://github.com/jlewallen/machined-rails}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.summary = %q{}
  s.test_files = [
  ]

  s.specification_version = 3
  s.add_runtime_dependency(%q<responders>, ["~> 0.6.0"])
  s.add_runtime_dependency(%q<has_scope>, ["~> 0.5.0"])
end
