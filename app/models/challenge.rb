class Challenge < ApplicationRecord
  belongs_to :emp
  has_many :tags, dependent: :destroy
  has_many :votes, dependent: :destroy

  validates_presence_of :title, :description

  def is_liked(emp)
    Vote.find_by(emp_id: emp.id, challenge_id: id)
  end

  def is_collaboration(emp)
    Collaboration.find_by(emp_id: emp.id, challenge_id: id)
  end
end
