class Api::ChapterController < ApplicationController

  def list
    @chapters = Chapter.all
    render "api/chapter/list", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

  def show
    #  should this be by id or by chapter name? What is the flow here
    @chapter = Chapter.find(params[:id])
    render "api/chapter/show", :formats => [:json], :handlers => [:jbuilder], status: 200
  end

end
