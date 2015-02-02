require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/artist'
require_relative './lib/album'
require_relative './lib/song'

require 'pry'

after do
ActiveRecord::Base.connection.close
end

get("/") do
erb(:index)
end

get("/artists") do
erb(:"artists/index", { locals: { artists: Artists.all() } })
end

get("/artists/:id") do
artist = Artists.find_by({id: params[:id]})
erb(:"artists/show", { locals: { artist: artist } })
end

get("/albums") do
erb(:"albums/index", { locals: { albums: Albums.all(), } })
end

get("/albums/:id") do
album = Albums.find_by({id: params[:id]})
erb(:"albums/show", { locals: { album: album } })
end

get("/albums/new") do
erb(:"albums/new", { locals: { artists: Artists.all(), } })
end

post("/albums") do
albums_hash = {
  name: params["name"],
  artist_id: params["artist_id"]
}

Albums.create(albums_hash)

erb(:"albums/index", { locals: { albums: Albums.all() } })
end

get("/albums/:id/edit") do
album = Albums.find_by({id: params[:id]})
erb(:"albums/edit", { locals: { album: album, artists: Artists.all() } })
end

put("/albums/:id") do
albums_hash = {
  name: params["name"],
  artist_id: params["artist_id"]
}

album = Albums.find_by({id: params[:id]})
album.update(albums_hash)

erb(:"albums/show", { locals: { album: album } })
end

delete("/albums/:id") do
album = Albums.find_by({id: params[:id]})
album.destroy

redirect "/albums"
end


#another take

require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/connection'
require_relative './lib/artist'
require_relative './lib/album'
require_relative './lib/song'

require 'pry'

after do
  ActiveRecord::Base.connection.close
end

get("/") do
  erb(:index)
end

get("/artists") do
  erb(:"artists/index", { locals: { artists: Artists.all() } })
end

get("/artists/:id") do
  artist = Artists.find_by({id: params[:id]})
  erb(:"artists/show", { locals: { artist: artist } })
end

get("/artists/new") do
  erb(:"artists/new", { locals: { artists: Artists.all(), } })
end

post("/artist") do
  artist_hash = {
    name: params["name"],
  }

  Artists.create(artist_hash)

  erb(:"artists/index", { locals: { artists: Artists.all() } })
end

get("/artists/:id/edit") do
  artist = Artists.find_by({id: params[:id]})
  erb(:"artists/edit", { locals: { artist: artist, artists: Artists.all() } })
end

put("/artists/:id") do
  artist_hash = {
    name: params["name"],
  }

  artist = Artists.find_by({id: params[:id]})
  artist.update(artist_hash)

  erb(:"artists/show", { locals: { artist: artist } })
end

delete("/artists/:id") do
  artist = Artists.find_by({id: params[:id]})
  artist.destroy

  redirect "/artists"
end


#albums

get("/albums") do
  erb(:"albums/index", { locals: { albums: Albums.all(), } })
end

get("/albums/:id") do
  album = Albums.find_by({id: params[:id]})
  erb(:"albums/show", { locals: { album: album } })
end

get("/albums/new") do
  erb(:"albums/new", { locals: { artists: Artists.all(), } })
end

post("/album") do
  albums_hash = {
    name: params["name"],
    artist_id: params["artist_id"]
  }

  Albums.create(albums_hash)

  erb(:"albums/index", { locals: { albums: Albums.all() } })
end

get("/albums/:id/edit") do
  album = Albums.find_by({id: params[:id]})
  erb(:"albums/edit", { locals: { album: album, artists: Artists.all() } })
end

put("/albums/:id") do
  albums_hash = {
    name: params["name"],
    artist_id: params["artist_id"]
  }

  album = Albums.find_by({id: params[:id]})
  album.update(albums_hash)

  erb(:"albums/show", { locals: { album: album } })
end

delete("/albums/:id") do
  album = Albums.find_by({id: params[:id]})
  album.destroy

  redirect "/albums"
end

#songs

get("/songs") do
  erb(:"songs/index", { locals: { songs: Songs.all(), } })
end

get("/songs/:id") do
  song = Songs.find_by({id: params[:id]})
  erb(:"songs/show", { locals: { song: song } })
end

get("/songs/new") do
  erb(:"songs/new", { locals: { albums: Albums.all(), } })
end

post("/song") do
  song_hash = {
    name: params["name"],
    album_id: params["album_id"]
  }

  Songs.create(song_hash)

  erb(:"songs/index", { locals: { songs: Songs.all() } })
end

get("/songs/:id/edit") do
  song = Songs.find_by({id: params[:id]})
  erb(:"songs/edit", { locals: { song: song, albums: Albums.all() } })
end

put("/songs/:id") do
  songs_hash = {
    name: params["name"],
    album_id: params["album_id"]
  }

  song = Songs.find_by({id: params[:id]})
  song.update(songs_hash)

  erb(:"songs/show", { locals: { song: song } })
end
