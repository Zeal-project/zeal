class Resume < ApplicationRecord

  validates_presence_of :ideal_role, :exp_in_role, :length_of_working_exp

  enum ideal_role: [ :engineer, :product_design, :businesses_dev, :marketing ]
  enum job_search_status: [ :strong_active, :active, :passive ]
  enum exp_in_role: [ :training, :entry_level, :experienced_hire, :manager, :director, :executive ]
  enum length_of_working_exp: [ "below_one", "one_three", "four_six", "seven_ten", "above_ten" ]
  enum ideal_salary: ["fouty_sixty", "sixty_eighty", "eighty_hundrued", "above_hundrued" ]

  belongs_to :user

end
