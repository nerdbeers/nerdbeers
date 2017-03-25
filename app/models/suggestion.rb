class SuggestionValidator < ActiveModel::Validator
  def validate(record)
    if record.topic.blank? and record.beer.blank?
      record.errors[:topic] << 'Either a Topic or a Beer is required.'
      record.errors[:beer] << 'Either a Topic or a Beer is required.'
    end
  end
end

class Suggestion < ApplicationRecord
  include ActiveModel::Validations
  validates_with SuggestionValidator
  after_create :notify_team
 
  scope :most_recent_first, -> { order 'created_at DESC' }

  def self.create(topic, beer)
    s = Suggestion.new
    s.topic = topic
    s.beer = beer
    s.save!
  end

  private 
  def notify_team
    Scream.updateteam('suggestions')
  end
 end
