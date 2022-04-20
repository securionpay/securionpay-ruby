# frozen_string_literal: true

def random_string
  (0...10).map { ('a'..'z').to_a[rand(26)] }.join
end

def random_email
  "#{random_string}@#{random_string}.com"
end
