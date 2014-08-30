require 'slack-notifier'

class Shout

  def self.updateteam(message, username = 'slackbot')
    if username == 'databot'
      notifier = datateam
      notifier.ping Slack::Notifier::LinkFormatter.format(message)
    else
      notifier = regularteam
      notifier.ping Slack::Notifier::LinkFormatter.format(message)
    end
  end
  
    private
    def self.datateam
      Slack::Notifier.new "nerdbeers", ENV["SLACK_API"],
                                  channel: '#database', username: 'databot', icon_emoji: ":elephant:"
    end
    
  
    private
    def self.regularteam
      Slack::Notifier.new "nerdbeers", ENV["SLACK_API"],
                                  channel: '#general', username: 'slackbot'
    end

    #emoji http://www.emoji-cheat-sheet.com/
end
