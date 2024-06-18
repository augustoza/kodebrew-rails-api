class CreateLectures < ActiveRecord::Migration[6.1]
  def change
    create_table :lectures do |t|
      t.string :link
      t.string :description
      t.string :title
      t.string :theme
      t.datetime :presentation_date

      t.timestamps
    end
  end
end
