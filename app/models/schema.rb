class Schema < ActiveRecord::Base
  has_many :schema_versions
  def as_json(options={})
    super(options.merge(
              only: [:name],
              include: [
                schema_versions: {only: [:id, :version] } ]))
  end
end

