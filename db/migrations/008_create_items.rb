# Items migration

Sequel.migration do
  up do
    # create devices table
    create_table(:items) do
      primary_key :id

      String  :user_id
      String  :name
      Text    :description
      Integer :cost_credits
      Integer :cost_platinum
      String  :image
      Integer :min_level
      Integer :ram_used
      JSONB   :slots
      Integer :generation
      Boolean :show_in_store

      Timestamp  :created_at
      Timestamp  :updated_at
    end
  end

  down do
    drop_table(:items)
  end
end
