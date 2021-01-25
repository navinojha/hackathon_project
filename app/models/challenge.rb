class Challenge < ApplicationRecord
  belongs_to :emp
  has_many :tags
end
