require 'everypolitician'
require 'wikidata/fetcher'
require 'pry'

existing = EveryPolitician::Index.new.country("Dominican-Republic").legislature('Diputados').popolo.persons.map(&:wikidata).compact

en_2016 = EveryPolitician::Wikidata.wikipedia_xpath(
  url: 'https://en.wikipedia.org/wiki/Chamber_of_Deputies_of_the_Dominican_Republic',
  after: '//h2/span[@id="Current_composition_.282016.E2.80.93present.29"]',
  before: '//h2/span[@id="Party_strengths_in_the_Chamber_of_Deputies"]',
  xpath: '//table//tr//td[1]//a[not(@class="new")]/@title',
)

es_names = WikiData::Category.new( 'Categoría:Políticos de República Dominicana', 'es').member_titles

EveryPolitician::Wikidata.scrape_wikidata(ids: existing, names: { en: en_2016, es: es_names })
