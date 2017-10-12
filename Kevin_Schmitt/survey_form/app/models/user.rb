class User < ActiveRecord::Base
    validates :name, :location, :language, presence: true, length: { in: 2..20}
end
