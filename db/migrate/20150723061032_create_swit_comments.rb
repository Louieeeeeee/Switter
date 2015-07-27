class CreateSwitComments < ActiveRecord::Migration
  def change
    create_table :swit_comments do |t|
      t.integer :swit_id
      t.integer :user_id
      t.string :comment

      t.timestamps
    end
  end
end
