require_relative "lib/celadonremote/version.rb"

Gem::Specification.new do |s|
  s.name        = 'celadonremote'
  s.version     = CeladonRemote::VERSION
  s.summary     = "Celadon Remote"
  s.description = "A way to interface with the celadon RCV-3000 receiver"
  s.authors     = ["Matthias Lee"]
  s.email       = 'matthias@matthiasclee.com'
  dirfiles = Dir.glob("**/*")
  dirfiles.delete("celadonremote-#{CeladonRemote::VERSION}.gem")
  s.files       = dirfiles 
  s.add_runtime_dependency "serialport", '~> 1.3.2'
  s.require_paths = ["lib"]
end
