require 'sinatra'
students = {
  0 => {
  id: 0,
  name: "Harry Potter",
  age: 26,
  spell: "Pow!"
  }
}
counter = 1
get '/students' do
  erb :index, locals:{students: students}
end

post '/student' do
  newstudent = {
      id: counter,
      name: params["name"],
      age: params["age"],
      spell: params["spell"]
  }
  students[counter] = newstudent
  counter += 1
  redirect '/students'
end

get '/students/:id' do
  thiswiz = students[params[:id].to_i]
  erb :next, locals: {thiswiz: thiswiz}
end

delete '/students/:id' do
  students.delete(params[:id].to_i)
  redirect '/students'
end

get '/search' do
  name_search = students[params[:name]
  (erb :search, {locals: name_search})
end
