#Installing rmongoDB
#may need to install following if no curl:
##* deb: libcurl4-openssl-dev (Debian, Ubuntu, etc)
##* rpm: libcurl-devel (Fedora, CentOS, RHEL)
##* csw: libcurl_dev (Solaris)

#install.packages("devtools")


library(devtools)
install_github(repo = "mongosoup/rmongodb")


#testing

library(rmongodb)

mongo = mongo.create(host = "localhost") #connects to default port 27017

mongo.is.connected(mongo)

#Returns "TRUE" is sucessful