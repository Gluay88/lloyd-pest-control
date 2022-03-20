![Lloyd Pest Control](./app/assets/images/lloydheader.jpg)

## Lloyd_Pest_Control
##### By: Gluay S. Wang
### set up the project
- rails new lloyd_pest_control -d postgresql -T
- cd lloyd_pest_control folder
- rails db:create
- create a github repo (lloyd-pest-control)
- git init (in Terminal)
- git add .
- git commit -m "first commit"
- git remote add origin https://github.com/Gluay88/lloyd-pest-control.git
- git push -u origin main

![Association](./app/assets/images/table-data.jpg)

### Create an Invoice model
- rails g scaffold Invoice date:datetime client:string tax:decimal saleperson:string
- rails db:migrate
- added the invoice data 
- config/routes.rb - add root to: 'invoices#index'
- rails g controller welcome index technicians locations orders 
- app/views/layouts/application.html.erb -- added link_to 
``` ruby
<body>
    <%= link_to "Home", root_path %>
    <%= link_to "Technicians", welcome_technicians_path %>
    <%= link_to "Locations", welcome_locations_path %>
    <%= link_to "Work Orders", welcome_orders_path %>
    <%= link_to "Invoices", invoices_path %>
    <%= link_to "Login", root_path %>
    <%= yield %>
</body>
```
### Add Bootstrap
Gemfile
gem 'bootstrap-sass', '~> 3.4.1'
gem 'sassc-rails', '>= 2.1.0'

bundle install (in Terminal)
rename stylesheet css
yarn add bootstrap
mv app/assets/stylesheets/application.css app/assets/stylesheets/application.scss

### Create Technician Model
- rails g scaffold Technician name:string --no-stylesheets
- rails db:migrate

rails g migration add_id_to_technician id:interger
rails db:migrate
rails destroy migration add_id_to_technician

### CSV Upload
app/controllers/technicians_controller.rb
add
``` ruby
<h3>Import Technicians</h3>
<%= form_tag import_technicians_path, multipart: true do %>
  <%= file_field_tag :file %>
  <%= submit_tag "Upload File" %>
<% end %>
```
config/routes.rb
add
``` ruby
resources :technicians do 
    collection { post :import }
end
```

app/controllers/technicians_controller.rb
add
``` ruby
def import 
    Technician.import(params[:file])
    redirect_to technicians_path, notice: "Technicians Added Successfully!"
end
```
app/models/technician.rb
add
``` ruby
def self.import(file)
    CSV.foreach(file.path, headers: true) do |row| 
        self.find_or_create_by(id: row["id"]) do |technician|
        technician.name = row["name"]
        end  
    end
end
```
config/application.rb 
add
```ruby 
    require "csv"
```
