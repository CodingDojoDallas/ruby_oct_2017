# require 'date'

class Event < ActiveRecord::Base
    belongs_to :user

    has_many :messages, dependent: :destroy

    #many to many table
    has_many :attends, dependent: :destroy
    has_many :attendees, through: :attends, source: :user

    email_regex = /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/

    before_save :upcase

    validates :name, :city, presence: true, length: { in: 2..30 }
    validates :state, presence: true, length: { is: 2 }
    # validates :date, presence: true
    #can only add future events
    validate :future_date
    #could also use gem for date validation
    ##validates_timeliness gem
  
  
    # def downcase
    #   self.email.downcase!
    #   # self.name.downcase!
    # end
    def upcase
      self.state.upcase!
    end
    
    def future_date
        # if date.present? && date < Date.today
        if date <= Date.today
            errors.add(:date, "Event must be scheduled for a future date.")
        end
    end



end
