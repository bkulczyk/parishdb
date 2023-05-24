class User < ApplicationRecord
  validates :email, :presence => true
  has_secure_password
  has_many :places, dependent: :destroy
  has_many :streets, dependent: :destroy
  has_many :characteristics, dependent: :destroy
  has_many :features, dependent: :destroy
  has_many :ministers, dependent: :destroy
  has_many :visits, dependent: :destroy
  has_many :parishioners, dependent: :destroy
  accepts_nested_attributes_for :parishioners
end
