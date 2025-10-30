```
supabase.from('countries')
  .stream(primaryKey: ['id'])
  .listen((List<Map<String, dynamic>> data) {
  // Do something awesome with the data
});
```