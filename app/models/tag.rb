class Tag < ApplicationRecord
  belongs_to :challenge
  validates_presence_of :name
end
