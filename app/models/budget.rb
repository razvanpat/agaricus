class Budget < ActiveRecord::Base
  attr_accessible :category_id, :month, :value, :year
end
