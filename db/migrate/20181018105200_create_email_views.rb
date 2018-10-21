class CreateEmailViews < ActiveRecord::Migration[5.2]
  def up
    create_table :action_mailer_pixel_email_views do |t|
      t.string :token, unique: true
      t.integer :recipient_id
      t.integer :campaign_id
      t.integer :views, default: 0
      t.timestamps

      t.index [:recipient_id, :campaign_id],
              unique: true,
              name: 'index_email_views_on_recipient_id_and_campaign_id'
    end
  end

  def down
    drop_table :action_mailer_pixel_email_views
  end
end
