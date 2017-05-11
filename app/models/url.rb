class Url < ActiveRecord::Base
    validates :long_url, :presence => true
    validates :short_url, :presence => true
    validate :is_url_valid

    def is_url_valid
        return false if long_url.nil?
	        unless self.long_url.starts_with?("http://", "https://")
			errors.add(:long_url, "invalid format")
		end
    end
    
    def shorten
		characters = [*"0".."9", *"A".."Z", *"a".."z"]

		@short_url = (0..6).map{characters.sample}.join
		self.short_url = @short_url
    end

    def self.retrieve_short_url(long_url)
        u = Url.find_by(long_url:long_url)
        return nil if u.nil?
        u.short_url
    end
        

    

end
