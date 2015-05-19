class SchemaKey < ActiveRecord::Base
  belongs_to :schema_table
  has_many :schema_key_fields
end
