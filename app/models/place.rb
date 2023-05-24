class Place < ApplicationRecord
  belongs_to :street
  belongs_to :user
  before_save :change_numbers
  has_many :parishioners, dependent: :destroy
  accepts_nested_attributes_for :parishioners
  has_many :features_places
  has_many :features, through: :features_places, :dependent => :destroy
  validates :address, :street_id, :presence => true
  default_scope { joins(:street).merge(Street.order(name: :asc, address: :asc)).all }
  def next
    Place.where("street_id = ? AND address > ?", self.street.id, address).first || Place.where("street_id = ?", self.street.id).first
  end
  def prev
    Place.where("street_id = ? AND address < ?", self.street.id, address).last || Place.where("street_id = ?", self.street.id).last
  end
  def full_address
    "#{street.name} #{address}"
  end
  def self.ransackable_attributes(auth_object = nil)
    ["address", "archive", "created_at", "id", "notes", "street_id", "updated_at", "user_id"]
  end
  def change_numbers
    address.gsub!(/\b([0-9])\b/, '00\1')
    address.gsub!(/\b([0-9]{2})\b/, '0\1')
  end
end
