# Tea Subscription Service

> A rails backend API for a service oriented application. 
> 
> Exposes endpoints that
>   * Subscribes a customer to a tea subscription
>   * Cancels a customer’s tea subscription
>   * Displays all of a customer’s subsciptions (active and cancelled)

## Contributors
[TJ Williams](https://github.com/T-willjr)

# Getting Started

## Development setup
```ruby 2.7.4```

```rails 5.2.6```

## Gems

![pry v badge](https://img.shields.io/gem/v/pry?color=blue&label=pry)
![shoulda-matchers v badge](https://img.shields.io/gem/v/shoulda-matchers?label=shoulda-matchers)
![rspec v badge](https://img.shields.io/gem/v/rspec?color=orange&label=rspec)
![simplecov v badge](https://img.shields.io/gem/v/simplecov?color=green&label=simplecov)
![json-apiserializer](https://img.shields.io/badge/json-apiserializer-blue)


## Setup

1. clone this repository 
2. cd into 'tea_service_subscription-' directory 
3. run ```'bundle install' to install gems```
7. run ```rake db:{drop,create,migrate,seed} to prepare the database ```
8. run ```bundle exec rspec``` to run the test suite 
9. run ```rails s``` to launch the production environment
10. send requests to "https://localhost:5000". 

## Schema

![Screen Shot 2022-05-11 at 6 06 15 PM](https://user-images.githubusercontent.com/89754305/167955492-58f4de89-df2b-49dd-bf12-55f0a323491b.png)
![Screen Shot 2022-05-11 at 6 06 33 PM](https://user-images.githubusercontent.com/89754305/167955524-5be03433-e394-44ae-82f9-42b1aec9eb33.png)


## API Responses


## Subscribes a customer to a tea subscription 

### POST http://localhost:5000/api/v1/
```
JSON Raw Body: 

{ 
    "email": "test@gmail.com"
}

```
```
Response:
[
    {
      
    }
]

```

## Cancels a customer’s tea subscription

### POST http://localhost:5000/api/v1/
```
JSON Raw Body: 

{ 
    
}

```
```
Response:
[
    {
      
    }
]

```
## Displays all of a customer’s subsciptions (active and cancelled)

### PATCH http://localhost:5000/api/v1/

```
JSON Raw Body: 

{ 
    
}

```
```
Response:
[
    {
      
    }
]

```

