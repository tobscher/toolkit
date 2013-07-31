module Toolkit
  mattr_accessor :assignable_options
  @@assignable_options = { :name_present => true }

  mattr_accessor :reportable_options
  @@reportable_options = { :burndown => true, :forecast => true }

  mattr_accessor :model_paths
  @@model_paths = ["toolkit/models"]
end

require "toolkit/configurable"
require "toolkit/models"
