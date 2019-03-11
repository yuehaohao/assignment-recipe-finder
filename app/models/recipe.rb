class Recipe

  # =>  inclue HTTParty Module to process http request to available apis
  include HTTParty

  # =>  set the hotsport to local port or if there is no local port check food2fork.com
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'

  # =>  the base uri for the apis is from the hotspot
  base_uri "http://#{hostport}/api"

  # =>  the basic data returned is based on JSON
  format :json

  # =>  static method for which will have a parameter keyword and seach the keyword in api
  def self.for keyword

    # =>  key of the api will be offered
    key_value = ENV['FOOD2FORK_KEY']

    # =>  the params required by the api is the key for the api and the keyword for query
    para = { key: key_value, q: keyword }

    #process the api call and parse the data in recipes hash, then return the json
    get("/search", query: para)["recipes"]
  end

end
