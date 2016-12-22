class UserUpdateCommand
	def self.update!(record, params)
		new(record).save!(params)
	end

	def initialize(record)
		@record = record
	end

	def save!(params)
    if @record.update_attributes(params)
			@record.posts = Website.parse(@record.website)
			@record.save
		end

		@record
	end
end
