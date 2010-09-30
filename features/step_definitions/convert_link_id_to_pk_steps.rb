Given /^that I have inserted an id equal to "(.*)"$/ do |id|
	Url.delete_all
	url = Url.new
	url.id = Url.getIdByUrl(id)
	url.url = "http://www.google.com/"
	url.save!
end

Then /^I should get primary key of "(.*)"$/ do |id|
	url = Url.find(:first)
	url.id.to_i.should == id.to_i
end


