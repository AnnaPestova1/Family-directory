json.extract! wishlist, :id, :description, :quantity, :link, :purchased, :family_member_id, :created_at, :updated_at
json.url wishlist_url(wishlist, format: :json)
