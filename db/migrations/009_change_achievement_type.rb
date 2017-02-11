# Items migration

Sequel.migration do
  up do
    # change achievement_type field to tinyint
    alter_table(:achievements) do
      set_column_type :achievement_type, :Integer
    end
  end

  down do
    alter_table(:achievements) do
      set_column_type :achievement_type, :String
    end
  end
end
