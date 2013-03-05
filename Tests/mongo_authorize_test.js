//Test

var test_user = {
	name:"Test_User"
}
db.users.save(test_user)
var current_user = db.users.findOne(test_user)

var foo = 
{
	name:"foo",

	view:"private",

	authorization:
	{
		read:[current_user._id],
		read_write:[]
	}
}

var bar = 
{
	name:"bar",

	view:"private",

	authorization:
	{
		read:[],
		read_write:[]
	}
}

var etc = 
{
	name:"etc",

	view:"public",
}

var xyz = 
{
	name:"xyz",

	view:"custom",
}

db.objects.save(foo)
db.objects.save(bar)
db.objects.save(etc)
db.objects.save(xyz)

function objToString (obj) {
	var str = '{';
	if (typeof obj != "object") return obj;
	else
	for (var p in obj) {
		if (obj.hasOwnProperty(p)) {
			str += p + ':' + objToString(obj[p]) ;
		}
	}
return str + '}, ';
}

function merge_options(obj1, obj2){
    var obj3 = {};
    for (var attrname in obj1) { obj3[attrname] = obj1[attrname]; }
    for (var attrname in obj2) { obj3[attrname] = obj2[attrname]; }
    return obj3;
}

function sanatize_query(q){
	// Remove any offending keys from input: deep recurse to be safe
	// view
	// authorization

	print("sanatize_query: "+objToString(q));

	return q;
}

function authorize_query(q){
	//Add authorization

	print("authorize_query_input: "+objToString(q));
	var auth = 
		[
			{'authorization.read':{$in:[current_user._id]}},
			{view:"public"}
		];

	if(typeof q === 'undefined')
	{
		q = {
			$or:auth
		}
	}
	else if('$or' in q)
	{
		q['$or'].concat(auth);
	}
	else
	{
		q['$or'] = auth;
	}

	print("authorize_query: "+objToString(q));

	return q;
}

function build_query(q){
	return authorize_query(sanatize_query(q))
}

function find(q){
	query = build_query(q);
	// Query and hide sensitive keys
	return db.objects.find(query, {authorization:false, view:false});
}

d

res = find().toArray()
print(res)

res2 = find({name:"etc"}).toArray()

res3 = find({$or:[{name:"bar"},{name:"foo"}]}).toArray()



db.objects.drop()
db.users.drop()
