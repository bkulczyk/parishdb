class Street < ApplicationRecord
  belongs_to :user
  self.per_page = 100
  before_save :change_numbers
  default_scope { order(name: :asc) }
  validates :name, :presence => true
  has_many :places, dependent: :destroy
  def self.ransackable_attributes(auth_object = nil)
    ["archive", "created_at", "id", "name", "notes", "updated_at", "user_id"]
  end
  def change_numbers
    name.gsub!(/\b([0-9])\b/, '00\1')
    name.gsub!(/\b([0-9]{2})\b/, '0\1')
  end
end
