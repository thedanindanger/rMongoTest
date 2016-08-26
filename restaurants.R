library(rmongodb)
library(RCurl)
library(rjson)
mongo = mongo.create(host = "localhost") #connects to default port 27017

#testing databases

mongo.get.databases(mongo)

#get sample code:
restData <- getURL("https://raw.githubusercontent.com/mongodb/docs-assets/primer-dataset/primer-dataset.json")



#let's see if we can import raw data directly to mongo
#otherwise we have to translate JSON to list to BSON
#we don't have to do this in reg Mongo..

#I got an stack overflow error...

#tried .bson.from.JSON() but had another stack error...

listData <- fromJSON(restData)

bsonData <- mongo.bson.from.list(listData)

#We'll make the test db if it doesn't already exist (it does)
#and include the restaurants collection

mongo.insert(mongo,"test.restaurants", bsonData)

#That inserted.. but let's check if it matches the example
#yeah... wget -O restaurants.json "https://raw.githubusercontent.com/mongodb/docs-assets/primer-dataset/primer-dataset.json"
#gets that data much faster...
#really? mongoimport --db test --collection restaurantsM --drop --file ./restaurants.json
##that was only two lines of code and super quick

#let's at least check the structure

#validating both dbs are present:

mongo.get.database.collections(mongo, db = "test")
#that doesn't show up anything? Probably cause test

mongo.count(mongo,"test.restaurants")
# returns 1...

mongo.count(mongo,"test.restaurantsM")
# returns 25359, which is the right answer

#okay, so no importing with R
