class CreateOutgoingEmails < ActiveRecord::Migration[7.1]
  def change
    create_table :outgoing_emails do |t|
      t.string :email
      t.string :subject
      t.string :content
      t.references :incoming_email, null: false, foreign_key: true

      t.timestamps
    end
  end
end
