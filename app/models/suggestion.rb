class SuggestionValidator < ActiveModel::Validator
  def validate(record)
    if record.topic.blank? and record.beer.blank?
      record.errors[:topic] << 'Either a Topic or a Beer is required.'
      record.errors[:beer] << 'Either a Topic or a Beer is required.'
    end
  end
end

class Suggestion < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with SuggestionValidator
 
  scope :most_recent_first, -> { order 'created_at DESC' }

 end
