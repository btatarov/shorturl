class Url < ActiveRecord::Base

	before_save :check_url

	# checks wether we need "http://" in front of the url
	def check_url
		if self.url.to_s.match('/^(http(s?):\/\/|ftp:\/\/{1})((\w+\.){1,})\w{2,}$/i').nil?
			self.url = 'http://' + self.url
		end
	end

  	# converts the id from decimal to base-X positional notation where X is the length of the char list
	def getUrlById
		notation = Url.char_list
		id = self.id.to_i
		num = String.new
		until id == 0 do
			num = notation[id % notation.length] + num
			id /= notation.length
		end
		return num
	end

	
	class << self
	
		# converts the id to decimal
		def getIdByUrl(url)
			notation = Url.char_list
			url = url.to_s.split(//).reverse
			id = 0
			url.each_with_index do |val, i|
				id += notation.index(val) * (notation.length**i)
			end
			return id
		end

		# returns list of all alphanumeric chars and '-', '_' 
		def char_list
			('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a + ['-','_']
		end

	end

	
end
