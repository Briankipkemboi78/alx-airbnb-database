##Before Optimization
Nested Loop  (cost=0.85..1023.45 rows=100 width=200) (actual time=0.100..12.345 rows=50 loops=1)
  -> Nested Loop Join
     -> Seq Scan on Booking b  (cost=0.00..100.00 rows=50 width=80)
     -> Index Scan on User u   (cost=0.00..10.00 rows=1 width=100)
     -> Index Scan on Property p   (cost=0.00..10.00 rows=1 width=100)
     -> Seq Scan on Payment py   (cost=0.00..100.00 rows=10 width=60)
Execution Time: 15.456 ms


##After Optimization
Hash Join  (cost=0.85..523.45 rows=100 width=160) (actual time=0.050..6.123 rows=50 loops=1)
  -> Seq Scan on Booking b  (cost=0.00..50.00 rows=50 width=80)
  -> Hash Join on User u and Property p (cost=0.00..20.00 rows=50 width=80)
  -> Index Scan on Payment py   (cost=0.00..10.00 rows=10 width=60)
Execution Time: 6.345 ms
