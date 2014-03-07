class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer    :user_id
      t.integer    :ride_id
      t.timestamps
    end
  end
end
