class Feature < ApplicationRecord
    belongs_to :user
    has_many :features_places
    has_many :places, through: :features_places, :dependent => :destroy
    default_scope { order(name: :desc) }
    validates :name, :presence => true
end
