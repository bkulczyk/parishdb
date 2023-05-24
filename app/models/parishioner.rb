class Parishioner < ApplicationRecord
  belongs_to :place
  belongs_to :user
  has_many :visits, dependent: :destroy
  accepts_nested_attributes_for :visits
  has_many :characteristics_parishioners
  has_many :characteristics, through: :characteristics_parishioners, :dependent => :destroy
  default_scope { order(lastname: :asc, firstname: :asc) }
  validates :firstname, :lastname, :birth, :place_id, :presence => true
  def fullname
    "#{firstname} #{lastname}"
  end
  def self.ransackable_associations(auth_object = nil)
    ["characteristics", "characteristics_parishioners", "place", "user", "visits"]
  end
  def self.ransackable_attributes(auth_object = nil)
    ["archive", "baptism_date", "baptism_number", "baptism_parish", "birth", "birth_place", "confirmation_date", "confirmation_name", "confirmation_number", "confirmation_witness", "created_at", "death_date", "death_mark", "email", "firstname", "id", "lastname", "notes", "phone", "place_id", "updated_at", "user_id"]
  end
end
