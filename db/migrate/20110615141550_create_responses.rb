class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.text :content
      t.integer :blog_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :responses
  end
end
