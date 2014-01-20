# Get’em Owl Client

## Installation
Download or clone the repository. Open the XCode project. You should now be able to run the application in the iPhone Retina  (4-inch) simulator.

In order to run the application on an iPhone, you need an Apple Developer Account for iOS which is paid. Please refer to the Apple Documentation on how to install your device and a provisioning profile for the application.

## Save data to database

A json array is sent to the address `http://hibou.yoanngern.ch/saveOwls.php` where it is handled and saved.

### Example of json Array

	[
	     {
	          "coorX": "46.784666",
	          "coorY": "6.647058",
	          "timestamp": "2014-01-19 11:33:55 +0000",
	          "altitude": "500",
	          "age": "2",
	          "sexe": "Male",
	          "no_ring": "1234B",
	          "weight": 900,
	          "wing_size": 20,
	          "tarse": 55,
	          "comments": "This is a comment",
	          "spieces": "Chevêchette d'Europe",
	          "class": "Aves",
	          "family": "Strigidae",
	          "locationName": "Mt Hibou",
	          "statusWeather": "rain",
	          "temperature": 20
	     },
		...
	]

### Types of data
- **coorX** Double (longitude WGS84)
- **coorY** Double (latitude WGS84)
- **timestamp** Date yyyy-mm-dd hh:mm:ss +0000
- **altitude** Integer
- **age** Integer
- **sexe** String (Male or Female)
- **no\_ring** String
- **weight** Integer
- **wing\_size** Integer
- **tarse** Integer
- **comments** String
- **species** String
- **class** String
- **family** String
- **locationName** String
- **statusWeather** String (sun, rain, cloudy, fog, period of sunshine or snow)

## Get Owls from the DB
Get all owls in database by `http://hibou.yoanngern.ch/get.php`

## Show the records
The data can be acessed on `http://hibou.yoanngern.ch`

