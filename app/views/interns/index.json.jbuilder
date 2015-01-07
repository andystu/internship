json.array!(@interns) do |intern|
  json.extract! intern, :id, :title, :starttime, :endtime, :description, :url
  json.url intern_url(intern, format: :json)
end
