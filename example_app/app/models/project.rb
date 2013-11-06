class Project < ActiveRecord::Base
  # toolkit :assignable
  # toolkit :reportable do |config|
  #   config.burndown = false
  # end
  # toolkit :advanced_feature, :advanced_option => false

  toolkit :assignable, :reportable, :advanced_feature#, :advanced_options => [1,2,3]#,
    # :reportable_options => { :burndown => false }#,
    #:assignable_options => { :name_present => true }

  def burndown
    p "My burn down method (which is better anyway)"
  end

  def forecast
    p "dfgdfg"
  end
end
