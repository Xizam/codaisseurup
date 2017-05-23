class Event < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true, length: {maximum: 500}
  validates :starts_at, presence: true
  validates :ends_at, :end_date_more_than_1_day_after_start_date

  def end_date_more_than_1_day_after_start_date?
    starts_at + 1.days >= ends_at

  end


end
