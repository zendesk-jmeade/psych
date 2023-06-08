# -*- encoding: utf-8 -*-
# frozen_string_literal: true

version_module = Module.new do
  version_rb = File.join(__dir__, "lib/psych/versions.rb")
  module_eval(File.read(version_rb), version_rb)
end

Gem::Specification.new do |s|
  s.name = "psych"
  s.version = version_module::Psych::VERSION
  s.authors = ["Aaron Patterson", "SHIBATA Hiroshi", "Charles Oliver Nutter"]
  s.email = ["aaron@tenderlovemaking.com", "hsbt@ruby-lang.org", "headius@headius.com"]
  s.summary = "Psych is a YAML parser and emitter"
  s.description = <<-DESCRIPTION
Psych is a YAML parser and emitter. Psych leverages libyaml[https://pyyaml.org/wiki/LibYAML]
for its YAML parsing and emitting capabilities. In addition to wrapping libyaml,
Psych also knows how to serialize and de-serialize most Ruby objects to and from the YAML format.
DESCRIPTION
  s.homepage = "https://github.com/ruby/psych"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]

  # for ruby core repository. It was generated by `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.files = [
    ".gitignore", "Gemfile", "LICENSE", "Mavenfile", "README.md", "Rakefile", "bin/console",
    "bin/setup", "ext/psych/depend", "ext/psych/extconf.rb", "ext/psych/psych.c", "ext/psych/psych.h",
    "ext/psych/psych_emitter.c", "ext/psych/psych_emitter.h", "ext/psych/psych_parser.c", "ext/psych/psych_parser.h",
    "ext/psych/psych_to_ruby.c", "ext/psych/psych_to_ruby.h", "ext/psych/psych_yaml_tree.c", "ext/psych/psych_yaml_tree.h",
    "lib/psych.rb", "lib/psych/class_loader.rb", "lib/psych/coder.rb", "lib/psych/core_ext.rb", "lib/psych/exception.rb",
    "lib/psych/handler.rb", "lib/psych/handlers/document_stream.rb", "lib/psych/handlers/recorder.rb",
    "lib/psych/json/ruby_events.rb", "lib/psych/json/stream.rb", "lib/psych/json/tree_builder.rb",
    "lib/psych/json/yaml_events.rb", "lib/psych/nodes.rb", "lib/psych/nodes/alias.rb", "lib/psych/nodes/document.rb",
    "lib/psych/nodes/mapping.rb", "lib/psych/nodes/node.rb", "lib/psych/nodes/scalar.rb", "lib/psych/nodes/sequence.rb",
    "lib/psych/nodes/stream.rb", "lib/psych/omap.rb", "lib/psych/parser.rb", "lib/psych/scalar_scanner.rb",
    "lib/psych/set.rb", "lib/psych/stream.rb", "lib/psych/streaming.rb", "lib/psych/syntax_error.rb",
    "lib/psych/tree_builder.rb", "lib/psych/versions.rb", "lib/psych/visitors.rb","lib/psych/visitors/depth_first.rb",
    "lib/psych/visitors/emitter.rb", "lib/psych/visitors/json_tree.rb", "lib/psych/visitors/to_ruby.rb",
    "lib/psych/visitors/visitor.rb", "lib/psych/visitors/yaml_tree.rb", "lib/psych/y.rb", "psych.gemspec"
  ]

  s.rdoc_options = ["--main", "README.md"]
  s.extra_rdoc_files = ["README.md"]

  s.required_ruby_version = Gem::Requirement.new(">= 2.5.0")
  s.required_rubygems_version = Gem::Requirement.new(">= 0")

  if RUBY_ENGINE == 'jruby'
    s.platform = 'java'
    s.files.concat [
      "ext/java/org/jruby/ext/psych/PsychEmitter.java",
      "ext/java/org/jruby/ext/psych/PsychLibrary.java",
      "ext/java/org/jruby/ext/psych/PsychParser.java",
      "ext/java/org/jruby/ext/psych/PsychToRuby.java",
      "lib/psych_jars.rb",
      "lib/psych.jar"
    ]
    s.requirements = "jar org.snakeyaml:snakeyaml-engine, #{version_module::Psych::DEFAULT_SNAKEYAML_VERSION}"
    s.add_dependency 'jar-dependencies', '>= 0.1.7'
  else
    s.extensions = ["ext/psych/extconf.rb"]
    s.add_dependency 'stringio'
  end

  s.metadata['msys2_mingw_dependencies'] = 'libyaml'

end
