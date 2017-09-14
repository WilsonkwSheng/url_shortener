class Url < ApplicationRecord
	before_save :shorten #validation run shorten method
	validates :long_url, presence: true, uniqueness: true
	before_validation :check_long_url
	validates :long_url, format: { with: /\A(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/, message: "Invalid url"  }

	def check_long_url
		
		if (!self.long_url.include? "http://") || (!self.long_url.include? "https://")
			a = self.long_url.partition("www.") 
			if a[1].include?("www.")
				self.long_url = "https://" + self.long_url
			else
				self.long_url = self.long_url = "https://www." + self.longurl
			end
		else
			#  add if else statement here 
			self.long_url = "https://" + self.long_url
		end
	end

	def shorten
		if self.short_url.nil?
			self.short_url = SecureRandom.hex(3) #self.shorturl = Url.shorturl
		end
	end
end