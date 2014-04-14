Gem::Specification.new do |s|
  s.name        = 'fourrier'
  s.version     = '0.0.2'
  s.summary     = "Fourrier: a C library for tune computation"
  s.description = "Ruby interface (through FFI) to the C Fourrier library"
  s.authors     = ["Cedric Hernalsteens"]
  s.email       = 'cedric.hernalsteens@cern.ch'
  s.homepage    = 'http://chernals.web.cern.ch/chernals/fourrier'
  s.files       = ["lib/fourrier.rb",
                   "lib/fourrier/libc.rb",
                   "lib/fourrier/filters.rb",
                   "lib/fourrier/freqs.rb",
                   "lib/fourrier/frequency.rb"
                  ]
  s.license     = 'MIT'
  s.bindir      = 'bin'
end