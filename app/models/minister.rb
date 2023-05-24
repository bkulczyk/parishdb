class Minister < ApplicationRecord
    belongs_to :user
    default_scope { order(fullname: :asc) }
    validates :fullname, :presence => true
    has_many :visits, dependent: :destroy
end
