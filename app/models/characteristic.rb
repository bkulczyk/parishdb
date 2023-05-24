class Characteristic < ApplicationRecord
    belongs_to :user
    has_many :characteristics_parishioners
    has_many :parishioners, through: :characteristics_parishioners, :dependent => :destroy
    default_scope { order(archive: :asc, name: :asc) }
    validates :name, :presence => true
end
