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

  before do
    Agenda.delete_all
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

  describe "updating an agenda" do

    let(:agenda) { Agenda.create(meeting_date: Time.now) }

    before do
      controller.stubs(:redirect_to)
      params[:agenda_id] = agenda.id
    end

    it "should redirect to mgmt#list" do
      controller.expects(:redirect_to).with(controller: 'mgmt',
                                            action:     'list',
                                            status:     303)
      controller.updateagenda
    end

    [
      [:topic1, 'a'],
      [:topic1, 'b'],
      [:topic2, 'c'],
      [:topic2, 'd'],
      [:topic3, 'e'],
      [:topic3, 'f'],
      [:beer1,  'g'],
      [:beer2,  'h'],
      [:beer3,  'i'],
    ].map { |x| Struct.new(:field, :value).new(*x) }.each do |example|

      describe "updating the data in multiple ways" do

        it "should redirect to the management controller page" do

          params[example.field] = example.value

          controller.updateagenda

          result = Agenda.find agenda.id

          result.send(example.field).must_equal example.value

        end

      end

    end

  end

end
