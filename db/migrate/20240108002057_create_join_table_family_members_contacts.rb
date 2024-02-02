class CreateJoinTableFamilyMembersContacts < ActiveRecord::Migration[7.1]
  def change
    create_join_table :family_members, :contacts do |t|
      t.index [:family_member_id, :contact_id]
      t.index [:contact_id, :family_member_id]
    end
  end
end
