class Project < ActiveRecord::Base
  toolkit :assignable, :assignable_options => { :name_present => true }
end
