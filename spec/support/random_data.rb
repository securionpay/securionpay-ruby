def random_string
  (0...10).map { ('a'..'z').to_a[rand(26)] }.join
end

def random_email
  return "#{random_string}@#{random_string}.com"
end
