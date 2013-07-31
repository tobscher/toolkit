module Toolkit
  mattr_accessor :assignable_options
  @@assignable_options = { :name_present => true }

  mattr_accessor :reportable_options
  @@reportable_options = { :burndown => true, :forecast => true }
end

require "toolkit/models"
