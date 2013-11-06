require "foo"

Toolkit.model_paths.unshift("foo/extensions/models")

Toolkit.configure do |config|
  # config.assignable_options = { :name_present => true }
  # config.reportable_options = { :burndown => true, :forecast => true }
end
