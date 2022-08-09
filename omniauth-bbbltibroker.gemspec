
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "omniauth/bbbltibroker/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-bbbltibroker"
  spec.version       = Omniauth::Bbbltibroker::VERSION
  spec.authors       = ["jfederico"]
  spec.email         = ["jesus@123it.ca"]

  spec.summary       = "An OmniAuth strategy for making use of BBB LTI Broker as Authentication Server thriugh OAuth2."
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/bigbluebutton/omniauth-bbbltibroker"
  spec.license       = "GPL-3.0-or-later"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
