// CREATE operation
use basictask;

// INSERT operation - Insert one
db.employee.insertOne({
	id: 1,
    name: "Adam",
	age: 25,
	salary: 45000
});

// INSERT operation - Insert many
db.employee.insertMany([
    {
        id: 2,
	    name: "Ben",
		age: 35,
		salary: 50000
    },
    {
        id: 3,
    	name: "Charlie",
		age: 28,
		salary: 45000
    },
    {
		id: 4,
    	name: "David",
		age: 28,
		salary: 45000
    }
]);

// READ operation - Read all
db.employee.find();

// READ operation - Read specific
db.employee.find({age: {$gt: 25}});

// UPDATE operation - Update One
db.employee.updateOne(
  {name: "Adam"},
  {$set: {age: 31}}
);
db.employee.find({age: {$gt: 31}});

// UPDATE operation - Update many
db.employee.updateMany(
  {age: {$gt: 28}},
  {$set: {salary: 47500}}
);
db.employee.find({age: {$gt: 28}});

// Count documents in a collection
db.employee.count();

// Sort in ascending and descending order
db.employee.find().sort({age: 1});
db.employee.find().sort({age: -1});

// Limit the number of documents returned
db.employee.find().limit(5);

// Aggregate queries
db.employee.aggregate([
  { $group: { _id: "$age", count: {$sum: 1}}}
]);

// DELETE operation - Delete one
db.employee.deleteOne({name: "Adam"});
db.employee.find();

// DELETE operation - Delete many
db.employee.deleteMany({age: {$gt: 28}});
db.employee.find();
