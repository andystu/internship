class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable
  #validates :name, :classlevel, :sn, :tel, presence: true, on: :update
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  has_many :requests
  has_many :interns, through: :requests

  GENDER=[['男','1'],['女','0']]

  def already_applied(intern_id)
    self.requests.find_by_intern_id(intern_id).present?
  end
end
