### create db
<pre>
use theater
</pre>
### Create some documents
<pre>
db.theater.insertMany([
... { "theaterId": 1000, "location": { "address": { "street1": "340 W Market", "city": "Bloomington", "state": "MN", "zipcode": "55425" }, "geo": { "type": "Point", "coordinates": [ -93.24565, 44.85466 ] } } },
... { "theaterId": 2716, "location": { "address": { "street1": "2856 E 3rd St", "street2": "#C10D", "city": "Bloomington", "state": "IN", "zipcode": "47401" }, "geo": { "type": "Point", "coordinates": [ -86.495262, 39.164202 ] } } },
... { "theaterId": 2765, "location": { "address": { "street1": "1615 East Empire St", "street2": "#1410", "city": "Bloomington", "state": "IL", "zipcode": "61701" }, "geo": { "type": "Point", "coordinates": [ -88.956401, 40.485889 ] } } } ])
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId("63cc18815d3e008e08799e96"),
    '1': ObjectId("63cc18815d3e008e08799e97"),
    '2': ObjectId("63cc18815d3e008e08799e98")
  }
}
</pre>
### documents out
<pre>
theater> db.theater.find()
[
  {
    _id: ObjectId("63cc18815d3e008e08799e96"),
    theaterId: 1000,
    location: {
      address: {
        street1: '340 W Market',
        city: 'Bloomington',
        state: 'MN',
        zipcode: '55425'
      },
      geo: { type: 'Point', coordinates: [ -93.24565, 44.85466 ] }
    }
  },
  {
    _id: ObjectId("63cc18815d3e008e08799e97"),
    theaterId: 2716,
    location: {
      address: {
        street1: '2856 E 3rd St',
        street2: '#C10D',
        city: 'Bloomington',
        state: 'IN',
        zipcode: '47401'
      },
      geo: { type: 'Point', coordinates: [ -86.495262, 39.164202 ] }
    }
  },
  {
    _id: ObjectId("63cc18815d3e008e08799e98"),
    theaterId: 2765,
    location: {
      address: {
        street1: '1615 East Empire St',
        street2: '#1410',
        city: 'Bloomington',
        state: 'IL',
        zipcode: '61701'
      },
      geo: { type: 'Point', coordinates: [ -88.956401, 40.485889 ] }
    }
  }
]
</pre>
### find condition
<pre>
theater> db.theater.find({"location.address.state":"MN"})
[
  {
    _id: ObjectId("63cc18815d3e008e08799e96"),
    theaterId: 1000,
    location: {
      address: {
        street1: '340 W Market',
        city: 'Bloomington',
        state: 'MN',
        zipcode: '55425'
      },
      geo: { type: 'Point', coordinates: [ -93.24565, 44.85466 ] }
    }
  }
]
</pre>
