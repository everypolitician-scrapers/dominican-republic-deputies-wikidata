require 'wikidata/fetcher'
require 'pry'

names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/Chamber_of_Deputies_of_the_Dominican_Republic',
  after: '//h2/span[@id="Current_composition"]',
  before: '//h2/span[@id="Party_strengths_in_the_Chamber_of_Deputies"]',
  xpath: '//table//tr//td[1]//a[not(@class="new")]/@title',
) 

EveryPolitician::Wikidata.scrape_wikidata(names: { en: names }, output: true)
warn EveryPolitician::Wikidata.notify_rebuilder
