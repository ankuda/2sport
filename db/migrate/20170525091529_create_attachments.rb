class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
      t.attachment :image
      t.integer :product_id, index: true

      t.timestamps
    end
  end
end
