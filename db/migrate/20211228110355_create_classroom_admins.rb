class CreateClassroomAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :classroom_admins, id: :uuid do |t|
      t.string :ClassroomAdmin
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :classroom, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
