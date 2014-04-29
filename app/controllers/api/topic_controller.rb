class Api::TopicController < ApplicationController

  def show
    @topic = Hash.new
    @topic["id"] = 1
    @topic["topic"] = 'blahs'
    @topic["beer"] = 'drinks'
    p @topic
    #render :json => @topic.to_json, status: 200
    render "api/topic/show", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

end
