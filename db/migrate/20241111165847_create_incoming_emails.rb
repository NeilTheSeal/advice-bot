class CreateIncomingEmails < ActiveRecord::Migration[7.1]
  def change
    create_table :incoming_emails do |t|
      t.string :from
      t.string :subject
      t.string :content

      t.timestamps
    end
  end
end
