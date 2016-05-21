<<EOS
2014年Wカップ国名しりとり

brew install https://raw.githubusercontent.com/EricChiang/pup/master/pup.rb

# curl -s https://ja.wikipedia.org/wiki/2014_FIFA%E3%83%AF%E3%83%BC%E3%83%AB%E3%83%89%E3%82%AB%E3%83%83%E3%83%97 > tmp.html
# cat tmp.html | pup '.wikitable td a:nth-child(2) json{}' | jq ". [] .text" | pbcopy

curl -s https://en.wikipedia.org/wiki/2014_FIFA_World_Cup
cat tmp.html | pup 'table.multicol ul li a text{}'
EOS

# def main
#   nations = DATA.map(&:upcase).map(&:chomp)
#   p initials_nations = nations.group_by { |x| x[0] }
# end
# main

# わからなかったので、写経

def search(contries, prev, depth)
  next_country = contries.select { |c| c[0] == prev[-1] }
  if next_country.size > 0
    next_country.each do |c|
      search(contries - [c], c, depth + 1)
    end
  else
    @max_depth = [@max_depth, depth].max
  end
end

@max_depth = 0
contry = DATA.map(&:upcase).map(&:chomp)
contry.each do |c|
  search(contry - [c], c, 1)
end

p @max_depth

__END__
Australia
Iran
Japan
South Korea
Algeria
Cameroon
Ghana
Ivory Coast
Nigeria
Costa Rica
Honduras
Mexico
United States
Argentina
Brazil
Chile
Colombia
Ecuador
Uruguay
Belgium
Bosnia and Herzegovina
Croatia
England
France
Germany
Greece
Italy
Netherlands
Portugal
Russia
Spain
Switzerland
Gérard Houllier
Raul Arias
Gabriel Calderón
Ricki Herbert
Abdel Moneim Hussein
Kwok Ka Ming
Ioan Lupescu
Ginés Meléndez
Tsuneyasu Miyamoto
Sunday Oliseh
Mixu Paatelainen
Jaime Rodríguez
Theodore Whitmore
