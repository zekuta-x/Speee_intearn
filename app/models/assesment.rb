module Assesment
    class ApiClient
        class << self
            def post
                conn = Faraday::Connection.new(url: 'https://miniul-api.herokuapp.com', :ssl => {:verify => false})
                conn.post '/affiliate/v2/conversions'
            end
        end
    end
end
    