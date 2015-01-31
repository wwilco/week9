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
