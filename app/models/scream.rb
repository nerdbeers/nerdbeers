require 'net/http'

class Scream

  def self.updateteam(data)
    assertHubotUrlSet ENV["HUBOT_URL"]
    action = getAction data

    begin
      url = URI.parse(ENV["HUBOT_URL"] + "#{action}")
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
    rescue => e
      #logger.log "A very bad thing happened: #{e}"
      puts "#{e}"
    end

  end

  def self.getAction data
    if data == 'suggestions' 
      action = 'suggestionsupdate'
    else
      action = 'agendaupdate'
    end
  end

  def self.assertHubotUrlSet url
    if url.to_s.length == 0
      #if HUBOT_URL is not set, we we won't get ":boom:" notifications when
      raise "Environment variable HUBOT_URL must be set!"
    end
  end

end
