#Gatekeeper Spec


##GK Listener

### Actions

* Create session
* Login a user - looks like a query, but is a special case
* Generate GK Queries

##GK Session

### Instance Properties

* Database name
* Database username
* Database password
* Username
* Password
* Session Queries
* User Queries

### Class Methods

* Instantiate: connect to database
  * Arguments:
		* database username
		* database password        
		* database name

### Instance Method

*Login: login a user
	* Arguments:
		* username
		* password

*Add Query - store query and process

##GK Notify

### Instance Properties

* Array of Model.Channels: Channels managed by this GK Notify


### Class Methods

* Emit: Emit to clients that are authorized to see the change. 
	* Arguments:
		* object
		* verb


##GK Query

### Instance Properties
	* Session
	* Query made
	
### Instance Methods

* Forward Query: Sanitize, authorize, emit response
