# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require "simple-password-gen/version"

Gem::Specification.new do |s|
  s.name        = "simple-password-gen"
  s.version     = Password::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Dominik Menke"]
  s.email       = ["dmke@tzi.de"]
  s.homepage    = "http://github.org/dmke/simple-password-gen"
  s.summary     = %q{Simple password generator to create pronounceable or random passowords.}
  s.description = %q{This gem comes with an executable and might also be required.}

  s.rubyforge_project = ""

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
