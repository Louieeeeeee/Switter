class CreateSwits < ActiveRecord::Migration
  def change
    create_table :swits do |t|
      t.integer :user_id
      t.text :message
      t.integer :sweet
      t.integer :sour

      t.timestamps
    end
  end
end
