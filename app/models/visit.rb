class Visit < ApplicationRecord
  belongs_to :user
  self.per_page = 250
  belongs_to :parishioner
  belongs_to :minister
  default_scope { order(issue: :desc) }
  validates :parishioner_id, :minister_id, :issue, :presence => true
  def self.ransackable_attributes(auth_object = nil)
    ["anointing", "confession", "created_at", "eucharist", "id", "issue", "minister_id", "notes", "parishioner_id", "updated_at", "user_id"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["minister", "parishioner", "user"]
  end
end
