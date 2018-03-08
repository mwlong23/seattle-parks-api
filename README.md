# Seattle Parks API
#### By Mitchell Long
### A Simple Way To Find New Parks In Your City

Seattle Parks API is a Ruby on Rails API with endpoints to return a list of neighborhoods, the parks in each neighborhood and a random park.  

### Important Information
At the moment this API is seeded with data that doesn't represent real parks in Seattle. The database will return results that you would expect any park to have( name, address, neighborhood, LatLon coordinates, bathroom, drinking fountain informatin).  However, these results are not reflective of an actual park.  

### Getting Seattle Parks Installed Locally
In order to get this api running on your local computer you're going to need to get a couple dependencies installed.  

* Ruby( at least version 2.0)
* Rails (at least version 5.0)
* [PostgresSQL](https://www.postgresql.org/) 
If you''re unfamiliar with installing packages I would recommend [Homebrew](https://brew.sh/) for Mac users.

[This](http://blog.teamtreehouse.com/installing-rails-5-linux) is a great guide by Treehouse to get you started with Ruby and Rails on any system.



Hats off to you! That was the hard part. 

Once all dependencies are installed: 

* clone [this](https://github.com/mwlong23/seattle-parks-api) repo
using the command ```$: git clone https://github.com/mwlong23/seattle-parks-api```
* Make sure you have installed. 

* Navigate to the root project folder using ```$: cd seattle-parks```

* Run the command ```$: bundle install``` in comman line to install gem dependencies(using homebrew).

Next run migrations using the command: 
```$: rails db:migrate ``` 

Create your database:

```$: rails db:create```

Lastly, Start your server and navigate to one of the endpoints listed below in the endpoints section to view the api results in the browser(curl or postman also work).

Start server: ```$: rails s``` 

Navigate to:
at http://localhost:3000/find/random 
Example Results: 
``` 
[{"id":6,"name":"Krikkit","created_at":"2018-03-07T23:31:27.238Z","updated_at":"2018-03-07T23:31:27.238Z"}]
``` 
(Remember that neighborhoods are currently seeded with Hitchhikers Guide to the Galaxy planets, see endpoints below)





### Endpoints
* Random Neighborhood: http://localhost:3000/find/random

* Search By Neighborhood
http://localhost:3000/neighborhoods
* Search by a specific neighborhood:
http://localhost:3000/neighborhoods/3/parks

### API Call Results


### Additional Coming Features: 
* Replace Seed Data with Actual Park Data. 
* Token Based Authentication with JWT
* Pagination
* Serialization
* Rate Limitations

