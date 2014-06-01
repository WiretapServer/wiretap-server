Sequel.migration do
  up do
    # create unlocked achievements table
    create_table(:unlocked_achievements) do
      primary_key :id

      Integer  :user_id
      Integer  :achievement_id
      Integer  :progress #0-100 for progress

      Timestamp  :created_at
      Timestamp  :updated_at
    end
  end

  down do
    drop_table(:unlocked_achievements)
  end
end
