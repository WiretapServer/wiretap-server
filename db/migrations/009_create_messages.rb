# Messages migration

Sequel.migration do
  up do
    # create messages table
    create_table(:messages) do
      primary_key :id

      Integer  :from_id
      Integer  :to_id
      Text     :content
      Boolean  :read

      Timestamp  :created_at
      Timestamp  :updated_at
    end
  end

  down do
    drop_table(:messages)
  end
end
