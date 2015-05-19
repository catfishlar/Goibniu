class SchemaTable < ActiveRecord::Base
  has_many :schema_fields
  has_many :schema_keys
  belongs_to :schema_version
end
