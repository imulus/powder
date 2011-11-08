require './app'

map "/assets" do
  run Powder::App.sprockets
end

map "/" do
  run Powder::App
end