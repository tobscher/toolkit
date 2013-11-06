class Project < ActiveRecord::Base
  toolkit :assignable, :reportable, :advanced_feature#, :advanced_options => [1,2,3]#,
    # :reportable_options => { :burndown => false, :forecast => true },
    # :assignable_options => { :name_present => false }

  # def burndown
  #  p "My burn down method (which is better anyway)"
  # end
end
