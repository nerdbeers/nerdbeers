require 'net/http'

class Scream

  def self.updateteam(data)
    assert_hubot_env_var_set ENV["HUBOT_URL"]
    action = get_action data

    begin
      hubot_url = ENV["HUBOT_URL"] + "#{action}"
      uri = URI.parse(hubot_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = hubot_url.start_with?('https')

      request = Net::HTTP::Get.new(uri)
      response = http.request(request)
    rescue => e
      puts "A very bad thing happened: #{e}"
    end

  end

  def self.get_action data
    if data == 'suggestions'
      'suggestionsupdate'
    else
      'agendaupdate'
    end
  end

  def self.assert_hubot_env_var_set url
    if url.to_s.length == 0
      # if HUBOT_URL is not set, we we won't get ":boom:" notifications when
      raise "Environment variable HUBOT_URL must be set!"
    end
  end

end
