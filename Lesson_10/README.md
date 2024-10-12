## Домашнее задание к занятию "10. DML: вставка, обновление, удаление, выборка данных в PostgreSQL"

Дамп БД прилагаю (дамп снят в формате custom)
[sewing_prod.dump](sewing_prod.dump)


1. Напишите запрос по своей базе с регулярным выражением, добавьте пояснение, что вы хотите найти.

Отбираю на складе материалов (warehouse.material) все ткани типа футер синего цвета:
 
```
    select m.code, m.name, l1.text, l2.text, b.amount, l3.shorttext 
      from warehouse.material m
          join warehouse.balance b 
              on m.id = b.material_id 
          join main.lu l1 -- тип материала
              on m.material_type_id = l1.id
          join main.lu l2 -- цвет материала
              on m.material_color_id = l2.id
          join main.lu l3 -- ед.измерения
              on m.unit_id = l3.id
     where b.amount > 0
       and l1.tag = 8
       and l1.text ilike 'футер%'
       and l2.tag = 2
       and l2.text ilike 'син%'
       and l3.tag = 3
```

2. Напишите запрос по своей базе с использованием LEFT JOIN и INNER JOIN, как порядок соединений в FROM влияет на результат? Почему?

Отбираю на складе материалов все материалы и отображаю кол-во по ним (или NULL, если материал не поступал на склад):

```
     select m.code, m.name, b.lot_number, b.amount 
       from warehouse.material m
           left join warehouse.balance b 
                    on m.id = b.material_id
      order by b.amount desc
```

Отбираю все материалы и отображаю те, которые поступали на склад (есть положительный или нулевой баланс):

```
     select m.code, m.name, b.lot_number, b.amount 
       from warehouse.material m
           join warehouse.balance b 
                    on m.id = b.material_id
      order by b.amount desc
```

LEFT JOIN - данные из первой таблицы берутся полностью, данные из второй (и последующих) - только при наличии связи с первой таблицей и удовлетворении условий отбора,
INNER JOIN - порядок соединений после FROM не важен, т.к. отбираются данные только при наличии связей в обеих таблицах и удовлетворении условий отбора.

3. Напишите запрос на добавление данных с выводом информации о добавленных строках.

Добавляю строки в таблицу warehouse.income:

```
insert into warehouse.income (material_id, lot_number, vendor_id, amount, price, create_by)
		              values (1, '240828_22035', 1, 1.5, 750, 1),
		                     (2, '240828_22035', 1, 1.5, 750, 1),
		                     (3, '240828_22035', 1, 1.5, 750, 1),
		                     (5, '240828_22035', 1, 1.5, 750, 1),
		                     (6, '240828_22035', 1, 1.5, 750, 1),
		                     (7, '240828_22035', 1, 1.5, 750, 1),
		                     (8, '240828_22035', 1, 1.5, 750, 1),
		                     (9, '240828_22035', 1, 1.5, 750, 1),
		                     (10, '240828_22035', 1, 1.5, 750, 1),
		                     (12, '240828_22035', 1, 1.5, 750, 1),
		                     (13, '240828_22035', 1, 1.5, 750, 1),
		                     (14, '240828_22035', 1, 1.5, 750, 1)
returning *;
```

4. Напишите запрос с обновлением данные используя UPDATE FROM.

Обновляю (пересчитываю) кол-во материала в таблице balance, после выполнения insert'а в таблицу expense:

```
insert into warehouse.expense (material_id, lot_number, amount, create_by)
                       values (3, '240828_22035', 0.25, 1)
```

```
update warehouse.balance b
   set amount = (b.amount - e.amount)
  from warehouse.expense e
 where b.material_id = e.material_id
   and b.lot_number = e.lot_number
```
   
5. Напишите запрос для удаления данных с оператором DELETE используя join с другой таблицей с помощью using.

Удаляем все телефоны поставщика с именем like 'Queen%':

```
       delete from warehouse.vendor_phone vp
             USING warehouse.vendor v
             where vp.vendor_id = v.id
               and v.name like 'Queen%'
```
         
6. Задание со *: Приведите пример использования утилиты COPY

Использую утилиту COPY для копирования данных в БД из файла:

[Materials_sewinglove.csv](Materials_sewinglove.csv)

```
 \COPY warehouse.material FROM '/tmp/Materials_sewinglove.csv' CSV HEADER DELIMITER ';'
```