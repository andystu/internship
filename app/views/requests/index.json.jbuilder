json.array!(@requests) do |request|
  json.extract! request, :id, :intern_id, :user_id, :request_date, :mark
  json.url request_url(request, format: :json)
end
