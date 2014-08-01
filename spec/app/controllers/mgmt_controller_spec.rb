require_relative '../../spec_helper'

describe MgmtController do

  let(:controller) { MgmtController.new }

  it "should be an application controller" do
    controller.is_a?(ApplicationController).must_equal true
  end

end
