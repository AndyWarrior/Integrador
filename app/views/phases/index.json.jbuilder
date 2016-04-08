json.array!(@phases) do |phase|
  json.extract! phase, :id, :name, :numphase
  json.url phase_url(phase, format: :json)
end
