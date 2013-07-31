module Foo
  mattr_accessor :advanced_options
  @@advanced_options = [1,3,3,7]

  autoload :Extensions, "foo/extensions"
end
