class Api::TopicController < ApplicationController

  def show
    @topic = Hash.new
    @topic["topic"] = 'blahs'
    @topic["beer"] = 'drinks'

    render "api/topic/show", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

end
