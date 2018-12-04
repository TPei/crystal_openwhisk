require "json"

# reads input from stdin
req = STDIN.gets_to_end

# do stuff and return json json dict
dict = {"repsonse" => req}
puts JSON::Any.new(dict.to_json)
