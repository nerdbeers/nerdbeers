require 'slack-notifier'

class Shout

  def self.updateteam(message, username = 'slackbot')
    notifier = getNotifier username

    if ENV["RAILS_ENV"] == "production"
      notifier.ping Slack::Notifier::LinkFormatter.format(message)
    else
      puts 'not production, do not call slack'
    end
  end

  def self.getNotifier username
    assertSlackUrlSet ENV["SLACK_URL"]

    if username == 'databot'
      datateam
    else
      regularteam
    end
  end

  def self.assertSlackUrlSet url
    if url.to_s.length == 0
      #if SLACK_URL is not set, we cannot instantiate the notifier due to invalid Uri
      raise "Environment variable SLACK_URL must be set!"
    end
  end

  private
  def self.datateam
    Slack::Notifier.new ENV["SLACK_URL"],
                        channel: '#database', username: 'databot', icon_emoji: ":elephant:"
  end

  private
  def self.regularteam
    Slack::Notifier.new ENV["SLACK_URL"],
                        channel: '#general', username: 'Godfather'
  end
  #emoji http://www.emoji-cheat-sheet.com/
end
