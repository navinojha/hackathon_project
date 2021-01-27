class Vote < ApplicationRecord
  belongs_to :emp
  belongs_to :challenge
  #validates_uniqueness_of :votes
  
end
