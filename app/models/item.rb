class Item < ApplicationRecord
 	def soft_delete
    	update(deleted_at: Time.current)
 	end
  
	def restore
		update(deleted_at: nil)
	end

  	# Default scope
  	default_scope { where(deleted_at: nil) }

end
