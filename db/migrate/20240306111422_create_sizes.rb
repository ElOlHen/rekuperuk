class CreateSizes < ActiveRecord::Migration[7.1]
  def change
    create_table :sizes do |t|
      t.string :name
      t.string :icon

      t.timestamps
    end
  end
end
