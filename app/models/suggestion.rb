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
 
  scope :recent, -> { order 'created_at DESC' }

  def self.create(topic, beer)
    s = Suggestion.new
    s.topic = topic
    s.beer = beer
    s.save!
  end
 end
