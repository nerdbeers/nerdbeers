class SuggestionValidator < ActiveModel::Validator
  def validate(record)
    unless record.topic.nil? or record.beer.nil?
      record.errors[:topic] << 'Need a Topic or a Beer'
    end
  end
end

class Suggestion < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with SuggestionValidator
 
  def self.create(topic, beer)
    s = Suggestion.new
    s.topic = topic
    s.beer = beer
    s.save!
  end
 end
