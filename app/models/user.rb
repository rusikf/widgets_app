class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_many :widgets, dependent: :destroy

  # TODO: move validations to form object
  validates :first_name, presence: true
  validates :last_name, presence: true
end
