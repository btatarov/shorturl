Feature: Shorten link
	In order to redirect to the url
	Shorturl should be able to
	Save the link and give link ID

Scenario: Shorten link
	Given that I have inserted a link
	When the primary key of that link is "1099919"
	Then the link URI should be "4CYF"