class InitSolidQueue < ActiveRecord::Migration[8.0]
def up
    # This manually loads the schema file into the queue database
    load Rails.root.join("db/queue_schema.rb")
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
