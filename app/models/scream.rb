require 'net/http'

class Scream

  def self.updateteam(data)
    assert_hubot_url_set ENV["HUBOT_URL"]
    action = get_action data

    begin
      url = URI.parse(ENV["HUBOT_URL"] + "#{action}")
      req = Net::HTTP::Get.new(url.to_s)
      Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
    rescue => e
      # logger.log "A very bad thing happened: #{e}"
      puts "#{e}"
    end

  end

  def self.get_action data
    if data == 'suggestions'
      'suggestionsupdate'
    else
      'agendaupdate'
    end
  end

  def self.assert_hubot_url_set url
    if url.to_s.length == 0
      # if HUBOT_URL is not set, we we won't get ":boom:" notifications when
      raise "Environment variable HUBOT_URL must be set!"
    end
  end

end
