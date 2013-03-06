# Gatekeeper



# Gatekeeper ORM

## Types

* Callback(object, verb{updated, deleted}): Called when an object is mutated
* Optional [ opt1 | opt2 | ...]: Description


## Remote

### Class Properties

### Instance Properties

* Host: Hostname of Gatekeeper instance
* Port: Port of Gatekeeper instance
* DB User: Database Username of Gatekeeper instance
* DB Pass: Database Password of Gatekeeper instance

* Array of Model.Class: Classes managed by this remote

### Class Methods

* Instantiate: Create an instance
	* Arguments:
		* host
		* port
		* user
		* pass

### Instance Methods

* ManageModel:
	* Arguments:
		* Model.Class

* Connect: Connect to Gatekeeper instance

## Model

### Class Properties

* Callback
* Remote
* Collection Name
* Database Name

### Instance Properties

* Array of Callbacks

### Class Methods

* Instantiate: Create an instance
	* Arguments:
		* Callback
		* Optional [ object | json | binary ]: Input format to obtain data from
		
* All: Fetch all instances and listen for new instances
	* Arguments
		* Callback
		
* Find: Query for instances and listen for new instances matching query
	* Arguments
		* query: Query to be performed on database
		* Callback
		

### Instance Methods

* AddCallback: Adds a callback for updates
	* Arguments
		* name: callback name
		* Callback
		
* RemoveCallback: Removes a callback
	* Arguments
		* name: callback name


* Save: Commit changes to database or create new document

* Delete: Remove document from database	
	
	
	