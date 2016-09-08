class GroupEvent < ActiveRecord::Base
  default_scope { where(deleted: false) } 
  scope :deleted, -> { where(deleted: true) }

  validates :name, :description, :start, :end, presence: true, if: :published?

  def publish; update(published: true); end
  def duration; (start_date - end_date).to_i; end
end
