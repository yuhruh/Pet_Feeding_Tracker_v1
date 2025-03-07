json.extract! pet_tracker, :id, :date, :time, :brand, :description, :wet_amount, :wet_left_amount, :dry_amount, :dry_left_amount, :created_at, :updated_at
json.url pet_tracker_url(pet_tracker, format: :json)
