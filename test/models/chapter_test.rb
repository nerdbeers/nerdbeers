require "test_helper"

class ChapterTest < ActiveSupport::TestCase

  def chapter
    @chapter ||= Chapter.new
  end

  def test_valid
    assert chapter.valid?
  end

end
