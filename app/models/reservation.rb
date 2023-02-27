class Reservation < ApplicationRecord
  belongs_to :room

  validates :start_date, presence: true
  validates :finish_date, presence: true
  validates :number_of_people, presence: true

  validate :start_end_check
  validate :start_date_before_today

  def start_end_check
    if start_date.present? && finish_date.present? && start_date >= finish_date
      errors.add(:finish, "は開始日以降の日付で選択してください")
    end 
  end

  def start_date_before_today
    if start_date.present? && finish_date.present? && start_date < Date.today
      errors.add(:start_date, "は今日以降の日付で選択してください")
    end
  end 

end
