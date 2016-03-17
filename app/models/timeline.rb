class Timeline < ActiveRecord::Base
  belongs_to :competition

  validates :event, presence: true
  validates :event_time, presence: true

  default_scope { order('seq') }

end