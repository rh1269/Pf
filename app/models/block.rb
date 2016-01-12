class Block < ActiveRecord::Base
	belongs_to :blocked_from,  polymorphic: true
end