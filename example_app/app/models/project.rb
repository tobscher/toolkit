class Project < ActiveRecord::Base
  toolkit :assignable, :reportable#,
    #:reportable_options => { :burndown => false, :forecast => true },
    #:assignable_options => { :name_present => true }

  # def burndown
  #  p "My burn down method (which is better anyway)"
  # end
end
