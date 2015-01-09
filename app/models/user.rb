class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :recoverable
  validates :name, :classlevel, :sn, :tel, presence: true, on: :update
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
end
