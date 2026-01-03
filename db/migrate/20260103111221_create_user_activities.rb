class CreateUserActivities < ActiveRecord::Migration[8.0]
  def change
    create_table :user_activities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :action
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
    add_index :user_activities, :action
  end
end
