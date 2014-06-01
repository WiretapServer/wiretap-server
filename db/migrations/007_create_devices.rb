### Device Types list
# ios = iOS device (i.e. iPhone or iPad)
# android = Android Device (specifically Google Play backed device)
# winphone = Windows Phone
# osx = Mac/OSX device (i.e. Notebook or Desktop)
# windows = Windows device (i.e. Notebook or Desktop)
# blackberry = BlackBerry device
# amazon = Amazon Android device (i.e. Kindle Fire)
# webhook = HTTP Webhook device (i.e. Web Application or Facebook App)


Sequel.migration do
  up do
    # create devices table
    create_table(:devices) do
      primary_key :id

      String  :user_id
      String  :device_identifier
      String  :platform_type # SEE Types list above
      Integer :badge
      String  :status # Active, Disabled, Deleted

      Timestamp  :created_at
      Timestamp  :updated_at
    end
  end

  down do
    drop_table(:devices)
  end
end
