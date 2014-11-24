class VenueValidator < ActiveModel::Validator
  def validate(record)
    if record.venue.blank?
      record.errors[:venue] << 'Venue is required.'
    end
  end
end

class Venue < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with VenueValidator
  has_many :agendas
end
