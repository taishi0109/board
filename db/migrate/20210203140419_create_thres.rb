class CreateThres < ActiveRecord::Migration[6.0]
  def change
    create_table :thres do |t|
      t.string :title

      t.timestamps
    end
  end
end
