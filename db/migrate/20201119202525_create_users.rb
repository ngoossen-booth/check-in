class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.integer :flights_count, {:default => 0}

      t.timestamps
    end
  end
end
