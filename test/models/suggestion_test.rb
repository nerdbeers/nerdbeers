require "test_helper"

class SuggestionTest < ActiveSupport::TestCase

  def suggestion
    @suggestion ||= Suggestion.new
  end

  def test_valid
    assert suggestion.valid?
  end

end
