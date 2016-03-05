require 'wikidata/fetcher'
require 'pry'

en_names = EveryPolitician::Wikidata.wikipedia_xpath( 
  url: 'https://en.wikipedia.org/wiki/Chamber_of_Deputies_of_the_Dominican_Republic',
  after: '//h2/span[@id="Current_composition"]',
  before: '//h2/span[@id="Party_strengths_in_the_Chamber_of_Deputies"]',
  xpath: '//table//tr//td[1]//a[not(@class="new")]/@title',
) 

es_names = WikiData::Category.new( 'Categoría:Políticos de República Dominicana', 'es').member_titles
  
EveryPolitician::Wikidata.scrape_wikidata(names: { en: en_names, es: es_names }, output: false)
