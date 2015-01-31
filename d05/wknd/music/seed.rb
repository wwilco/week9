require 'pry'
require_relative './lib/connection'
require_relative './lib/artist'
require_relative './lib/album'
require_relative './lib/song'

nirvana = Artists.create({
  name: "Nirvana"
})

bleach = Albums.create({
  name: "Bleach",
  artist_id: nirvana.id
})

nevermind = Albums.create({
  name: "Nevermind",
  artist_id: nirvana.id
})

inutero = Albums.create({
  name: "In Utero",
  artist_id: nirvana.id
})

Songs.create({
  name: "scoff",
  album_id: bleach.id
})

Songs.create({
  name: "silver",
  album_id: bleach.id
})

Songs.create({
  name: "drain you",
  album_id: nevermind.id
})

Songs.create({
  name: "lithium",
  album_id: nevermind.id
})

Songs.create({
  name: "sentless apprentice",
  album_id: inutero.id
})

Songs.create({
  name: "heartshaped box",
  album_id: inutero.id
})
