class CreateCheckers < ActiveRecord::Migration[6.1]
  def change
    create_table :checkers do |t|
      t.string :colour
      t.references :cell
    end
  end
end
