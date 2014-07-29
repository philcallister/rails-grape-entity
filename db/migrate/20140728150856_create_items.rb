class CreateItems < ActiveRecord::Migration

  def change
    create_table :items do |t|
      t.belongs_to  :todo
    	t.string      :description
      t.boolean     :complete, default: false

      t.timestamps
    end
  end
  
end
