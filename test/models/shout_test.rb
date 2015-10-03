require 'test_helper'

class ShoutTest < ActiveSupport::TestCase
  test "test assert nil SLACK_URL raise error" do
    assert_raise RuntimeError do
       Shout.assert_slack_url_set ""
    end
  end

  test "test assert empty string SLACK_URL raise error" do
    assert_raise RuntimeError do
       Shout.assert_slack_url_set nil
    end
  end

  test "test assert non-nil, non-empty SLACK_URL does not raise error" do
    begin
      Shout.assert_slack_url_set "any string works"
      Shout.assert_slack_url_set "http://localhost/"
      assert true, "non-empty, non-nil SLACK_URL should not raise error"
    rescue => e
      flunk "non-empty, non-nil SLACK_URL should not raise error"
    end
  end

  test "test shout updateteam (databot)" do
    Shout.updateteam("test updateteam (databot)", "databot")
    skip ('need a better way to test updateteam (databot)...')
  end

  test "test shout updateteam (slackbot)" do
    Shout.updateteam("test updateteam (slackbot)", "slackbot")
    skip ('need a better way to test updateteam (slackbot)...')
  end

  test "test shout updateteam (default)" do
    Shout.updateteam("test updateteam (default)", "literally anything not databot or slackbot")
    skip ('need a better way to test updateteam (default)...')
  end

  test "test shout databot notifier" do
    n = Shout.get_notifier "databot"
    testNotifer "databot", n, "#database", "databot", ":elephant:"
  end

  test "test shout slackbot notifier" do
    n = Shout.get_notifier "slackbot"
    testNotifer "slackbot", n, "#general", "Godfather", nil
  end

  test "test shout 'default' notifier" do
    n = Shout.get_notifier "literally anything not databot or slackbot"
    testNotifer "default", n, "#general", "Godfather", nil
  end

  def testNotifer txt, notifier, channel, username, icon_emoji
    assert_not_nil notifier, "#{txt} notifier should not be nil"
    assert notifier.channel == channel,   "#{txt} notifier channel should be #{channel}"
    assert notifier.username == username, "#{txt} notifier username should be #{username}"

    if icon_emoji.nil?
      #ugh! the icon_emoji is not exposed... it's one of the options merged into slack client?
      #assert notifier.icon_emoji.nil?, "#{txt} notifier icon_emoji should be nil"
    else
      #assert notifier.icon_emoji == icon_emoji, "#{txt} notifier icon_emoji should be #{icon_emoji}"
    end
  end
end
