class User < ActiveRecord::Base
  has_many :moods
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
