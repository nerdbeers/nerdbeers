require 'slack-notifier'

class SlackService

  def self.update_team(message)
    get_notifier.ping Slack::Notifier::Util::LinkFormatter.format(message) # if Rails.env.production?
  end

  private_class_method def self.get_notifier
    Slack::Notifier.new ENV["SLACK_URL"] do
  		defaults channel: "#general",
           username: "moss"
	end
  end
end
