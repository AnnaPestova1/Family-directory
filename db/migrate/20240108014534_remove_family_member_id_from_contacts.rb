class RemoveFamilyMemberIdFromContacts < ActiveRecord::Migration[7.1]
  def change
    remove_column :contacts, :family_member_id, :integer
  end
end
