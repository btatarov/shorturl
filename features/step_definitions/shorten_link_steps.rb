Given /^that I have inserted a link$/ do
end

When /^the primary key of that link is "(.*)"$/ do |id|
	Url.delete_all
	url = Url.new
	url.id = id
	url.url = "http://www.google.com/"
	url.save!
end

Then /^the link URI should be "(.*)"$/ do |id|
	url = Url.find(:first)
	url.getUrlById.to_s.should == id.to_s
end
