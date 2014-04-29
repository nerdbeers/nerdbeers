class Api::ChapterController < ApplicationController

  def list
    @chapters = Chapter.all
    p @chapters
    render "api/chapter/list", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

  def show
    @chapter = Chapter.find(1)
    render "api/chapter/show", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

end
