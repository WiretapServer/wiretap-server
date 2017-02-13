Sequel.migration do
  up do
    # create achievements table
    create_table(:achievements) do
      primary_key :id

      String  :achievement_name
      String  :locked_description
      String  :unlocked_description
      Integer :points
      String  :image #URL to image
      Integer :achievement_type #regular or progress
      Boolean :hidden #if true then hide description until unlocked

      Timestamp  :created_at
      Timestamp  :updated_at
    end
  end

  down do
    drop_table(:achievements)
  end
end
