require 'net/http'

class Scream

  def self.updateteam(data)

    if data == 'suggestions' 
      action = 'suggestionsupdate'
    else
      action = 'agendaupdate'
    end

    begin
      url = URI.parse(ENV["HUBOT_URL"] + "#{action}")
      puts url.to_s
      req = Net::HTTP::Get.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port) {|http|
        http.request(req)
      }
      puts res.body
    rescue => e
      #logger.log "A very bad thing happened: #{e}"
      puts "#{e}"
    end

  end

end
