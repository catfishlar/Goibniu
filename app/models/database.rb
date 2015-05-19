class Database < ActiveRecord::Base
  has_many :db_statuses
  validates :name, presence: true
  validates :host, format: { with: /[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/}
  validates :dbschema, presence: true
end


