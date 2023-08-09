<h1>Lunch and Learn</h1>

Lunch and Learn constitutes a Ruby on Rails-based backend application that unveils an API aimed at providing information regarding cuisines based on searched countries, along with supplementary insights into the cultural aspects of those nations. This tool empowers users to explore recipes categorized by country, add favorite recipes, and acquire deeper knowledge about specific countries. It consolidates data from diverse external API sources and manages functions such as user registration, authenticated login, and token-based verification for request authorization. Who's hungry?!

<h2>Learning Goals</h2>
- Exposing an API that aggregates data from multiple external APIs
- Exposing an API that requires an authentication token
- Exposing an API for CRUD functionality
- Implementation of Basic Authentication
- Ability to determine completion criteria based on the needs of other developers
- Ability to test both API consumption and exposure, making use of at least one mocking tool (VCR, Webmock, etc).

<h2>Installation</h2>

1. `git clone git@github.com:AlexKiselich/lunch_and_learn.git`
1. `cd lunch_and_learn`
1. `bundle install`
1. `rails db:{create, migrate}`
1. `bundle exec figaro install`
1. `rails s`

With your local server running, you can use a tool like [Postman](https://www.postman.com/) to make sample requests and view responses.

<h3>External APIs</h3>
Lunch and Learn's endpoints expose data from Edamam, RESTCountries, Youtube and UnSplash. You can sign up for free access to these APIs here:

  - [Edamam](https://developer.edamam.com/edamam-recipe-api)

  - [RESTCountries](https://restcountries.com/#api-endpoints-v3-all)

  - [Youtube](https://developers.google.com/youtube/v3/getting-started)

  - [Unsplash](https://unsplash.com/developers)

  - [API NINJA](https://api-ninjas.com/api/airquality)

Once you have your key for each site, add them to the `config/application.yml` file generated when you configure Figaro:

 - `EDAMAM_APP_ID: <add your key here>`
 - `EDAMAM_APPLICATION_KEY: <add your key here>`
 - `YOUTUBE_KEY: <add your key here>`
 - `UNSPLASH_KEY: <add your key here>`
 - `AIR_QUALITY_KEY: <add your key here>`

<h2>Testing</h2>

To run the full test suite: `bundle exec rspec`

(note: if you fail on one test called "returns a list of recipes from a random country" try running `bundle exec rspec` again, the VCR will run another API call with a new 200 status)

<h2>EndPoints</h2>
<details>
<summary>route: GET /api/v1/recipes?country=...</summary>
Get Recipes For A Particular Country -- searching for cuisines by country. Example data:

    {
    "data": [
        {
            "id": null,
            "type": "recipe",
            "attributes": {
                "title": "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)",
                "url": "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html",
                "country": "thailand",
                "image": "https://edamam-product-images.s3.amazonaws.com..."
            }
        },
        {etc...},
      ]
    }

If the country parameter is either an empty string, or a value that doesn’t return any recipes, return an empty array:

    {
      "data": []
    }

</details>

<details>
<summary>route: GET /api/v1/learning_resources?country=...</summary>
Get Learning Resources for a Particular Country -- include videos about that country's culture and images. Example data:

    {
    "data": {
        "id": null,
        "type": "learning_resource",
        "attributes": {
            "country": "laos",
            "video": {
                "title": "A Super Quick History of Laos",
                "youtube_video_id": "uw8hjVqxMXw"
            },
            "images": [
                {
                    "alt_tag": "standing statue and temples",
                    "url": "https://images.unsplash.com/photo-1528181304..."
                },
                {etc...},
              ]
        }
      }
    }

If no videos or images are found, those keys should point to an empty object:

    {
      "data": {
          "id": null,
          "type": "learning_resource",
          "attributes": {
              "country": "laos",
              "video": {},
              "images": []
          }
      }
    }

</details>

<details>
<summary>route: POST /api/v1/users </summary>
User Registration. Example data:

Example Request:

    POST /api/v1/users
    Content-Type: application/json
    Accept: application/json

    {
      "name": "Odell",
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf",
      "password_confirmation": "treats4lyf"
    }

Example Response:

    {
      "data": {
        "type": "user",
        "id": "1",
        "attributes": {
          "name": "Odell",
          "email": "goodboy@ruffruff.com",
          "api_key": "jgn983hy48thw9begh98h4539h4"
        }
      }
    }



</details>

<details>
<summary>route: POST /api/v1/sessions </summary>
Log In USer. Example data:

Example Request:

    POST /api/v1/sessions
    Content-Type: application/json
    Accept: application/json

    {
      "email": "goodboy@ruffruff.com",
      "password": "treats4lyf"
    }

Example Response:

    {
      "data": {
        "type": "user",
        "id": "1",
        "attributes": {
          "name": "Odell",
          "email": "goodboy@ruffruff.com",
          "api_key": "jgn983hy48thw9begh98h4539h4"
        }
      }
    }


</details>

<details>
<summary>route: POST /api/v1/favorites </summary>
Add Favorites Functionality to add recipes to a favorited list for a particular user can be done with the following request. Example data:

Example Request:

    POST /api/v1/favorites
    Content-Type: application/json
    Accept: application/json

    {
        "api_key": "jgn983hy48thw9begh98h4539h4",
        "country": "thailand",
        "recipe_link": "https://www.tastingtable.com/.....",
        "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)"
    }

Example Response:

    {
        "success": "Favorite added successfully"
    }

</details>

<details>
<summary>route: GET /api/v1/favorites?api_key=... </summary>
Get a User’s Favorites -- ability for a user to see all their favorite recipes. Example data:

Response:

    {
      "data": [
        {
            "id": "1",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Recipe: Egyptian Tomato Soup",
                "recipe_link": "http://www.thekitchn.com/recipe-egyptian-tomato-soup-weeknight....",
                "country": "egypt",
                "created_at": "2022-11-02T02:17:54.111Z"
            }
        },
        {
            "id": "2",
            "type": "favorite",
            "attributes": {
                "recipe_title": "Crab Fried Rice (Khaao Pad Bpu)",
                "recipe_link": "https://www.tastingtable.com/.....",
                "country": "thailand",
                "created_at": "2022-11-07T03:44:08.917Z"
            }
        }
      ]
    }

</details>
