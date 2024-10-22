## Домашнее задание к занятию "12. Индексы в PostgreSQL "

Необходимо:

1. Создать индекс к какой-либо из таблиц вашей БД
2. Прислать текстом результат команды explain, в которой используется данный индекс

Отбираем все материалы на складе с кол-вом > 10.

```
select m.code, m.name, b.lot_number, b.amount
  from warehouse.material m 
     , warehouse.balance b
 where m.id = b.material_id
   and b.amount > 10 
order by b.amount
```
План запроса без дополнительного индекса:

```
QUERY PLAN                                                                                                                                   |
---------------------------------------------------------------------------------------------------------------------------------------------+
Gather Merge  (cost=50308.13..95585.43 rows=388064 width=79) (actual time=546.317..837.036 rows=465556 loops=1)                              |
  Workers Planned: 2                                                                                                                         |
  Workers Launched: 2                                                                                                                        |
  ->  Sort  (cost=49308.11..49793.19 rows=194032 width=79) (actual time=537.271..599.210 rows=155185 loops=3)                                |
        Sort Key: b.amount                                                                                                                   |
        Sort Method: external merge  Disk: 14768kB                                                                                           |
        Worker 0:  Sort Method: external merge  Disk: 15352kB                                                                                |
        Worker 1:  Sort Method: external merge  Disk: 11760kB                                                                                |
        ->  Nested Loop  (cost=0.44..23642.34 rows=194032 width=79) (actual time=0.065..360.871 rows=155185 loops=3)                         |
              ->  Parallel Seq Scan on balance b  (cost=0.00..14097.61 rows=194032 width=20) (actual time=0.026..156.197 rows=155185 loops=3)|
                    Filter: (amount > '10'::numeric)                                                                                         |
                    Rows Removed by Filter: 191478                                                                                           |
              ->  Memoize  (cost=0.44..0.66 rows=1 width=67) (actual time=0.001..0.001 rows=1 loops=465556)                                  |
                    Cache Key: b.material_id                                                                                                 |
                    Cache Mode: logical                                                                                                      |
                    Hits: 156169  Misses: 7531  Evictions: 0  Overflows: 0  Memory Usage: 1252kB                                             |
                    Worker 0:  Hits: 163238  Misses: 7445  Evictions: 0  Overflows: 0  Memory Usage: 1237kB                                  |
                    Worker 1:  Hits: 123895  Misses: 7278  Evictions: 0  Overflows: 0  Memory Usage: 1209kB                                  |
                    ->  Index Scan using pk_2 on material m  (cost=0.43..0.65 rows=1 width=67) (actual time=0.003..0.003 rows=1 loops=22254) |
                          Index Cond: (id = b.material_id)                                                                                   |
Planning Time: 0.758 ms                                                                                                                      |
Execution Time: 865.412 ms                                                                                                                   |                                                                                                                  |
```

Создаем дополнительный индекс.
```CREATE INDEX idx_balance_amount ON warehouse.balance USING btree (amount)```

```
QUERY PLAN                                                                                                                                         |
---------------------------------------------------------------------------------------------------------------------------------------------------+
Nested Loop  (cost=0.86..57237.54 rows=467971 width=79) (actual time=0.055..521.279 rows=465556 loops=1)                                           |
  ->  Index Scan using idx_balance_amount on balance b  (cost=0.42..40834.71 rows=467971 width=20) (actual time=0.040..151.072 rows=465556 loops=1)|
        Index Cond: (amount > '10'::numeric)                                                                                                       |
  ->  Memoize  (cost=0.44..0.66 rows=1 width=67) (actual time=0.000..0.000 rows=1 loops=465556)                                                    |
        Cache Key: b.material_id                                                                                                                   |
        Cache Mode: logical                                                                                                                        |
        Hits: 458025  Misses: 7531  Evictions: 0  Overflows: 0  Memory Usage: 1252kB                                                               |
        ->  Index Scan using pk_2 on material m  (cost=0.43..0.65 rows=1 width=67) (actual time=0.002..0.002 rows=1 loops=7531)                    |
              Index Cond: (id = b.material_id)                                                                                                     |
Planning Time: 0.324 ms                                                                                                                            |
Execution Time: 548.084 ms                                                                                                                         |                                                                                                                       |
```
3. Реализовать индекс для полнотекстового поиска

Отбираем на складе материалы с определенным наименованием.

```
select m.code, m.name, b.lot_number, b.amount
  from warehouse.material m 
     , warehouse.balance b
 where m.id = b.material_id
   and m.name = 'Футер 2-ка петля. Ephemera (Эфемера)'
```

План запроса без дополнительного индекса:

```
QUERY PLAN                                                                                                                            |
--------------------------------------------------------------------------------------------------------------------------------------+
Gather  (cost=1000.44..28859.86 rows=1016 width=79) (actual time=0.309..377.658 rows=180 loops=1)                                     |
  Workers Planned: 2                                                                                                                  |
  Workers Launched: 2                                                                                                                 |
  ->  Nested Loop  (cost=0.44..27758.26 rows=423 width=79) (actual time=3.372..365.941 rows=60 loops=3)                               |
        ->  Parallel Seq Scan on balance b  (cost=0.00..13014.29 rows=433329 width=20) (actual time=0.013..54.852 rows=346663 loops=3)|
        ->  Memoize  (cost=0.44..0.55 rows=1 width=67) (actual time=0.000..0.000 rows=0 loops=1039990)                                |
              Cache Key: b.material_id                                                                                                |
              Cache Mode: logical                                                                                                     |
              Hits: 404811  Misses: 7539  Evictions: 0  Overflows: 0  Memory Usage: 501kB                                             |
              Worker 0:  Hits: 290070  Misses: 7290  Evictions: 0  Overflows: 0  Memory Usage: 485kB                                  |
              Worker 1:  Hits: 322705  Misses: 7575  Evictions: 0  Overflows: 0  Memory Usage: 504kB                                  |
              ->  Index Scan using pk_2 on material m  (cost=0.43..0.54 rows=1 width=67) (actual time=0.004..0.004 rows=0 loops=22404)|
                    Index Cond: (id = b.material_id)                                                                                  |
                    Filter: ((name)::text = 'Футер 2-ка петля. Ephemera (Эфемера)'::text)                                             |
                    Rows Removed by Filter: 1                                                                                         |
Planning Time: 0.803 ms                                                                                                               |
Execution Time: 377.764 ms                                                                                                            |                                                                                                           |
```

Создаем дополнительный hash-индекс:
```CREATE INDEX idx_material_name_hash ON warehouse.material USING hash (name)```

```
QUERY PLAN                                                                                                                                           |
-----------------------------------------------------------------------------------------------------------------------------------------------------+
Gather  (cost=4417.44..18671.02 rows=1018 width=79) (actual time=1.182..152.720 rows=180 loops=1)                                                    |
  Workers Planned: 2                                                                                                                                 |
  Workers Launched: 2                                                                                                                                |
  ->  Hash Join  (cost=3417.44..17569.22 rows=424 width=79) (actual time=2.295..144.045 rows=60 loops=3)                                             |
        Hash Cond: (b.material_id = m.id)                                                                                                            |
        ->  Parallel Seq Scan on balance b  (cost=0.00..13014.29 rows=433329 width=20) (actual time=0.013..58.121 rows=346663 loops=3)               |
        ->  Hash  (cost=3404.43..3404.43 rows=1041 width=67) (actual time=1.436..1.437 rows=108 loops=3)                                             |
              Buckets: 2048  Batches: 1  Memory Usage: 27kB                                                                                          |
              ->  Bitmap Heap Scan on material m  (cost=32.07..3404.43 rows=1041 width=67) (actual time=0.053..1.384 rows=108 loops=3)               |
                    Recheck Cond: ((name)::text = 'Футер 2-ка петля. Ephemera (Эфемера)'::text)                                                      |
                    Heap Blocks: exact=108                                                                                                           |
                    ->  Bitmap Index Scan on idx_material_name_hash  (cost=0.00..31.81 rows=1041 width=0) (actual time=0.031..0.031 rows=108 loops=3)|
                          Index Cond: ((name)::text = 'Футер 2-ка петля. Ephemera (Эфемера)'::text)                                                  |
Planning Time: 0.356 ms                                                                                                                              |
Execution Time: 152.770 ms                                                                                                                           |                                                                                                                    |
```

4. Реализовать индекс на часть таблицы или индекс на поле с функцией

Выбираем на складе материалов по каким-либо параметрам (например, часть имени) только активные записи.

```
 explain analyze
 select *--count(*) --*
   from warehouse.material m
  where m.name ilike '%неон%'
    and active = true
```

План запроса без дополнительного индекса:

```
QUERY PLAN                                                                                                                        |
----------------------------------------------------------------------------------------------------------------------------------+
Gather  (cost=1000.00..28847.19 rows=29765 width=1132) (actual time=0.305..894.213 rows=43800 loops=1)                            |
  Workers Planned: 2                                                                                                              |
  Workers Launched: 2                                                                                                             |
  ->  Parallel Seq Scan on material m  (cost=0.00..24870.69 rows=12402 width=1132) (actual time=0.080..881.958 rows=14600 loops=3)|
        Filter: (active AND ((name)::text ~~* '%неон%'::text))                                                                    |
        Rows Removed by Filter: 339748                                                                                            |
Planning Time: 0.589 ms                                                                                                           |
Execution Time: 899.038 ms                                                                                                        |                
```

Создаем дополнительный GIN-индекс на активные записи:
```CREATE INDEX idx_material_name_gin ON warehouse.material USING GIN (name gin_trgm_ops) where active = true```

```
Bitmap Heap Scan on material m  (cost=235.50..20822.61 rows=29765 width=1132) (actual time=11.327..158.402 rows=43800 loops=1)        |
  Recheck Cond: (((name)::text ~~* '%неон%'::text) AND active)                                                                        |
  Heap Blocks: exact=14607                                                                                                            |
  ->  Bitmap Index Scan on idx_material_name_gin  (cost=0.00..228.05 rows=29765 width=0) (actual time=6.618..6.619 rows=43800 loops=1)|
        Index Cond: ((name)::text ~~* '%неон%'::text)                                                                                 |
Planning Time: 0.349 ms                                                                                                               |
Execution Time: 161.066 ms                                                                                                            |                                                                                                           |
```

5. Создать индекс на несколько полей

Отбираем материалы на складе по нескольким параметрам, например, по типу и цвету.

```
select count(*)
  from warehouse.material m 
 where m.material_type_id in (38, 39, 40, 41, 42, 43)
   and m.material_color_id in (15, 16, 17, 18, 19, 20)
```

План запроса без дополнительного индекса:

```
QUERY PLAN                                                                                                                                              |
--------------------------------------------------------------------------------------------------------------------------------------------------------+
Finalize Aggregate  (cost=28890.88..28890.89 rows=1 width=8) (actual time=136.156..139.182 rows=1 loops=1)                                              |
  ->  Gather  (cost=28890.67..28890.88 rows=2 width=8) (actual time=136.150..139.177 rows=3 loops=1)                                                    |
        Workers Planned: 2                                                                                                                              |
        Workers Launched: 2                                                                                                                             |
        ->  Partial Aggregate  (cost=27890.67..27890.68 rows=1 width=8) (actual time=127.796..127.797 rows=1 loops=3)                                   |
              ->  Parallel Bitmap Heap Scan on material m  (cost=4240.88..27621.83 rows=107535 width=0) (actual time=17.490..114.858 rows=86400 loops=3)|
                    Recheck Cond: (material_color_id = ANY ('{15,16,17,18,19,20}'::integer[]))                                                          |
                    Filter: (material_type_id = ANY ('{38,39,40,41,42,43}'::integer[]))                                                                 |
                    Rows Removed by Filter: 43812                                                                                                       |
                    Heap Blocks: exact=9252                                                                                                             |
                    ->  Bitmap Index Scan on fk_4_1  (cost=0.00..4176.36 rows=388507 width=0) (actual time=19.027..19.027 rows=390636 loops=1)          |
                          Index Cond: (material_color_id = ANY ('{15,16,17,18,19,20}'::integer[]))                                                      |
Planning Time: 0.137 ms                                                                                                                                 |
Execution Time: 139.209 ms
```
Создаем дополнительный индекс:
```CREATE INDEX idx_material_type_color ON warehouse.material USING btree (material_type_id, material_color_id)```

```
QUERY PLAN                                                                                                                                                 |
-----------------------------------------------------------------------------------------------------------------------------------------------------------+
Aggregate  (cost=6704.53..6704.55 rows=1 width=8) (actual time=60.021..60.023 rows=1 loops=1)                                                              |
  ->  Index Only Scan using idx_material_type_color on material m  (cost=0.43..6059.97 rows=257826 width=0) (actual time=0.019..34.638 rows=259200 loops=1)|
        Index Cond: ((material_type_id = ANY ('{38,39,40,41,42,43}'::integer[])) AND (material_color_id = ANY ('{15,16,17,18,19,20}'::integer[])))         |
        Heap Fetches: 0                                                                                                                                    |
Planning Time: 0.196 ms                                                                                                                                    |
Execution Time: 60.041 ms
```

6. Написать комментарии к каждому из индексов
7. Описать что и как делали и с какими проблемами столкнулись

Столкнулась со сложностью придумывания самих запросов (приближенных к реальным условиям), а также к эффективному применению индексов. 
Возможно, проще было бы использовать уже готовую БД с более разнообразными данными (чтобы сымитировать долгие запросы). 
При заполнении своей БД также возникли сложность с генерацией данных и обеспечением их разнообразия.
Не удалось добиться снижения стоимость (cost) запроса на порядки, только в несколько раз. Возможно, в реальности это не очень эффективный результат.
