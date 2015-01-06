class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  validates :name, :classlevel, :sn, :tel, presence: true, on: :update
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
