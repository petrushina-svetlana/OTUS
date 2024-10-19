## Домашнее задание к занятию "2.Компоненты современной СУБД"

Дамп БД прилагаю (дамп снят в формате custom)

[sewing_prod_idx.dump](sewing_prod_idx.dump)

1. ### Создаем дополнительные индексы в БД.

1.1. Делаем индексы для таблицы материалов warehouse.material.

Предполагаю, что отбор материалов будет производится для планирования расходов на пошив изделий и учета кол-ва материалов на складе.

Для этого будем джойнить данные из таблиц: 
warehouse.material (основная таблица материалов), warehouse.balance (здесь берем кол-во материала на складе), main.lu (здесь берем характеристика материала: тип, цвет, страна-производитель....)

```
CREATE INDEX fk_10 ON warehouse.balance USING btree (material_id);
CREATE INDEX idx_balance_amount ON warehouse.balance USING btree (amount);

CREATE INDEX idx_lu_text ON main.lu (text);

CREATE INDEX idx_material_amount ON warehouse.material (material_type_id, material_color_id, country_manufacturer_id);
CREATE INDEX fk_3 ON warehouse.material USING btree (material_category_id);
CREATE INDEX fk_3_1 ON warehouse.material USING btree (country_manufacturer_id);
CREATE INDEX fk_5 ON warehouse.material USING btree (unit_id);
CREATE INDEX fk_4_1 ON warehouse.material USING btree (material_color_id);
```

!!! Индексы с названиями типа fk_3 у меня создались из автоматических скриптов сервиса sqldbm.com, поэтому они имеют отличное название, не стала переименовывать.

1.2. Делаем индексы для таблиц заказов selling.order_info и selling.order_detail.

Предполагаю, что регулярно будет производится отбор заказов по различным статусам и датам (диапазонам дат) для просмотра состояния текущих заказов и сбора статистики.

Индексы добавляю на внешние ключи и различные даты, на статусы не добавляю, т к там низкая селективность данных.

```
CREATE INDEX fk_15 ON selling.order_info USING btree (online_platform_id);
CREATE INDEX fk_16 ON selling.order_info USING btree (customer_id);
CREATE INDEX idx_order_info_create_date ON selling.order_info USING btree (((create_date)::date));
CREATE INDEX idx_order_info_cancel_date ON selling.order_info USING btree (((cancel_date)::date));
CREATE INDEX idx_order_info_finish_date ON selling.order_info USING btree (((finish_date)::date));
CREATE INDEX idx_order_info_ok_date ON selling.order_info USING btree (((ok_date)::date));
CREATE INDEX idx_order_info_send_date ON selling.order_info USING btree (((send_date)::date));

CREATE INDEX fk_17 ON selling.order_detail USING btree (product_for_sale_id);
CREATE INDEX fk_18 ON selling.order_detail USING btree (order_info_id);
CREATE INDEX fk_18_1 ON selling.order_detail USING btree (price_for_sale_id);
```

1.3. Делаем индексы для таблицы изделий main.product.

Предполагаю, что отбор изделий будет производится по моделям, цветам, размерам и проч.

Для этого будем джойнить данные из таблиц: 
main.product (основная таблица изделий), main.model (здесь берем данные о группе изделия, коллекции, сезоне), main.model_size (размерная сетка) и main.model_color (и варианты цветовых исполнений), main.lu (здесь берем значения справочников по id-ам)

```
CREATE INDEX fk_18 ON main.product USING btree (model_color_id);
CREATE INDEX fk_18_1 ON main.product USING btree (model_id);
CREATE INDEX fk_19 ON main.product USING btree (model_size_id);

CREATE INDEX fk_5 ON main.model USING btree (group_id);
CREATE INDEX fk_6 ON main.model USING btree (collection_id);
CREATE INDEX fk_7 ON main.model USING btree (season_id);

CREATE INDEX fk_8 ON main.model_color USING btree (model_id)
CREATE INDEX fk_9 ON main.model_color USING btree (m_color_id);

CREATE INDEX fk_11 ON main.model_size USING btree (model_id);
CREATE INDEX fk_12 ON main.model_size USING btree (size_id);
```

2. ### Ограничения в БД.
2.1. Делаем по-умолчанию статус активаности = true для всех таблиц, где присутствует поле.

```
ALTER TABLE warehouse.vendor ALTER COLUMN active SET DEFAULT true;
ALTER TABLE warehouse.material ALTER COLUMN active SET DEFAULT true;
ALTER TABLE main.man ALTER COLUMN active SET DEFAULT true;
ALTER TABLE main.rights ALTER COLUMN active SET DEFAULT true;
ALTER TABLE main.model ALTER COLUMN active SET DEFAULT true;
ALTER TABLE main.product ALTER COLUMN active SET DEFAULT true;
ALTER TABLE prod_warehouse.product_for_sale ALTER COLUMN active SET DEFAULT true;
ALTER TABLE selling.price_list ALTER COLUMN active SET DEFAULT true;
ALTER TABLE selling.discount ALTER COLUMN active SET DEFAULT true;
ALTER TABLE selling.online_platform ALTER COLUMN active SET DEFAULT true;
```

2.2. Делаем по-умолчанию для всех таблиц create_date = now().

```
ALTER TABLE warehouse.vendor ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE main.man ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE main.rights ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE main.man_rights ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE warehouse.vendor_phone ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE main.lu ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE warehouse.material ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE warehouse.income ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE warehouse.balance ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE warehouse.expense ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE main.design ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE main.model ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE main.product ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE main.model_content ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE main.model_color ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE main.model_size ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE main.model_content_amount ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE main.model_material ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE prod_warehouse.income ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE prod_warehouse.product_for_sale ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE selling.price_list ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE selling.price_for_sale ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE selling.customer ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE selling.customer_phone ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE selling.discount ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE selling.online_platform ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE selling.order_detail ALTER COLUMN create_date SET DEFAULT now();
ALTER TABLE selling.order_info ALTER COLUMN create_date SET DEFAULT now();
```

2.3. Делаем по-умолчанию для таблицы rights поле type = 1 (тип права = разрешение).
```
ALTER TABLE main.rights ALTER COLUMN type SET DEFAULT 1;
```

2.4. Делаем по-умолчанию для таблицы product_for_sale поле make_to_order = 0 (изготавливается на заказ = нет).

```
ALTER TABLE prod_warehouse.product_for_sale ALTER COLUMN make_to_order SET DEFAULT 0;
```

2.5. Ограничение для различных таблиц (приход, баланс, расход и проч) на колонки кол-во, цена (делаем > 0, там, где доступно нулевое значение >=0):

```
ALTER TABLE warehouse.income ADD CONSTRAINT income_amount_check CHECK ((amount > 0));
ALTER TABLE warehouse.income ADD CONSTRAINT income_price_check CHECK ((price > 0));
ALTER TABLE warehouse.balance ADD CONSTRAINT balance_amount_check CHECK ((amount >= 0));
ALTER TABLE warehouse.expense ADD CONSTRAINT expense_amount_check CHECK ((amount > 0));
ALTER TABLE main.model_content_amount ADD CONSTRAINT model_content_amount_amount_check CHECK ((amount >= 0));
ALTER TABLE main.product ADD CONSTRAINT product_material_price_check CHECK ((material_price > 0));
ALTER TABLE prod_warehouse.income ADD CONSTRAINT income_amount_check CHECK ((amount > 0));
ALTER TABLE prod_warehouse.product_for_sale ADD CONSTRAINT product_for_sale_amount_check CHECK ((amount >= 0));
ALTER TABLE selling.discount ADD CONSTRAINT discount_disc_amount_check CHECK ((disc_amount >= 0));
ALTER TABLE selling.price_list ADD CONSTRAINT price_list_mid_material_price_check CHECK ((mid_material_price > 0));
ALTER TABLE selling.price_list ADD CONSTRAINT price_list_extra_price_check CHECK ((extra_price > 0));
ALTER TABLE selling.price_list ADD CONSTRAINT price_list_retail_price_check CHECK ((retail_price > 0));
```

2.6. Ограничение для таблицы man на уникальность логина пользователя:

```
ALTER TABLE main.man ADD CONSTRAINT unique_login UNIQUE (login);
```

2.7. Делаем по-умолчанию для таблицы order_info поле status = N.

```
ALTER TABLE selling.order_info ALTER COLUMN status SET DEFAULT 'N';
```

2.8. Делаем по-умолчанию для таблицы order_detail поле amount = 1.

```
ALTER TABLE selling.order_detail ALTER COLUMN amount SET DEFAULT 1;
```

2.9. Делаем по-умолчанию для таблицы discount поле disc_type = 1 (тип = скидка).

```
ALTER TABLE selling.discount ALTER COLUMN disc_type SET DEFAULT 0;
```