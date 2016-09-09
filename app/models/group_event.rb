class GroupEvent < ActiveRecord::Base
  default_scope { where(deleted: false) } 
  scope :deleted, -> { unscoped.where(deleted: true) }

  alias_method :hard_destroy, :destroy # hard_destroy will need to be called to actually delete a record from DB

  validates :name, :description, :start_date, :end_date, presence: true, if: :published?
  validate :start_date_before_end_date

  def publish; update(published: true); end
  def soft_destroy; update(deleted: true); end

  def duration
    return "NA" unless start_date && end_date
    "#{(end_date.to_datetime - start_date.to_datetime).to_f.round(2)} days"
  end

  def start_date_before_end_date
    if start_date && end_date && start_date > end_date
      errors.add(:start_date, "Start date should be before end date")
    end
  end

  def destroy
    update_attribute(:deleted, true)
    run_callbacks(:destroy)
  end
end
