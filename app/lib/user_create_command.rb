# Object responsible for creating the user and fetching all the website headings.
#
# Also this object should contain any logic that must happen after create action
class UserCreateCommand
	# Creates the user and fetchs website heading.
	#
	# @param [User] the user that is being created
	# @return [User] user that was created
	def self.create!(record)
		new(record).save!
	end

	def initialize(record)
		@record = record
	end

	def save!
		return @record unless @record.valid?

		@record.posts = Website.parse(@record.website)
		@record.save

		@record
	end
end
