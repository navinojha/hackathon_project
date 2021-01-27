class Collaboration < ApplicationRecord
  belongs_to :emp
  belongs_to :challenge
  validates_presence_of :emp_id, :challenge_id
end
