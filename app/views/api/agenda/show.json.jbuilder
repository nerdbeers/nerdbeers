json.cache! [@rawr], expires_in: 2.minutes do
  json.(@rawr, :id, :meeting_date, :pairings, :venue_name, :map_link)
end
