class CreateSwitStatuses < ActiveRecord::Migration
  def change
    create_table :swit_statuses do |t|
      t.integer :user_id
      t.integer :swit_id
      t.integer :status

      t.timestamps
    end
  end
end
