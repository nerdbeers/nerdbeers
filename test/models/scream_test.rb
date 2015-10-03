require 'test_helper'

class ScreamTest < ActiveSupport::TestCase
  test "action " do
    testAction "suggestions", "suggestionsupdate"
    testAction "anything except suggestions", "agendaupdate"
  end

  test "test scream" do
    Scream.updateteam("death")
    skip ('need better way to test scream updateteam...')
  end

  test "test assert nil HUBOT_URL raise error" do
    assert_raise RuntimeError do
       Scream.assert_hubot_url_set ""
    end
  end

  test "test assert empty string HUBOT_URL raise error" do
    assert_raise RuntimeError do
       Scream.assert_hubot_url_set nil
    end
  end

  test "test assert non-nil, non-empty HUBOT_URL does not raise error" do
    begin
      Scream.assert_hubot_url_set "any string works"
      Scream.assert_hubot_url_set "http://localhost/"
      assert true, "non-empty, non-nil HUBOT_URL should not raise error"
    rescue => e
      flunk "non-empty, non-nil HUBOT_URL should not raise error"
    end
  end

  def testAction data, expected_action
  	action = Scream.get_action data
    assert action == expected_action, "When data is '#{data}', action should be '#{expected_action}'"
  end

end
