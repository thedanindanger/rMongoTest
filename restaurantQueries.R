library(rmongodb)

#let's stop the 'mongo' naming convention on the mongo context object
#I need a distinction between the rmongodb functions vs. the mdb context

mdc = mongo.create(host = "localhost") #connects to default port 27017

#restaurantsM added via mongo command line
#see restaurants.r file comments

#"Select top 1 * from restaurantsM / select * from restaurantsM limit 1
oneLine = mongo.find.one(mdc, 'test.restaurantsM')

oneLine

class(oneLine) #data is of class mongo.bson

#need to convert the data for R to lists again...
#... this is much easier in python: https://docs.mongodb.com/getting-started/python/client/

oneLineR = mongo.bson.to.list(oneLine)

oneLineR$address

#Now we can navigate with normal R syntax

#okay, that's not that bad...

