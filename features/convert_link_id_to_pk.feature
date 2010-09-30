Feature: Convert link ID to PK
	In order to redirect to the url
	Shorturl should be able to
	Convert the URI to primary key

Scenario: Convert link ID to PK
	Given that I have inserted an id equal to "1a-0"
	Then I should get primary key of "413568"