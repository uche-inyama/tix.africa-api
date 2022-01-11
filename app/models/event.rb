class Event < ApplicationRecord
  belongs_to :user

  validates_presence_of :start_date, :end_date, :time, :address, :theme,
  :details, :image_data, :event_type, :status, :user_id
end