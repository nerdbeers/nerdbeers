require "test_helper"

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

  def test_suggestion_validator_with_invalid_suggestion
    s = Suggestion.new
    v = SuggestionValidator.new
    v.validate(s)

    assert_equal false, s.topic?, "should not have a topic"
    assert_equal false, s.beer?,  "should not have a beer"
    assert s.errors.has_key?(:topic), "errors hash should have key 'topic'"
    assert s.errors.has_key?(:beer),  "errors hash should have key 'beer'"
  end

  def test_suggestion_validator_with_valid_suggestion
    s = Suggestion.new
    s.topic = "any topic"
    s.beer  = "any beer"
    v = SuggestionValidator.new
    v.validate(s)

    assert s.topic?, "should have a topic"
    assert s.beer?,  "should have a beer"
    assert_equal false, s.errors.has_key?(:topic), "errors hash should not have key 'topic'"
    assert_equal false, s.errors.has_key?(:beer),  "errors hash should not have key 'beer'"
  end
end
