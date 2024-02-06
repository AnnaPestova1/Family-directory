json.extract! contact, :id, :name, :phone, :email, :description, :category, :family_member_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)
