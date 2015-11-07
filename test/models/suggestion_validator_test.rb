require 'test_helper'
class SuggestionValidatorTest < ActiveSupport::TestCase

  def test_suggestion_validator_with_invalid_suggestion
    s = Suggestion.new
    v = SuggestionValidator.new
    v.validate(s)

    assert_equal false, s.topic?, 'should not have a topic'
    assert_equal false, s.beer?,  'should not have a beer'
    assert s.errors.has_key?(:topic), "errors hash should have key 'topic'"
    assert s.errors.has_key?(:beer),  "errors hash should have key 'beer'"
  end

  def test_suggestion_validator_with_valid_suggestion
    s = Suggestion.new
    s.topic = 'any topic'
    s.beer  = 'any beer'
    v = SuggestionValidator.new
    v.validate(s)

    assert s.topic?, 'should have a topic'
    assert s.beer?,  'should have a beer'
    assert_equal false, s.errors.has_key?(:topic), "errors hash should not have key 'topic'"
    assert_equal false, s.errors.has_key?(:beer),  "errors hash should not have key 'beer'"
  end
end
