class SchemaVersion < ActiveRecord::Base
  has_many :schema_tables
  belongs_to :schema

  def full(options={})
    as_json(options.merge(
                only: [:id, :version, :comment],
                include: [
                    schema_tables: {
                        only: [:id, :name],
                        include: {
                            schema_fields: {
                                only: [:id, :name, :field_type, :type_params, :nullable, :default]
                            },

                            schema_keys: {
                                only: [:id, :name, :primary, :unique],
                                include: {
                                    schema_key_fields: {
                                        only: [:name]
                                    }
                                }
                            }

                        }
                    }
                ]
            ))
  end
end
