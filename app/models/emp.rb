class Emp < ApplicationRecord
  has_many :challenges, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :collaborations, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]
  attr_writer :login

  validates :empid , presence: true, uniqueness: {case_sensitive:false}
  validates_presence_of :empid, :email, :password, :password_confirmation
  def login
    @login || self.empid ||self.email
  end  

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(empid) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end
end
