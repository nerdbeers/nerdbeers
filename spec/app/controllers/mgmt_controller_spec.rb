require_relative '../../spec_helper'

describe MgmtController do

  let(:controller) { MgmtController.new }

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

end
