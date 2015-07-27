json.array!(@swit_statuses) do |swit_status|
  json.extract! swit_status, :id, :user_id, :swit_id, :status
  json.url swit_status_url(swit_status, format: :json)
end
