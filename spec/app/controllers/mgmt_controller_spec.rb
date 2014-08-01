require_relative '../../spec_helper'

describe MgmtController do

  let(:params) { {} }

  let(:controller) do
    c = MgmtController.new
    c.stubs(:params).returns params
    c
  end

  it "should be an application controller" do
    controller.is_a?(ApplicationController).must_equal true
  end

  describe "list" do

    it "should return the agendas" do
      agendas = Object.new
      Agenda.stubs(:all).returns agendas
      controller.list

      controller.instance_eval { @agendas }.must_be_same_as agendas
    end

  end

  describe "detail" do

    it "should show the detail for the agenda in question" do
      agenda_id = Object.new
      agenda    = Object.new

      # double sigh, the pain of this test is telling me
      # that this SQL statement belongs elsewhere...
      # but I'm going to test it as-is for now
      agenda_with_venue = Object.new
      agenda_with_venue_and_select = Object.new
      Agenda.stubs(:joins).with(:venue).returns agenda_with_venue
      agenda_with_venue.stubs(:select)
        .with('agendas.*, venues.venue as venue_name, venues.map_link as map_link')
        .returns agenda_with_venue_and_select
      agenda_with_venue_and_select.stubs(:find).with(agenda_id).returns agenda

      params[:id] = agenda_id
      controller.detail

      controller.instance_eval { @agenda }.must_be_same_as agenda

    end

  end

end
