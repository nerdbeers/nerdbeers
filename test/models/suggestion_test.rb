require 'test_helper'
class SuggestionTest < ActiveSupport::TestCase

  def test_suggestion_not_valid_when_blank_topic_and_blank_beer
    s = Suggestion.new
    s.topic = "       "
    s.beer  = "       "
    assert_equal false, s.valid?, "should not be valid when neither topic, nor beer is provided"
    assert_not s.save, "should not save when neither topic, nor beer is provided"
  end

  def test_suggestion_not_valid_when_nil_topic_and_nil_beer
    s = Suggestion.new
    assert_equal false, s.valid?, "should not be valid when neither topic, nor beer is provided"
    assert_not s.save, "should not save when neither topic, nor beer is provided"
  end

  def test_suggestion_valid_when_blank_topic_and_not_blank_beer
    s = Suggestion.new
    s.beer = "any beer"
    assert s.valid?, "should be valid when a beer is provided"
    assert s.save, "should save when a beer is provided"
  end

  def test_suggestion_valid_when_not_blank_topic_and_blank_beer
    s = Suggestion.new
    s.topic = "any topic"
    assert s.valid?, "should be valid when a topic is provided"
    assert s.save, "should save when a topic is provided"
  end

  def test_suggestion_valid_when_both_topic_and_beer_provided
    s = Suggestion.new
    s.topic = "any topic"
    s.beer  = "any beer"
    assert s.valid?, "should be valid when both topic and beer are provided"
    assert s.save, "should save when both topic and beer are provided"
  end

  def test_suggestion_create_valid_when_both_topic_and_beer_provided
    s = Suggestion.create("any topic", "any beer")
    assert s, "should be created when both topic and beer are provided"
  end

  def test_suggestion_create_valid_when_topic_provided
    s = Suggestion.create("any topic", nil)
    assert s, "should be created when only topic provided"
  end

  def test_suggestion_create_valid_when_beer_provided
    s = Suggestion.create(nil, "any beer")
    assert s, "should be valid when only beer provided"
  end

  def test_suggestion_create_not_valid_when_nil_topic_and_nil_beer
    assert_raise ActiveRecord::RecordInvalid do
        Suggestion.create(nil, nil)
    end
  end

end
