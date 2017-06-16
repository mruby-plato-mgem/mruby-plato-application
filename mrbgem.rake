MRuby::Gem::Specification.new('mruby-plato-application') do |spec|
  spec.license = 'MIT'
  spec.authors = 'Plato developers'
  spec.description = 'Plato::MrubyApplication class (standard mruby application)'

  spec.add_dependency('mruby-plato-machine')
  spec.add_test_dependency('mruby-plato-machine-sim')
  spec.add_dependency('mruby-plato-timer')
end
