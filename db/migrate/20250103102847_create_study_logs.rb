class CreateStudyLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :study_logs do |t|
      t.string :title
      t.text :content
      t.integer :duration

      t.timestamps
    end
  end
end
