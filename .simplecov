SimpleCov.start 'rails' do

  #currently, we exclude calculations on application_controller
  # this might change if it gets more logic
  add_filter "/app/controllers/application_controller.rb"
end
