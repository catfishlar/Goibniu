class DbStatus < ActiveRecord::Base
  has_many :table_statuses
  belongs_to :database
end
