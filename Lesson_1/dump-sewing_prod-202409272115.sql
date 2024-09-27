--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Ubuntu 16.4-1.pgdg24.04+1)
-- Dumped by pg_dump version 16.2

-- Started on 2024-09-27 21:15:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3778 (class 1262 OID 24695)
-- Name: sewing_prod; Type: DATABASE; Schema: -; Owner: sewing_admin
--

CREATE DATABASE sewing_prod WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru_RU.UTF-8';


ALTER DATABASE sewing_prod OWNER TO sewing_admin;

\connect sewing_prod

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 24696)
-- Name: main; Type: SCHEMA; Schema: -; Owner: sewing_admin
--

CREATE SCHEMA main;


ALTER SCHEMA main OWNER TO sewing_admin;

--
-- TOC entry 7 (class 2615 OID 24697)
-- Name: prod_warehouse; Type: SCHEMA; Schema: -; Owner: sewing_admin
--

CREATE SCHEMA prod_warehouse;


ALTER SCHEMA prod_warehouse OWNER TO sewing_admin;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3779 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 8 (class 2615 OID 24698)
-- Name: selling; Type: SCHEMA; Schema: -; Owner: sewing_admin
--

CREATE SCHEMA selling;


ALTER SCHEMA selling OWNER TO sewing_admin;

--
-- TOC entry 9 (class 2615 OID 24699)
-- Name: warehouse; Type: SCHEMA; Schema: -; Owner: sewing_admin
--

CREATE SCHEMA warehouse;


ALTER SCHEMA warehouse OWNER TO sewing_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 24719)
-- Name: design; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.design (
    id integer NOT NULL,
    code character varying(24) NOT NULL,
    name character varying(255) NOT NULL,
    type_id integer NOT NULL,
    design_img character varying(255),
    note character varying(2000),
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE main.design OWNER TO postgres;

--
-- TOC entry 3780 (class 0 OID 0)
-- Dependencies: 222
-- Name: TABLE design; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON TABLE main.design IS 'Выкройка';


--
-- TOC entry 3781 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN design.type_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.design.type_id IS 'Тип выкройки (юбка, брюки, кофта и т д)
(lu.id, tag=5)';


--
-- TOC entry 3782 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN design.design_img; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.design.design_img IS 'Путь к файлу выкройи';


--
-- TOC entry 3783 (class 0 OID 0)
-- Dependencies: 222
-- Name: COLUMN design.note; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.design.note IS 'Описание раскроя и пошива';


--
-- TOC entry 221 (class 1259 OID 24718)
-- Name: design_id_seq; Type: SEQUENCE; Schema: main; Owner: postgres
--

CREATE SEQUENCE main.design_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main.design_id_seq OWNER TO postgres;

--
-- TOC entry 3784 (class 0 OID 0)
-- Dependencies: 221
-- Name: design_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: postgres
--

ALTER SEQUENCE main.design_id_seq OWNED BY main.design.id;


--
-- TOC entry 220 (class 1259 OID 24710)
-- Name: lu; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.lu (
    id integer NOT NULL,
    num integer NOT NULL,
    text character varying(255) NOT NULL,
    shorttext character varying(100) NOT NULL,
    note character varying(2000),
    tag integer NOT NULL,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE main.lu OWNER TO postgres;

--
-- TOC entry 3785 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE lu; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON TABLE main.lu IS 'Простые справочники';


--
-- TOC entry 3786 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN lu.num; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.lu.num IS 'Порядковый номер';


--
-- TOC entry 3787 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN lu.text; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.lu.text IS 'Название';


--
-- TOC entry 3788 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN lu.shorttext; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.lu.shorttext IS 'Короткое название';


--
-- TOC entry 3789 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN lu.tag; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.lu.tag IS 'tag=0 - группы, tag>0 - подзаписи';


--
-- TOC entry 219 (class 1259 OID 24709)
-- Name: lu_id_seq; Type: SEQUENCE; Schema: main; Owner: postgres
--

CREATE SEQUENCE main.lu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main.lu_id_seq OWNER TO postgres;

--
-- TOC entry 3790 (class 0 OID 0)
-- Dependencies: 219
-- Name: lu_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: postgres
--

ALTER SEQUENCE main.lu_id_seq OWNED BY main.lu.id;


--
-- TOC entry 224 (class 1259 OID 24734)
-- Name: man; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.man (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    login character varying(24) NOT NULL,
    password character varying(24) NOT NULL,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE main.man OWNER TO postgres;

--
-- TOC entry 3791 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE man; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON TABLE main.man IS 'Пользователи';


--
-- TOC entry 3792 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN man.name; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.man.name IS 'ФИО пользователя';


--
-- TOC entry 3793 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN man.login; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.man.login IS 'Логин';


--
-- TOC entry 3794 (class 0 OID 0)
-- Dependencies: 224
-- Name: COLUMN man.password; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.man.password IS 'Пароль';


--
-- TOC entry 223 (class 1259 OID 24733)
-- Name: man_id_seq; Type: SEQUENCE; Schema: main; Owner: postgres
--

CREATE SEQUENCE main.man_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main.man_id_seq OWNER TO postgres;

--
-- TOC entry 3795 (class 0 OID 0)
-- Dependencies: 223
-- Name: man_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: postgres
--

ALTER SEQUENCE main.man_id_seq OWNED BY main.man.id;


--
-- TOC entry 228 (class 1259 OID 24767)
-- Name: man_rights; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.man_rights (
    id integer NOT NULL,
    man_id integer NOT NULL,
    right_id integer NOT NULL,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE main.man_rights OWNER TO postgres;

--
-- TOC entry 3796 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE man_rights; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON TABLE main.man_rights IS 'Права пользователей';


--
-- TOC entry 3797 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN man_rights.man_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.man_rights.man_id IS 'Пользователь';


--
-- TOC entry 3798 (class 0 OID 0)
-- Dependencies: 228
-- Name: COLUMN man_rights.right_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.man_rights.right_id IS 'Право';


--
-- TOC entry 227 (class 1259 OID 24766)
-- Name: man_rights_id_seq; Type: SEQUENCE; Schema: main; Owner: postgres
--

CREATE SEQUENCE main.man_rights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main.man_rights_id_seq OWNER TO postgres;

--
-- TOC entry 3799 (class 0 OID 0)
-- Dependencies: 227
-- Name: man_rights_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: postgres
--

ALTER SEQUENCE main.man_rights_id_seq OWNED BY main.man_rights.id;


--
-- TOC entry 230 (class 1259 OID 24815)
-- Name: model; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.model (
    id integer NOT NULL,
    code character varying(24) NOT NULL,
    name character varying(255) NOT NULL,
    design_id integer NOT NULL,
    group_id integer NOT NULL,
    collection_id integer NOT NULL,
    season_id integer NOT NULL,
    model_img character varying(255),
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE main.model OWNER TO postgres;

--
-- TOC entry 3800 (class 0 OID 0)
-- Dependencies: 230
-- Name: TABLE model; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON TABLE main.model IS 'Модель';


--
-- TOC entry 3801 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN model.design_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model.design_id IS 'Выкройка';


--
-- TOC entry 3802 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN model.group_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model.group_id IS 'Группа (произвольное обединение)
(lu.id, tag=6)';


--
-- TOC entry 3803 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN model.collection_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model.collection_id IS 'Коллекция
(lu.id, tag=9)';


--
-- TOC entry 3804 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN model.season_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model.season_id IS 'Сезон
(lu.id, tag=10)';


--
-- TOC entry 3805 (class 0 OID 0)
-- Dependencies: 230
-- Name: COLUMN model.model_img; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model.model_img IS 'Путь к файлу модели';


--
-- TOC entry 232 (class 1259 OID 24865)
-- Name: model_color; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.model_color (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    model_id integer NOT NULL,
    m_color_id integer NOT NULL,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE main.model_color OWNER TO postgres;

--
-- TOC entry 3806 (class 0 OID 0)
-- Dependencies: 232
-- Name: TABLE model_color; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON TABLE main.model_color IS 'Модель по цветам';


--
-- TOC entry 3807 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN model_color.model_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model_color.model_id IS 'Модель';


--
-- TOC entry 3808 (class 0 OID 0)
-- Dependencies: 232
-- Name: COLUMN model_color.m_color_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model_color.m_color_id IS 'Цвет модели
(lu.id, tag=1)';


--
-- TOC entry 231 (class 1259 OID 24864)
-- Name: model_color_id_seq; Type: SEQUENCE; Schema: main; Owner: postgres
--

CREATE SEQUENCE main.model_color_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main.model_color_id_seq OWNER TO postgres;

--
-- TOC entry 3809 (class 0 OID 0)
-- Dependencies: 231
-- Name: model_color_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: postgres
--

ALTER SEQUENCE main.model_color_id_seq OWNED BY main.model_color.id;


--
-- TOC entry 234 (class 1259 OID 24884)
-- Name: model_content; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.model_content (
    id integer NOT NULL,
    model_id integer NOT NULL,
    num integer NOT NULL,
    name character varying(255) NOT NULL,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE main.model_content OWNER TO postgres;

--
-- TOC entry 3810 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE model_content; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON TABLE main.model_content IS 'Составные части модели для расчета расхода материалов (основной материал, доп материал, фурнитура и т п)';


--
-- TOC entry 3811 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN model_content.model_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model_content.model_id IS 'Модель';


--
-- TOC entry 3812 (class 0 OID 0)
-- Dependencies: 234
-- Name: COLUMN model_content.num; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model_content.num IS 'Порядковый номер';


--
-- TOC entry 238 (class 1259 OID 24928)
-- Name: model_content_amount; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.model_content_amount (
    id integer NOT NULL,
    model_size_id integer NOT NULL,
    model_content_id integer NOT NULL,
    amount integer NOT NULL,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE main.model_content_amount OWNER TO postgres;

--
-- TOC entry 3813 (class 0 OID 0)
-- Dependencies: 238
-- Name: TABLE model_content_amount; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON TABLE main.model_content_amount IS 'Составные части модели по размерам для расчета расхода материалов (основной материал, доп материал, фурнитура и т п) с указанием кол-ва';


--
-- TOC entry 3814 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN model_content_amount.model_size_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model_content_amount.model_size_id IS 'Модель по размерам';


--
-- TOC entry 3815 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN model_content_amount.model_content_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model_content_amount.model_content_id IS 'Составные части модели';


--
-- TOC entry 3816 (class 0 OID 0)
-- Dependencies: 238
-- Name: COLUMN model_content_amount.amount; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model_content_amount.amount IS 'Кол-во расходуемого материала';


--
-- TOC entry 237 (class 1259 OID 24927)
-- Name: model_content_amount_id_seq; Type: SEQUENCE; Schema: main; Owner: postgres
--

CREATE SEQUENCE main.model_content_amount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main.model_content_amount_id_seq OWNER TO postgres;

--
-- TOC entry 3817 (class 0 OID 0)
-- Dependencies: 237
-- Name: model_content_amount_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: postgres
--

ALTER SEQUENCE main.model_content_amount_id_seq OWNED BY main.model_content_amount.id;


--
-- TOC entry 233 (class 1259 OID 24883)
-- Name: model_content_id_seq; Type: SEQUENCE; Schema: main; Owner: postgres
--

CREATE SEQUENCE main.model_content_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main.model_content_id_seq OWNER TO postgres;

--
-- TOC entry 3818 (class 0 OID 0)
-- Dependencies: 233
-- Name: model_content_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: postgres
--

ALTER SEQUENCE main.model_content_id_seq OWNED BY main.model_content.id;


--
-- TOC entry 229 (class 1259 OID 24814)
-- Name: model_id_seq; Type: SEQUENCE; Schema: main; Owner: postgres
--

CREATE SEQUENCE main.model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main.model_id_seq OWNER TO postgres;

--
-- TOC entry 3819 (class 0 OID 0)
-- Dependencies: 229
-- Name: model_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: postgres
--

ALTER SEQUENCE main.model_id_seq OWNED BY main.model.id;


--
-- TOC entry 252 (class 1259 OID 25074)
-- Name: model_material; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.model_material (
    id integer NOT NULL,
    model_color_id integer NOT NULL,
    model_content_id integer NOT NULL,
    material_id integer NOT NULL,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE main.model_material OWNER TO postgres;

--
-- TOC entry 3820 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE model_material; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON TABLE main.model_material IS 'Материалы для изготовления модели определенного цвета';


--
-- TOC entry 3821 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN model_material.model_color_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model_material.model_color_id IS 'Модель по цветам';


--
-- TOC entry 3822 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN model_material.model_content_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model_material.model_content_id IS 'Составные части модели';


--
-- TOC entry 3823 (class 0 OID 0)
-- Dependencies: 252
-- Name: COLUMN model_material.material_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model_material.material_id IS 'Материал';


--
-- TOC entry 251 (class 1259 OID 25073)
-- Name: model_material_id_seq; Type: SEQUENCE; Schema: main; Owner: postgres
--

CREATE SEQUENCE main.model_material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main.model_material_id_seq OWNER TO postgres;

--
-- TOC entry 3824 (class 0 OID 0)
-- Dependencies: 251
-- Name: model_material_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: postgres
--

ALTER SEQUENCE main.model_material_id_seq OWNED BY main.model_material.id;


--
-- TOC entry 236 (class 1259 OID 24909)
-- Name: model_size; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.model_size (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    model_id integer NOT NULL,
    size_id integer NOT NULL,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE main.model_size OWNER TO postgres;

--
-- TOC entry 3825 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE model_size; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON TABLE main.model_size IS 'Модель по размерам';


--
-- TOC entry 3826 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN model_size.model_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model_size.model_id IS 'Модель';


--
-- TOC entry 3827 (class 0 OID 0)
-- Dependencies: 236
-- Name: COLUMN model_size.size_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.model_size.size_id IS 'Размер модели
(lu.id, tag=4)';


--
-- TOC entry 235 (class 1259 OID 24908)
-- Name: model_size_id_seq; Type: SEQUENCE; Schema: main; Owner: postgres
--

CREATE SEQUENCE main.model_size_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main.model_size_id_seq OWNER TO postgres;

--
-- TOC entry 3828 (class 0 OID 0)
-- Dependencies: 235
-- Name: model_size_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: postgres
--

ALTER SEQUENCE main.model_size_id_seq OWNED BY main.model_size.id;


--
-- TOC entry 254 (class 1259 OID 25099)
-- Name: product; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.product (
    id integer NOT NULL,
    code character varying(24) NOT NULL,
    name character varying(255) NOT NULL,
    model_id integer NOT NULL,
    model_color_id integer NOT NULL,
    model_size_id integer NOT NULL,
    material_price character varying(24) NOT NULL,
    note character varying(2000),
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE main.product OWNER TO postgres;

--
-- TOC entry 3829 (class 0 OID 0)
-- Dependencies: 254
-- Name: TABLE product; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON TABLE main.product IS 'Изделие (модель+цвет+размер)';


--
-- TOC entry 3830 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN product.model_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.product.model_id IS 'Модель';


--
-- TOC entry 3831 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN product.model_color_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.product.model_color_id IS 'Цвет изделия';


--
-- TOC entry 3832 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN product.model_size_id; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.product.model_size_id IS 'Размер изделия';


--
-- TOC entry 3833 (class 0 OID 0)
-- Dependencies: 254
-- Name: COLUMN product.material_price; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.product.material_price IS 'Стоимость материалов 
(рассчитывается из кол-ва материалов, идущих на изготовление изделия)';


--
-- TOC entry 253 (class 1259 OID 25098)
-- Name: product_id_seq; Type: SEQUENCE; Schema: main; Owner: postgres
--

CREATE SEQUENCE main.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main.product_id_seq OWNER TO postgres;

--
-- TOC entry 3834 (class 0 OID 0)
-- Dependencies: 253
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: postgres
--

ALTER SEQUENCE main.product_id_seq OWNED BY main.product.id;


--
-- TOC entry 226 (class 1259 OID 24741)
-- Name: rights; Type: TABLE; Schema: main; Owner: postgres
--

CREATE TABLE main.rights (
    id integer NOT NULL,
    code integer NOT NULL,
    text character varying(255) NOT NULL,
    type smallint NOT NULL,
    note character varying(2000),
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE main.rights OWNER TO postgres;

--
-- TOC entry 3835 (class 0 OID 0)
-- Dependencies: 226
-- Name: TABLE rights; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON TABLE main.rights IS 'Права';


--
-- TOC entry 3836 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN rights.code; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.rights.code IS 'Код';


--
-- TOC entry 3837 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN rights.text; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.rights.text IS 'Текст/формулировка';


--
-- TOC entry 3838 (class 0 OID 0)
-- Dependencies: 226
-- Name: COLUMN rights.type; Type: COMMENT; Schema: main; Owner: postgres
--

COMMENT ON COLUMN main.rights.type IS 'Тип:
0-запрет, 1-разрешение';


--
-- TOC entry 225 (class 1259 OID 24740)
-- Name: rights_id_seq; Type: SEQUENCE; Schema: main; Owner: postgres
--

CREATE SEQUENCE main.rights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE main.rights_id_seq OWNER TO postgres;

--
-- TOC entry 3839 (class 0 OID 0)
-- Dependencies: 225
-- Name: rights_id_seq; Type: SEQUENCE OWNED BY; Schema: main; Owner: postgres
--

ALTER SEQUENCE main.rights_id_seq OWNED BY main.rights.id;


--
-- TOC entry 258 (class 1259 OID 25151)
-- Name: income; Type: TABLE; Schema: prod_warehouse; Owner: postgres
--

CREATE TABLE prod_warehouse.income (
    id integer NOT NULL,
    product_id integer NOT NULL,
    amount integer NOT NULL,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE prod_warehouse.income OWNER TO postgres;

--
-- TOC entry 3840 (class 0 OID 0)
-- Dependencies: 258
-- Name: TABLE income; Type: COMMENT; Schema: prod_warehouse; Owner: postgres
--

COMMENT ON TABLE prod_warehouse.income IS 'Приход';


--
-- TOC entry 3841 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN income.product_id; Type: COMMENT; Schema: prod_warehouse; Owner: postgres
--

COMMENT ON COLUMN prod_warehouse.income.product_id IS 'Изделие';


--
-- TOC entry 3842 (class 0 OID 0)
-- Dependencies: 258
-- Name: COLUMN income.amount; Type: COMMENT; Schema: prod_warehouse; Owner: postgres
--

COMMENT ON COLUMN prod_warehouse.income.amount IS 'Кол-во';


--
-- TOC entry 257 (class 1259 OID 25150)
-- Name: income_id_seq; Type: SEQUENCE; Schema: prod_warehouse; Owner: postgres
--

CREATE SEQUENCE prod_warehouse.income_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE prod_warehouse.income_id_seq OWNER TO postgres;

--
-- TOC entry 3843 (class 0 OID 0)
-- Dependencies: 257
-- Name: income_id_seq; Type: SEQUENCE OWNED BY; Schema: prod_warehouse; Owner: postgres
--

ALTER SEQUENCE prod_warehouse.income_id_seq OWNED BY prod_warehouse.income.id;


--
-- TOC entry 256 (class 1259 OID 25126)
-- Name: product_for_sale; Type: TABLE; Schema: prod_warehouse; Owner: postgres
--

CREATE TABLE prod_warehouse.product_for_sale (
    id integer NOT NULL,
    product_id integer NOT NULL,
    amount integer NOT NULL,
    make_to_order smallint NOT NULL,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE prod_warehouse.product_for_sale OWNER TO postgres;

--
-- TOC entry 3844 (class 0 OID 0)
-- Dependencies: 256
-- Name: TABLE product_for_sale; Type: COMMENT; Schema: prod_warehouse; Owner: postgres
--

COMMENT ON TABLE prod_warehouse.product_for_sale IS 'Изделия на продажу';


--
-- TOC entry 3845 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN product_for_sale.product_id; Type: COMMENT; Schema: prod_warehouse; Owner: postgres
--

COMMENT ON COLUMN prod_warehouse.product_for_sale.product_id IS 'Изделие';


--
-- TOC entry 3846 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN product_for_sale.amount; Type: COMMENT; Schema: prod_warehouse; Owner: postgres
--

COMMENT ON COLUMN prod_warehouse.product_for_sale.amount IS 'Кол-во';


--
-- TOC entry 3847 (class 0 OID 0)
-- Dependencies: 256
-- Name: COLUMN product_for_sale.make_to_order; Type: COMMENT; Schema: prod_warehouse; Owner: postgres
--

COMMENT ON COLUMN prod_warehouse.product_for_sale.make_to_order IS 'Возможно изготовление на заказ:
0-нет, 1-да';


--
-- TOC entry 255 (class 1259 OID 25125)
-- Name: product_for_sale_id_seq; Type: SEQUENCE; Schema: prod_warehouse; Owner: postgres
--

CREATE SEQUENCE prod_warehouse.product_for_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE prod_warehouse.product_for_sale_id_seq OWNER TO postgres;

--
-- TOC entry 3848 (class 0 OID 0)
-- Dependencies: 255
-- Name: product_for_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: prod_warehouse; Owner: postgres
--

ALTER SEQUENCE prod_warehouse.product_for_sale_id_seq OWNED BY prod_warehouse.product_for_sale.id;


--
-- TOC entry 260 (class 1259 OID 25164)
-- Name: customer; Type: TABLE; Schema: selling; Owner: postgres
--

CREATE TABLE selling.customer (
    id integer NOT NULL,
    num bigint NOT NULL,
    name character varying(255) NOT NULL,
    category_id integer NOT NULL,
    country_id integer NOT NULL,
    city character varying(255) NOT NULL,
    address character varying(2000) NOT NULL,
    note character varying(2000),
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE selling.customer OWNER TO postgres;

--
-- TOC entry 3849 (class 0 OID 0)
-- Dependencies: 260
-- Name: TABLE customer; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON TABLE selling.customer IS 'Заказчик';


--
-- TOC entry 3850 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN customer.num; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.customer.num IS 'Порядковый номер';


--
-- TOC entry 3851 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN customer.category_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.customer.category_id IS 'Категория заказчика
(lu.id, tag=13)';


--
-- TOC entry 3852 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN customer.country_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.customer.country_id IS 'Страна заказчика
(lu.id, tag=12)';


--
-- TOC entry 3853 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN customer.city; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.customer.city IS 'Город заказчика';


--
-- TOC entry 3854 (class 0 OID 0)
-- Dependencies: 260
-- Name: COLUMN customer.address; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.customer.address IS 'Адрес доставки';


--
-- TOC entry 259 (class 1259 OID 25163)
-- Name: customer_id_seq; Type: SEQUENCE; Schema: selling; Owner: postgres
--

CREATE SEQUENCE selling.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE selling.customer_id_seq OWNER TO postgres;

--
-- TOC entry 3855 (class 0 OID 0)
-- Dependencies: 259
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: selling; Owner: postgres
--

ALTER SEQUENCE selling.customer_id_seq OWNED BY selling.customer.id;


--
-- TOC entry 262 (class 1259 OID 25185)
-- Name: customer_phone; Type: TABLE; Schema: selling; Owner: postgres
--

CREATE TABLE selling.customer_phone (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    phone character varying(64) NOT NULL,
    note character varying(2000),
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE selling.customer_phone OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 25184)
-- Name: customer_phone_id_seq; Type: SEQUENCE; Schema: selling; Owner: postgres
--

CREATE SEQUENCE selling.customer_phone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE selling.customer_phone_id_seq OWNER TO postgres;

--
-- TOC entry 3856 (class 0 OID 0)
-- Dependencies: 261
-- Name: customer_phone_id_seq; Type: SEQUENCE OWNED BY; Schema: selling; Owner: postgres
--

ALTER SEQUENCE selling.customer_phone_id_seq OWNED BY selling.customer_phone.id;


--
-- TOC entry 266 (class 1259 OID 25278)
-- Name: discount; Type: TABLE; Schema: selling; Owner: postgres
--

CREATE TABLE selling.discount (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    disc_amount integer NOT NULL,
    disc_type smallint NOT NULL,
    model_id integer,
    collection_id integer,
    season_id integer,
    model_color_id integer,
    model_size_id integer,
    product_id integer,
    online_platform_id integer,
    customer_category_id integer,
    begin_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE selling.discount OWNER TO postgres;

--
-- TOC entry 3857 (class 0 OID 0)
-- Dependencies: 266
-- Name: TABLE discount; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON TABLE selling.discount IS 'Скидка/надбавка';


--
-- TOC entry 3858 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN discount.disc_amount; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.discount.disc_amount IS 'Размер скидки';


--
-- TOC entry 3859 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN discount.disc_type; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.discount.disc_type IS 'Тип: 
0-скидка, 1-надбавка';


--
-- TOC entry 3860 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN discount.model_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.discount.model_id IS 'Модель';


--
-- TOC entry 3861 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN discount.collection_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.discount.collection_id IS 'Коллекция
(lu.id, tag=9)';


--
-- TOC entry 3862 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN discount.season_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.discount.season_id IS 'Сезон
(lu.id, tag=10)';


--
-- TOC entry 3863 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN discount.model_color_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.discount.model_color_id IS 'Модель по цветам';


--
-- TOC entry 3864 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN discount.model_size_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.discount.model_size_id IS 'Модель по размерам';


--
-- TOC entry 3865 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN discount.product_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.discount.product_id IS 'Изделие';


--
-- TOC entry 3866 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN discount.online_platform_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.discount.online_platform_id IS 'Онлайн платфрма';


--
-- TOC entry 3867 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN discount.customer_category_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.discount.customer_category_id IS 'Категория заказчика
(lu.id, tag=13)';


--
-- TOC entry 3868 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN discount.begin_date; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.discount.begin_date IS 'Дата начала действия';


--
-- TOC entry 3869 (class 0 OID 0)
-- Dependencies: 266
-- Name: COLUMN discount.end_date; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.discount.end_date IS 'Дата окончания действия';


--
-- TOC entry 265 (class 1259 OID 25277)
-- Name: discount_id_seq; Type: SEQUENCE; Schema: selling; Owner: postgres
--

CREATE SEQUENCE selling.discount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE selling.discount_id_seq OWNER TO postgres;

--
-- TOC entry 3870 (class 0 OID 0)
-- Dependencies: 265
-- Name: discount_id_seq; Type: SEQUENCE OWNED BY; Schema: selling; Owner: postgres
--

ALTER SEQUENCE selling.discount_id_seq OWNED BY selling.discount.id;


--
-- TOC entry 264 (class 1259 OID 25222)
-- Name: online_platform; Type: TABLE; Schema: selling; Owner: postgres
--

CREATE TABLE selling.online_platform (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    website character varying(1000),
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE selling.online_platform OWNER TO postgres;

--
-- TOC entry 3871 (class 0 OID 0)
-- Dependencies: 264
-- Name: TABLE online_platform; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON TABLE selling.online_platform IS 'Он-лайн платформа продаж';


--
-- TOC entry 263 (class 1259 OID 25221)
-- Name: online_platform_id_seq; Type: SEQUENCE; Schema: selling; Owner: postgres
--

CREATE SEQUENCE selling.online_platform_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE selling.online_platform_id_seq OWNER TO postgres;

--
-- TOC entry 3872 (class 0 OID 0)
-- Dependencies: 263
-- Name: online_platform_id_seq; Type: SEQUENCE OWNED BY; Schema: selling; Owner: postgres
--

ALTER SEQUENCE selling.online_platform_id_seq OWNED BY selling.online_platform.id;


--
-- TOC entry 274 (class 1259 OID 25454)
-- Name: order_detail; Type: TABLE; Schema: selling; Owner: postgres
--

CREATE TABLE selling.order_detail (
    id integer NOT NULL,
    order_info_id integer NOT NULL,
    product_for_sale_id integer NOT NULL,
    price_for_sale_id integer NOT NULL,
    amount integer NOT NULL
);


ALTER TABLE selling.order_detail OWNER TO postgres;

--
-- TOC entry 3873 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE order_detail; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON TABLE selling.order_detail IS 'Заказ (изделия)';


--
-- TOC entry 3874 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN order_detail.order_info_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.order_detail.order_info_id IS 'Заказ (общая информация)';


--
-- TOC entry 3875 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN order_detail.product_for_sale_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.order_detail.product_for_sale_id IS 'Изделие на продажу';


--
-- TOC entry 3876 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN order_detail.price_for_sale_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.order_detail.price_for_sale_id IS 'Цена по прайсу';


--
-- TOC entry 3877 (class 0 OID 0)
-- Dependencies: 274
-- Name: COLUMN order_detail.amount; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.order_detail.amount IS 'Кол-во';


--
-- TOC entry 273 (class 1259 OID 25453)
-- Name: order_detail_id_seq; Type: SEQUENCE; Schema: selling; Owner: postgres
--

CREATE SEQUENCE selling.order_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE selling.order_detail_id_seq OWNER TO postgres;

--
-- TOC entry 3878 (class 0 OID 0)
-- Dependencies: 273
-- Name: order_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: selling; Owner: postgres
--

ALTER SEQUENCE selling.order_detail_id_seq OWNED BY selling.order_detail.id;


--
-- TOC entry 272 (class 1259 OID 25411)
-- Name: order_info; Type: TABLE; Schema: selling; Owner: postgres
--

CREATE TABLE selling.order_info (
    id integer NOT NULL,
    online_platform_id integer NOT NULL,
    customer_id integer,
    status character varying(1) NOT NULL,
    ok_status smallint NOT NULL,
    ok_by integer NOT NULL,
    ok_date timestamp without time zone NOT NULL,
    send_status smallint NOT NULL,
    send_by integer NOT NULL,
    send_date timestamp without time zone NOT NULL,
    finish_status smallint NOT NULL,
    finish_by integer NOT NULL,
    finish_date timestamp without time zone NOT NULL,
    cancel_status smallint NOT NULL,
    cancel_by integer NOT NULL,
    cancel_date timestamp without time zone NOT NULL,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE selling.order_info OWNER TO postgres;

--
-- TOC entry 3879 (class 0 OID 0)
-- Dependencies: 272
-- Name: TABLE order_info; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON TABLE selling.order_info IS 'Заказ (общая информация)';


--
-- TOC entry 3880 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN order_info.online_platform_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.order_info.online_platform_id IS 'Онлайн платформа';


--
-- TOC entry 3881 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN order_info.customer_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.order_info.customer_id IS 'Заказчик';


--
-- TOC entry 3882 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN order_info.status; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.order_info.status IS 'Статус заказа:
N [new] - новый, готов к работе
R [ready] - готов, собран
S [sent] - отправлен
F [finished] - завершен 
X - отменен';


--
-- TOC entry 3883 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN order_info.ok_status; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.order_info.ok_status IS 'Заказ готов (собран): 0-нет, 1-да';


--
-- TOC entry 3884 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN order_info.send_status; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.order_info.send_status IS 'Заказ отправлен: 0-нет, 1-да';


--
-- TOC entry 3885 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN order_info.finish_status; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.order_info.finish_status IS 'Заказ завершен: 0-нет, 1-да';


--
-- TOC entry 3886 (class 0 OID 0)
-- Dependencies: 272
-- Name: COLUMN order_info.cancel_status; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.order_info.cancel_status IS 'Заказ отменен: 0-нет, 1-да';


--
-- TOC entry 271 (class 1259 OID 25410)
-- Name: order_info_id_seq; Type: SEQUENCE; Schema: selling; Owner: postgres
--

CREATE SEQUENCE selling.order_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE selling.order_info_id_seq OWNER TO postgres;

--
-- TOC entry 3887 (class 0 OID 0)
-- Dependencies: 271
-- Name: order_info_id_seq; Type: SEQUENCE OWNED BY; Schema: selling; Owner: postgres
--

ALTER SEQUENCE selling.order_info_id_seq OWNED BY selling.order_info.id;


--
-- TOC entry 270 (class 1259 OID 25375)
-- Name: price_for_sale; Type: TABLE; Schema: selling; Owner: postgres
--

CREATE TABLE selling.price_for_sale (
    id integer NOT NULL,
    price_list_id integer NOT NULL,
    discount_id integer,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE selling.price_for_sale OWNER TO postgres;

--
-- TOC entry 3888 (class 0 OID 0)
-- Dependencies: 270
-- Name: TABLE price_for_sale; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON TABLE selling.price_for_sale IS 'Цена изделия';


--
-- TOC entry 3889 (class 0 OID 0)
-- Dependencies: 270
-- Name: COLUMN price_for_sale.price_list_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.price_for_sale.price_list_id IS 'Цена по прайс листу';


--
-- TOC entry 3890 (class 0 OID 0)
-- Dependencies: 270
-- Name: COLUMN price_for_sale.discount_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.price_for_sale.discount_id IS 'Скидка/надбавка';


--
-- TOC entry 269 (class 1259 OID 25374)
-- Name: price_for_sale_id_seq; Type: SEQUENCE; Schema: selling; Owner: postgres
--

CREATE SEQUENCE selling.price_for_sale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE selling.price_for_sale_id_seq OWNER TO postgres;

--
-- TOC entry 3891 (class 0 OID 0)
-- Dependencies: 269
-- Name: price_for_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: selling; Owner: postgres
--

ALTER SEQUENCE selling.price_for_sale_id_seq OWNED BY selling.price_for_sale.id;


--
-- TOC entry 268 (class 1259 OID 25345)
-- Name: price_list; Type: TABLE; Schema: selling; Owner: postgres
--

CREATE TABLE selling.price_list (
    id integer NOT NULL,
    model_id integer NOT NULL,
    mid_material_price character varying(24) NOT NULL,
    extra_price character varying(24) NOT NULL,
    retail_price character varying(24) NOT NULL,
    begin_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE selling.price_list OWNER TO postgres;

--
-- TOC entry 3892 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE price_list; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON TABLE selling.price_list IS 'Прайс лист';


--
-- TOC entry 3893 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN price_list.model_id; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.price_list.model_id IS 'Модель';


--
-- TOC entry 3894 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN price_list.mid_material_price; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.price_list.mid_material_price IS 'Усредненная стоимость материалов, рассчитанная из стоимость материалов (material_price) для каждого изделия (product)';


--
-- TOC entry 3895 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN price_list.extra_price; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.price_list.extra_price IS 'Надбавка (из учета трудозатрат на изготовление изделия, доп. затрат и цен на рынке)';


--
-- TOC entry 3896 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN price_list.retail_price; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.price_list.retail_price IS 'Расчетная розничная цена (стоимость материалов + надбавка)';


--
-- TOC entry 3897 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN price_list.begin_date; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.price_list.begin_date IS 'Дата начала действия';


--
-- TOC entry 3898 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN price_list.end_date; Type: COMMENT; Schema: selling; Owner: postgres
--

COMMENT ON COLUMN selling.price_list.end_date IS 'Дата окончания действия';


--
-- TOC entry 267 (class 1259 OID 25344)
-- Name: price_list_id_seq; Type: SEQUENCE; Schema: selling; Owner: postgres
--

CREATE SEQUENCE selling.price_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE selling.price_list_id_seq OWNER TO postgres;

--
-- TOC entry 3899 (class 0 OID 0)
-- Dependencies: 267
-- Name: price_list_id_seq; Type: SEQUENCE OWNED BY; Schema: selling; Owner: postgres
--

ALTER SEQUENCE selling.price_list_id_seq OWNED BY selling.price_list.id;


--
-- TOC entry 250 (class 1259 OID 25061)
-- Name: balance; Type: TABLE; Schema: warehouse; Owner: postgres
--

CREATE TABLE warehouse.balance (
    id integer NOT NULL,
    material_id integer NOT NULL,
    lot_number character varying(50) NOT NULL,
    amount integer NOT NULL,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE warehouse.balance OWNER TO postgres;

--
-- TOC entry 3900 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE balance; Type: COMMENT; Schema: warehouse; Owner: postgres
--

COMMENT ON TABLE warehouse.balance IS 'Наличие';


--
-- TOC entry 3901 (class 0 OID 0)
-- Dependencies: 250
-- Name: COLUMN balance.amount; Type: COMMENT; Schema: warehouse; Owner: postgres
--

COMMENT ON COLUMN warehouse.balance.amount IS 'Кол-во';


--
-- TOC entry 249 (class 1259 OID 25060)
-- Name: balance_id_seq; Type: SEQUENCE; Schema: warehouse; Owner: postgres
--

CREATE SEQUENCE warehouse.balance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE warehouse.balance_id_seq OWNER TO postgres;

--
-- TOC entry 3902 (class 0 OID 0)
-- Dependencies: 249
-- Name: balance_id_seq; Type: SEQUENCE OWNED BY; Schema: warehouse; Owner: postgres
--

ALTER SEQUENCE warehouse.balance_id_seq OWNED BY warehouse.balance.id;


--
-- TOC entry 248 (class 1259 OID 25048)
-- Name: expense; Type: TABLE; Schema: warehouse; Owner: postgres
--

CREATE TABLE warehouse.expense (
    id integer NOT NULL,
    material_id integer NOT NULL,
    lot_number character varying(50) NOT NULL,
    amount integer NOT NULL,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE warehouse.expense OWNER TO postgres;

--
-- TOC entry 3903 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE expense; Type: COMMENT; Schema: warehouse; Owner: postgres
--

COMMENT ON TABLE warehouse.expense IS 'Расход';


--
-- TOC entry 3904 (class 0 OID 0)
-- Dependencies: 248
-- Name: COLUMN expense.amount; Type: COMMENT; Schema: warehouse; Owner: postgres
--

COMMENT ON COLUMN warehouse.expense.amount IS 'Кол-во';


--
-- TOC entry 247 (class 1259 OID 25047)
-- Name: expense_id_seq; Type: SEQUENCE; Schema: warehouse; Owner: postgres
--

CREATE SEQUENCE warehouse.expense_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE warehouse.expense_id_seq OWNER TO postgres;

--
-- TOC entry 3905 (class 0 OID 0)
-- Dependencies: 247
-- Name: expense_id_seq; Type: SEQUENCE OWNED BY; Schema: warehouse; Owner: postgres
--

ALTER SEQUENCE warehouse.expense_id_seq OWNED BY warehouse.expense.id;


--
-- TOC entry 246 (class 1259 OID 25029)
-- Name: income; Type: TABLE; Schema: warehouse; Owner: postgres
--

CREATE TABLE warehouse.income (
    id integer NOT NULL,
    material_id integer NOT NULL,
    lot_number character varying(50) NOT NULL,
    vendor_id integer NOT NULL,
    amount integer NOT NULL,
    price character varying(24) NOT NULL,
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE warehouse.income OWNER TO postgres;

--
-- TOC entry 3906 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE income; Type: COMMENT; Schema: warehouse; Owner: postgres
--

COMMENT ON TABLE warehouse.income IS 'Приход';


--
-- TOC entry 3907 (class 0 OID 0)
-- Dependencies: 246
-- Name: COLUMN income.amount; Type: COMMENT; Schema: warehouse; Owner: postgres
--

COMMENT ON COLUMN warehouse.income.amount IS 'Кол-во';


--
-- TOC entry 245 (class 1259 OID 25028)
-- Name: income_id_seq; Type: SEQUENCE; Schema: warehouse; Owner: postgres
--

CREATE SEQUENCE warehouse.income_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE warehouse.income_id_seq OWNER TO postgres;

--
-- TOC entry 3908 (class 0 OID 0)
-- Dependencies: 245
-- Name: income_id_seq; Type: SEQUENCE OWNED BY; Schema: warehouse; Owner: postgres
--

ALTER SEQUENCE warehouse.income_id_seq OWNED BY warehouse.income.id;


--
-- TOC entry 244 (class 1259 OID 24972)
-- Name: material; Type: TABLE; Schema: warehouse; Owner: postgres
--

CREATE TABLE warehouse.material (
    id integer NOT NULL,
    code character varying(24) NOT NULL,
    name character varying(255) NOT NULL,
    material_category_id integer NOT NULL,
    material_type_id integer NOT NULL,
    material_color_id integer NOT NULL,
    country_manufacturer_id integer NOT NULL,
    unit_id integer NOT NULL,
    specification character varying(255),
    note character varying(2000),
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE warehouse.material OWNER TO postgres;

--
-- TOC entry 3909 (class 0 OID 0)
-- Dependencies: 244
-- Name: TABLE material; Type: COMMENT; Schema: warehouse; Owner: postgres
--

COMMENT ON TABLE warehouse.material IS 'Материалы';


--
-- TOC entry 3910 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN material.material_category_id; Type: COMMENT; Schema: warehouse; Owner: postgres
--

COMMENT ON COLUMN warehouse.material.material_category_id IS 'Категория материала (ткань, фурнитура и т п)
(lu.id, tag=7)';


--
-- TOC entry 3911 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN material.material_type_id; Type: COMMENT; Schema: warehouse; Owner: postgres
--

COMMENT ON COLUMN warehouse.material.material_type_id IS 'Тип материала (футер, хлопок и т п)
(lu.id, tag=8)';


--
-- TOC entry 3912 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN material.material_color_id; Type: COMMENT; Schema: warehouse; Owner: postgres
--

COMMENT ON COLUMN warehouse.material.material_color_id IS 'Цвет материала
(lu.id, tag=2)';


--
-- TOC entry 3913 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN material.country_manufacturer_id; Type: COMMENT; Schema: warehouse; Owner: postgres
--

COMMENT ON COLUMN warehouse.material.country_manufacturer_id IS 'Страна-производитель
(lu.id, tag=11)';


--
-- TOC entry 3914 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN material.unit_id; Type: COMMENT; Schema: warehouse; Owner: postgres
--

COMMENT ON COLUMN warehouse.material.unit_id IS 'Ед. измерения
(lu.id, tag=3)';


--
-- TOC entry 3915 (class 0 OID 0)
-- Dependencies: 244
-- Name: COLUMN material.specification; Type: COMMENT; Schema: warehouse; Owner: postgres
--

COMMENT ON COLUMN warehouse.material.specification IS 'Характеристики';


--
-- TOC entry 243 (class 1259 OID 24971)
-- Name: material_id_seq; Type: SEQUENCE; Schema: warehouse; Owner: postgres
--

CREATE SEQUENCE warehouse.material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE warehouse.material_id_seq OWNER TO postgres;

--
-- TOC entry 3916 (class 0 OID 0)
-- Dependencies: 243
-- Name: material_id_seq; Type: SEQUENCE OWNED BY; Schema: warehouse; Owner: postgres
--

ALTER SEQUENCE warehouse.material_id_seq OWNED BY warehouse.material.id;


--
-- TOC entry 240 (class 1259 OID 24948)
-- Name: vendor; Type: TABLE; Schema: warehouse; Owner: postgres
--

CREATE TABLE warehouse.vendor (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    website character varying(1000),
    address character varying(1000),
    note character varying(2000),
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE warehouse.vendor OWNER TO postgres;

--
-- TOC entry 3917 (class 0 OID 0)
-- Dependencies: 240
-- Name: TABLE vendor; Type: COMMENT; Schema: warehouse; Owner: postgres
--

COMMENT ON TABLE warehouse.vendor IS 'Поставщик';


--
-- TOC entry 239 (class 1259 OID 24947)
-- Name: vendor_id_seq; Type: SEQUENCE; Schema: warehouse; Owner: postgres
--

CREATE SEQUENCE warehouse.vendor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE warehouse.vendor_id_seq OWNER TO postgres;

--
-- TOC entry 3918 (class 0 OID 0)
-- Dependencies: 239
-- Name: vendor_id_seq; Type: SEQUENCE OWNED BY; Schema: warehouse; Owner: postgres
--

ALTER SEQUENCE warehouse.vendor_id_seq OWNED BY warehouse.vendor.id;


--
-- TOC entry 242 (class 1259 OID 24957)
-- Name: vendor_phone; Type: TABLE; Schema: warehouse; Owner: postgres
--

CREATE TABLE warehouse.vendor_phone (
    id integer NOT NULL,
    vendor_id integer NOT NULL,
    phone character varying(64) NOT NULL,
    note character varying(2000),
    create_by integer NOT NULL,
    create_date timestamp without time zone NOT NULL
);


ALTER TABLE warehouse.vendor_phone OWNER TO postgres;

--
-- TOC entry 3919 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE vendor_phone; Type: COMMENT; Schema: warehouse; Owner: postgres
--

COMMENT ON TABLE warehouse.vendor_phone IS 'Телефоны поставщиков';


--
-- TOC entry 241 (class 1259 OID 24956)
-- Name: vendor_phone_id_seq; Type: SEQUENCE; Schema: warehouse; Owner: postgres
--

CREATE SEQUENCE warehouse.vendor_phone_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE warehouse.vendor_phone_id_seq OWNER TO postgres;

--
-- TOC entry 3920 (class 0 OID 0)
-- Dependencies: 241
-- Name: vendor_phone_id_seq; Type: SEQUENCE OWNED BY; Schema: warehouse; Owner: postgres
--

ALTER SEQUENCE warehouse.vendor_phone_id_seq OWNED BY warehouse.vendor_phone.id;


--
-- TOC entry 3389 (class 2604 OID 24722)
-- Name: design id; Type: DEFAULT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.design ALTER COLUMN id SET DEFAULT nextval('main.design_id_seq'::regclass);


--
-- TOC entry 3388 (class 2604 OID 24713)
-- Name: lu id; Type: DEFAULT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.lu ALTER COLUMN id SET DEFAULT nextval('main.lu_id_seq'::regclass);


--
-- TOC entry 3390 (class 2604 OID 24737)
-- Name: man id; Type: DEFAULT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.man ALTER COLUMN id SET DEFAULT nextval('main.man_id_seq'::regclass);


--
-- TOC entry 3392 (class 2604 OID 24770)
-- Name: man_rights id; Type: DEFAULT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.man_rights ALTER COLUMN id SET DEFAULT nextval('main.man_rights_id_seq'::regclass);


--
-- TOC entry 3393 (class 2604 OID 24818)
-- Name: model id; Type: DEFAULT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model ALTER COLUMN id SET DEFAULT nextval('main.model_id_seq'::regclass);


--
-- TOC entry 3394 (class 2604 OID 24868)
-- Name: model_color id; Type: DEFAULT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_color ALTER COLUMN id SET DEFAULT nextval('main.model_color_id_seq'::regclass);


--
-- TOC entry 3395 (class 2604 OID 24887)
-- Name: model_content id; Type: DEFAULT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_content ALTER COLUMN id SET DEFAULT nextval('main.model_content_id_seq'::regclass);


--
-- TOC entry 3397 (class 2604 OID 24931)
-- Name: model_content_amount id; Type: DEFAULT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_content_amount ALTER COLUMN id SET DEFAULT nextval('main.model_content_amount_id_seq'::regclass);


--
-- TOC entry 3404 (class 2604 OID 25077)
-- Name: model_material id; Type: DEFAULT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_material ALTER COLUMN id SET DEFAULT nextval('main.model_material_id_seq'::regclass);


--
-- TOC entry 3396 (class 2604 OID 24912)
-- Name: model_size id; Type: DEFAULT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_size ALTER COLUMN id SET DEFAULT nextval('main.model_size_id_seq'::regclass);


--
-- TOC entry 3405 (class 2604 OID 25102)
-- Name: product id; Type: DEFAULT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.product ALTER COLUMN id SET DEFAULT nextval('main.product_id_seq'::regclass);


--
-- TOC entry 3391 (class 2604 OID 24744)
-- Name: rights id; Type: DEFAULT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.rights ALTER COLUMN id SET DEFAULT nextval('main.rights_id_seq'::regclass);


--
-- TOC entry 3407 (class 2604 OID 25154)
-- Name: income id; Type: DEFAULT; Schema: prod_warehouse; Owner: postgres
--

ALTER TABLE ONLY prod_warehouse.income ALTER COLUMN id SET DEFAULT nextval('prod_warehouse.income_id_seq'::regclass);


--
-- TOC entry 3406 (class 2604 OID 25129)
-- Name: product_for_sale id; Type: DEFAULT; Schema: prod_warehouse; Owner: postgres
--

ALTER TABLE ONLY prod_warehouse.product_for_sale ALTER COLUMN id SET DEFAULT nextval('prod_warehouse.product_for_sale_id_seq'::regclass);


--
-- TOC entry 3408 (class 2604 OID 25167)
-- Name: customer id; Type: DEFAULT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.customer ALTER COLUMN id SET DEFAULT nextval('selling.customer_id_seq'::regclass);


--
-- TOC entry 3409 (class 2604 OID 25188)
-- Name: customer_phone id; Type: DEFAULT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.customer_phone ALTER COLUMN id SET DEFAULT nextval('selling.customer_phone_id_seq'::regclass);


--
-- TOC entry 3411 (class 2604 OID 25281)
-- Name: discount id; Type: DEFAULT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.discount ALTER COLUMN id SET DEFAULT nextval('selling.discount_id_seq'::regclass);


--
-- TOC entry 3410 (class 2604 OID 25225)
-- Name: online_platform id; Type: DEFAULT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.online_platform ALTER COLUMN id SET DEFAULT nextval('selling.online_platform_id_seq'::regclass);


--
-- TOC entry 3415 (class 2604 OID 25457)
-- Name: order_detail id; Type: DEFAULT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.order_detail ALTER COLUMN id SET DEFAULT nextval('selling.order_detail_id_seq'::regclass);


--
-- TOC entry 3414 (class 2604 OID 25414)
-- Name: order_info id; Type: DEFAULT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.order_info ALTER COLUMN id SET DEFAULT nextval('selling.order_info_id_seq'::regclass);


--
-- TOC entry 3413 (class 2604 OID 25378)
-- Name: price_for_sale id; Type: DEFAULT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.price_for_sale ALTER COLUMN id SET DEFAULT nextval('selling.price_for_sale_id_seq'::regclass);


--
-- TOC entry 3412 (class 2604 OID 25348)
-- Name: price_list id; Type: DEFAULT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.price_list ALTER COLUMN id SET DEFAULT nextval('selling.price_list_id_seq'::regclass);


--
-- TOC entry 3403 (class 2604 OID 25064)
-- Name: balance id; Type: DEFAULT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.balance ALTER COLUMN id SET DEFAULT nextval('warehouse.balance_id_seq'::regclass);


--
-- TOC entry 3402 (class 2604 OID 25051)
-- Name: expense id; Type: DEFAULT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.expense ALTER COLUMN id SET DEFAULT nextval('warehouse.expense_id_seq'::regclass);


--
-- TOC entry 3401 (class 2604 OID 25032)
-- Name: income id; Type: DEFAULT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.income ALTER COLUMN id SET DEFAULT nextval('warehouse.income_id_seq'::regclass);


--
-- TOC entry 3400 (class 2604 OID 24975)
-- Name: material id; Type: DEFAULT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.material ALTER COLUMN id SET DEFAULT nextval('warehouse.material_id_seq'::regclass);


--
-- TOC entry 3398 (class 2604 OID 24951)
-- Name: vendor id; Type: DEFAULT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.vendor ALTER COLUMN id SET DEFAULT nextval('warehouse.vendor_id_seq'::regclass);


--
-- TOC entry 3399 (class 2604 OID 24960)
-- Name: vendor_phone id; Type: DEFAULT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.vendor_phone ALTER COLUMN id SET DEFAULT nextval('warehouse.vendor_phone_id_seq'::regclass);


--
-- TOC entry 3720 (class 0 OID 24719)
-- Dependencies: 222
-- Data for Name: design; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.design (id, code, name, type_id, design_img, note, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3718 (class 0 OID 24710)
-- Dependencies: 220
-- Data for Name: lu; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.lu (id, num, text, shorttext, note, tag, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3722 (class 0 OID 24734)
-- Dependencies: 224
-- Data for Name: man; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.man (id, name, login, password, create_by, create_date, active) FROM stdin;
\.


--
-- TOC entry 3726 (class 0 OID 24767)
-- Dependencies: 228
-- Data for Name: man_rights; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.man_rights (id, man_id, right_id, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3728 (class 0 OID 24815)
-- Dependencies: 230
-- Data for Name: model; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.model (id, code, name, design_id, group_id, collection_id, season_id, model_img, create_by, create_date, active) FROM stdin;
\.


--
-- TOC entry 3730 (class 0 OID 24865)
-- Dependencies: 232
-- Data for Name: model_color; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.model_color (id, name, model_id, m_color_id, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3732 (class 0 OID 24884)
-- Dependencies: 234
-- Data for Name: model_content; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.model_content (id, model_id, num, name, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3736 (class 0 OID 24928)
-- Dependencies: 238
-- Data for Name: model_content_amount; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.model_content_amount (id, model_size_id, model_content_id, amount, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3750 (class 0 OID 25074)
-- Dependencies: 252
-- Data for Name: model_material; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.model_material (id, model_color_id, model_content_id, material_id, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3734 (class 0 OID 24909)
-- Dependencies: 236
-- Data for Name: model_size; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.model_size (id, name, model_id, size_id, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3752 (class 0 OID 25099)
-- Dependencies: 254
-- Data for Name: product; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.product (id, code, name, model_id, model_color_id, model_size_id, material_price, note, create_by, create_date, active) FROM stdin;
\.


--
-- TOC entry 3724 (class 0 OID 24741)
-- Dependencies: 226
-- Data for Name: rights; Type: TABLE DATA; Schema: main; Owner: postgres
--

COPY main.rights (id, code, text, type, note, create_by, create_date, active) FROM stdin;
\.


--
-- TOC entry 3756 (class 0 OID 25151)
-- Dependencies: 258
-- Data for Name: income; Type: TABLE DATA; Schema: prod_warehouse; Owner: postgres
--

COPY prod_warehouse.income (id, product_id, amount, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3754 (class 0 OID 25126)
-- Dependencies: 256
-- Data for Name: product_for_sale; Type: TABLE DATA; Schema: prod_warehouse; Owner: postgres
--

COPY prod_warehouse.product_for_sale (id, product_id, amount, make_to_order, create_by, create_date, active) FROM stdin;
\.


--
-- TOC entry 3758 (class 0 OID 25164)
-- Dependencies: 260
-- Data for Name: customer; Type: TABLE DATA; Schema: selling; Owner: postgres
--

COPY selling.customer (id, num, name, category_id, country_id, city, address, note, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3760 (class 0 OID 25185)
-- Dependencies: 262
-- Data for Name: customer_phone; Type: TABLE DATA; Schema: selling; Owner: postgres
--

COPY selling.customer_phone (id, customer_id, phone, note, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3764 (class 0 OID 25278)
-- Dependencies: 266
-- Data for Name: discount; Type: TABLE DATA; Schema: selling; Owner: postgres
--

COPY selling.discount (id, name, disc_amount, disc_type, model_id, collection_id, season_id, model_color_id, model_size_id, product_id, online_platform_id, customer_category_id, begin_date, end_date, create_by, create_date, active) FROM stdin;
\.


--
-- TOC entry 3762 (class 0 OID 25222)
-- Dependencies: 264
-- Data for Name: online_platform; Type: TABLE DATA; Schema: selling; Owner: postgres
--

COPY selling.online_platform (id, name, website, create_by, create_date, active) FROM stdin;
\.


--
-- TOC entry 3772 (class 0 OID 25454)
-- Dependencies: 274
-- Data for Name: order_detail; Type: TABLE DATA; Schema: selling; Owner: postgres
--

COPY selling.order_detail (id, order_info_id, product_for_sale_id, price_for_sale_id, amount) FROM stdin;
\.


--
-- TOC entry 3770 (class 0 OID 25411)
-- Dependencies: 272
-- Data for Name: order_info; Type: TABLE DATA; Schema: selling; Owner: postgres
--

COPY selling.order_info (id, online_platform_id, customer_id, status, ok_status, ok_by, ok_date, send_status, send_by, send_date, finish_status, finish_by, finish_date, cancel_status, cancel_by, cancel_date, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3768 (class 0 OID 25375)
-- Dependencies: 270
-- Data for Name: price_for_sale; Type: TABLE DATA; Schema: selling; Owner: postgres
--

COPY selling.price_for_sale (id, price_list_id, discount_id, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3766 (class 0 OID 25345)
-- Dependencies: 268
-- Data for Name: price_list; Type: TABLE DATA; Schema: selling; Owner: postgres
--

COPY selling.price_list (id, model_id, mid_material_price, extra_price, retail_price, begin_date, end_date, create_by, create_date, active) FROM stdin;
\.


--
-- TOC entry 3748 (class 0 OID 25061)
-- Dependencies: 250
-- Data for Name: balance; Type: TABLE DATA; Schema: warehouse; Owner: postgres
--

COPY warehouse.balance (id, material_id, lot_number, amount, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3746 (class 0 OID 25048)
-- Dependencies: 248
-- Data for Name: expense; Type: TABLE DATA; Schema: warehouse; Owner: postgres
--

COPY warehouse.expense (id, material_id, lot_number, amount, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3744 (class 0 OID 25029)
-- Dependencies: 246
-- Data for Name: income; Type: TABLE DATA; Schema: warehouse; Owner: postgres
--

COPY warehouse.income (id, material_id, lot_number, vendor_id, amount, price, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3742 (class 0 OID 24972)
-- Dependencies: 244
-- Data for Name: material; Type: TABLE DATA; Schema: warehouse; Owner: postgres
--

COPY warehouse.material (id, code, name, material_category_id, material_type_id, material_color_id, country_manufacturer_id, unit_id, specification, note, create_by, create_date, active) FROM stdin;
\.


--
-- TOC entry 3738 (class 0 OID 24948)
-- Dependencies: 240
-- Data for Name: vendor; Type: TABLE DATA; Schema: warehouse; Owner: postgres
--

COPY warehouse.vendor (id, name, website, address, note, create_by, create_date, active) FROM stdin;
\.


--
-- TOC entry 3740 (class 0 OID 24957)
-- Dependencies: 242
-- Data for Name: vendor_phone; Type: TABLE DATA; Schema: warehouse; Owner: postgres
--

COPY warehouse.vendor_phone (id, vendor_id, phone, note, create_by, create_date) FROM stdin;
\.


--
-- TOC entry 3921 (class 0 OID 0)
-- Dependencies: 221
-- Name: design_id_seq; Type: SEQUENCE SET; Schema: main; Owner: postgres
--

SELECT pg_catalog.setval('main.design_id_seq', 1, false);


--
-- TOC entry 3922 (class 0 OID 0)
-- Dependencies: 219
-- Name: lu_id_seq; Type: SEQUENCE SET; Schema: main; Owner: postgres
--

SELECT pg_catalog.setval('main.lu_id_seq', 1, false);


--
-- TOC entry 3923 (class 0 OID 0)
-- Dependencies: 223
-- Name: man_id_seq; Type: SEQUENCE SET; Schema: main; Owner: postgres
--

SELECT pg_catalog.setval('main.man_id_seq', 1, false);


--
-- TOC entry 3924 (class 0 OID 0)
-- Dependencies: 227
-- Name: man_rights_id_seq; Type: SEQUENCE SET; Schema: main; Owner: postgres
--

SELECT pg_catalog.setval('main.man_rights_id_seq', 1, false);


--
-- TOC entry 3925 (class 0 OID 0)
-- Dependencies: 231
-- Name: model_color_id_seq; Type: SEQUENCE SET; Schema: main; Owner: postgres
--

SELECT pg_catalog.setval('main.model_color_id_seq', 1, false);


--
-- TOC entry 3926 (class 0 OID 0)
-- Dependencies: 237
-- Name: model_content_amount_id_seq; Type: SEQUENCE SET; Schema: main; Owner: postgres
--

SELECT pg_catalog.setval('main.model_content_amount_id_seq', 1, false);


--
-- TOC entry 3927 (class 0 OID 0)
-- Dependencies: 233
-- Name: model_content_id_seq; Type: SEQUENCE SET; Schema: main; Owner: postgres
--

SELECT pg_catalog.setval('main.model_content_id_seq', 1, false);


--
-- TOC entry 3928 (class 0 OID 0)
-- Dependencies: 229
-- Name: model_id_seq; Type: SEQUENCE SET; Schema: main; Owner: postgres
--

SELECT pg_catalog.setval('main.model_id_seq', 1, false);


--
-- TOC entry 3929 (class 0 OID 0)
-- Dependencies: 251
-- Name: model_material_id_seq; Type: SEQUENCE SET; Schema: main; Owner: postgres
--

SELECT pg_catalog.setval('main.model_material_id_seq', 1, false);


--
-- TOC entry 3930 (class 0 OID 0)
-- Dependencies: 235
-- Name: model_size_id_seq; Type: SEQUENCE SET; Schema: main; Owner: postgres
--

SELECT pg_catalog.setval('main.model_size_id_seq', 1, false);


--
-- TOC entry 3931 (class 0 OID 0)
-- Dependencies: 253
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: main; Owner: postgres
--

SELECT pg_catalog.setval('main.product_id_seq', 1, false);


--
-- TOC entry 3932 (class 0 OID 0)
-- Dependencies: 225
-- Name: rights_id_seq; Type: SEQUENCE SET; Schema: main; Owner: postgres
--

SELECT pg_catalog.setval('main.rights_id_seq', 1, false);


--
-- TOC entry 3933 (class 0 OID 0)
-- Dependencies: 257
-- Name: income_id_seq; Type: SEQUENCE SET; Schema: prod_warehouse; Owner: postgres
--

SELECT pg_catalog.setval('prod_warehouse.income_id_seq', 1, false);


--
-- TOC entry 3934 (class 0 OID 0)
-- Dependencies: 255
-- Name: product_for_sale_id_seq; Type: SEQUENCE SET; Schema: prod_warehouse; Owner: postgres
--

SELECT pg_catalog.setval('prod_warehouse.product_for_sale_id_seq', 1, false);


--
-- TOC entry 3935 (class 0 OID 0)
-- Dependencies: 259
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: selling; Owner: postgres
--

SELECT pg_catalog.setval('selling.customer_id_seq', 1, false);


--
-- TOC entry 3936 (class 0 OID 0)
-- Dependencies: 261
-- Name: customer_phone_id_seq; Type: SEQUENCE SET; Schema: selling; Owner: postgres
--

SELECT pg_catalog.setval('selling.customer_phone_id_seq', 1, false);


--
-- TOC entry 3937 (class 0 OID 0)
-- Dependencies: 265
-- Name: discount_id_seq; Type: SEQUENCE SET; Schema: selling; Owner: postgres
--

SELECT pg_catalog.setval('selling.discount_id_seq', 1, false);


--
-- TOC entry 3938 (class 0 OID 0)
-- Dependencies: 263
-- Name: online_platform_id_seq; Type: SEQUENCE SET; Schema: selling; Owner: postgres
--

SELECT pg_catalog.setval('selling.online_platform_id_seq', 1, false);


--
-- TOC entry 3939 (class 0 OID 0)
-- Dependencies: 273
-- Name: order_detail_id_seq; Type: SEQUENCE SET; Schema: selling; Owner: postgres
--

SELECT pg_catalog.setval('selling.order_detail_id_seq', 1, false);


--
-- TOC entry 3940 (class 0 OID 0)
-- Dependencies: 271
-- Name: order_info_id_seq; Type: SEQUENCE SET; Schema: selling; Owner: postgres
--

SELECT pg_catalog.setval('selling.order_info_id_seq', 1, false);


--
-- TOC entry 3941 (class 0 OID 0)
-- Dependencies: 269
-- Name: price_for_sale_id_seq; Type: SEQUENCE SET; Schema: selling; Owner: postgres
--

SELECT pg_catalog.setval('selling.price_for_sale_id_seq', 1, false);


--
-- TOC entry 3942 (class 0 OID 0)
-- Dependencies: 267
-- Name: price_list_id_seq; Type: SEQUENCE SET; Schema: selling; Owner: postgres
--

SELECT pg_catalog.setval('selling.price_list_id_seq', 1, false);


--
-- TOC entry 3943 (class 0 OID 0)
-- Dependencies: 249
-- Name: balance_id_seq; Type: SEQUENCE SET; Schema: warehouse; Owner: postgres
--

SELECT pg_catalog.setval('warehouse.balance_id_seq', 1, false);


--
-- TOC entry 3944 (class 0 OID 0)
-- Dependencies: 247
-- Name: expense_id_seq; Type: SEQUENCE SET; Schema: warehouse; Owner: postgres
--

SELECT pg_catalog.setval('warehouse.expense_id_seq', 1, false);


--
-- TOC entry 3945 (class 0 OID 0)
-- Dependencies: 245
-- Name: income_id_seq; Type: SEQUENCE SET; Schema: warehouse; Owner: postgres
--

SELECT pg_catalog.setval('warehouse.income_id_seq', 1, false);


--
-- TOC entry 3946 (class 0 OID 0)
-- Dependencies: 243
-- Name: material_id_seq; Type: SEQUENCE SET; Schema: warehouse; Owner: postgres
--

SELECT pg_catalog.setval('warehouse.material_id_seq', 1, false);


--
-- TOC entry 3947 (class 0 OID 0)
-- Dependencies: 239
-- Name: vendor_id_seq; Type: SEQUENCE SET; Schema: warehouse; Owner: postgres
--

SELECT pg_catalog.setval('warehouse.vendor_id_seq', 1, false);


--
-- TOC entry 3948 (class 0 OID 0)
-- Dependencies: 241
-- Name: vendor_phone_id_seq; Type: SEQUENCE SET; Schema: warehouse; Owner: postgres
--

SELECT pg_catalog.setval('warehouse.vendor_phone_id_seq', 1, false);


--
-- TOC entry 3434 (class 2606 OID 24822)
-- Name: model pk_11; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model
    ADD CONSTRAINT pk_11 PRIMARY KEY (id);


--
-- TOC entry 3481 (class 2606 OID 25106)
-- Name: product pk_14; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.product
    ADD CONSTRAINT pk_14 PRIMARY KEY (id);


--
-- TOC entry 3449 (class 2606 OID 24933)
-- Name: model_content_amount pk_19; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_content_amount
    ADD CONSTRAINT pk_19 PRIMARY KEY (id);


--
-- TOC entry 3441 (class 2606 OID 24889)
-- Name: model_content pk_20_1; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_content
    ADD CONSTRAINT pk_20_1 PRIMARY KEY (id);


--
-- TOC entry 3476 (class 2606 OID 25079)
-- Name: model_material pk_22; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_material
    ADD CONSTRAINT pk_22 PRIMARY KEY (id);


--
-- TOC entry 3417 (class 2606 OID 24717)
-- Name: lu pk_23_1; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.lu
    ADD CONSTRAINT pk_23_1 PRIMARY KEY (id);


--
-- TOC entry 3438 (class 2606 OID 24870)
-- Name: model_color pk_23_2; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_color
    ADD CONSTRAINT pk_23_2 PRIMARY KEY (id);


--
-- TOC entry 3445 (class 2606 OID 24914)
-- Name: model_size pk_24_1; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_size
    ADD CONSTRAINT pk_24_1 PRIMARY KEY (id);


--
-- TOC entry 3420 (class 2606 OID 24726)
-- Name: design pk_25; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.design
    ADD CONSTRAINT pk_25 PRIMARY KEY (id);


--
-- TOC entry 3424 (class 2606 OID 24748)
-- Name: rights pk_25_2; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.rights
    ADD CONSTRAINT pk_25_2 PRIMARY KEY (id);


--
-- TOC entry 3428 (class 2606 OID 24772)
-- Name: man_rights pk_26; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.man_rights
    ADD CONSTRAINT pk_26 PRIMARY KEY (id);


--
-- TOC entry 3422 (class 2606 OID 24739)
-- Name: man pk_6; Type: CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.man
    ADD CONSTRAINT pk_6 PRIMARY KEY (id);


--
-- TOC entry 3484 (class 2606 OID 25131)
-- Name: product_for_sale pk_21_1; Type: CONSTRAINT; Schema: prod_warehouse; Owner: postgres
--

ALTER TABLE ONLY prod_warehouse.product_for_sale
    ADD CONSTRAINT pk_21_1 PRIMARY KEY (id);


--
-- TOC entry 3487 (class 2606 OID 25156)
-- Name: income pk_22_1; Type: CONSTRAINT; Schema: prod_warehouse; Owner: postgres
--

ALTER TABLE ONLY prod_warehouse.income
    ADD CONSTRAINT pk_22_1 PRIMARY KEY (id);


--
-- TOC entry 3506 (class 2606 OID 25283)
-- Name: discount pk_12; Type: CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.discount
    ADD CONSTRAINT pk_12 PRIMARY KEY (id);


--
-- TOC entry 3509 (class 2606 OID 25350)
-- Name: price_list pk_21; Type: CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.price_list
    ADD CONSTRAINT pk_21 PRIMARY KEY (id);


--
-- TOC entry 3517 (class 2606 OID 25416)
-- Name: order_info pk_23; Type: CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.order_info
    ADD CONSTRAINT pk_23 PRIMARY KEY (id);


--
-- TOC entry 3522 (class 2606 OID 25459)
-- Name: order_detail pk_24; Type: CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.order_detail
    ADD CONSTRAINT pk_24 PRIMARY KEY (id);


--
-- TOC entry 3513 (class 2606 OID 25380)
-- Name: price_for_sale pk_25_1; Type: CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.price_for_sale
    ADD CONSTRAINT pk_25_1 PRIMARY KEY (id);


--
-- TOC entry 3494 (class 2606 OID 25192)
-- Name: customer_phone pk_28; Type: CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.customer_phone
    ADD CONSTRAINT pk_28 PRIMARY KEY (id);


--
-- TOC entry 3496 (class 2606 OID 25229)
-- Name: online_platform pk_7; Type: CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.online_platform
    ADD CONSTRAINT pk_7 PRIMARY KEY (id);


--
-- TOC entry 3491 (class 2606 OID 25171)
-- Name: customer pk_8; Type: CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.customer
    ADD CONSTRAINT pk_8 PRIMARY KEY (id);


--
-- TOC entry 3451 (class 2606 OID 24955)
-- Name: vendor pk_1; Type: CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.vendor
    ADD CONSTRAINT pk_1 PRIMARY KEY (id);


--
-- TOC entry 3471 (class 2606 OID 25066)
-- Name: balance pk_13; Type: CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.balance
    ADD CONSTRAINT pk_13 PRIMARY KEY (id);


--
-- TOC entry 3465 (class 2606 OID 25034)
-- Name: income pk_15; Type: CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.income
    ADD CONSTRAINT pk_15 PRIMARY KEY (id);


--
-- TOC entry 3468 (class 2606 OID 25053)
-- Name: expense pk_16; Type: CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.expense
    ADD CONSTRAINT pk_16 PRIMARY KEY (id);


--
-- TOC entry 3461 (class 2606 OID 24979)
-- Name: material pk_2; Type: CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.material
    ADD CONSTRAINT pk_2 PRIMARY KEY (id);


--
-- TOC entry 3454 (class 2606 OID 24964)
-- Name: vendor_phone pk_27; Type: CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.vendor_phone
    ADD CONSTRAINT pk_27 PRIMARY KEY (id);


--
-- TOC entry 3418 (class 1259 OID 24732)
-- Name: fk_1; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_1 ON main.design USING btree (type_id);


--
-- TOC entry 3439 (class 1259 OID 24895)
-- Name: fk_10; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_10 ON main.model_content USING btree (model_id);


--
-- TOC entry 3442 (class 1259 OID 24925)
-- Name: fk_11; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_11 ON main.model_size USING btree (model_id);


--
-- TOC entry 3443 (class 1259 OID 24926)
-- Name: fk_12; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_12 ON main.model_size USING btree (size_id);


--
-- TOC entry 3446 (class 1259 OID 24944)
-- Name: fk_13; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_13 ON main.model_content_amount USING btree (model_content_id);


--
-- TOC entry 3447 (class 1259 OID 24945)
-- Name: fk_14; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_14 ON main.model_content_amount USING btree (model_size_id);


--
-- TOC entry 3472 (class 1259 OID 25095)
-- Name: fk_15; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_15 ON main.model_material USING btree (model_content_id);


--
-- TOC entry 3473 (class 1259 OID 25096)
-- Name: fk_16; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_16 ON main.model_material USING btree (material_id);


--
-- TOC entry 3474 (class 1259 OID 25097)
-- Name: fk_17; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_17 ON main.model_material USING btree (model_color_id);


--
-- TOC entry 3477 (class 1259 OID 25122)
-- Name: fk_18; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_18 ON main.product USING btree (model_color_id);


--
-- TOC entry 3478 (class 1259 OID 25123)
-- Name: fk_18_1; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_18_1 ON main.product USING btree (model_id);


--
-- TOC entry 3479 (class 1259 OID 25124)
-- Name: fk_19; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_19 ON main.product USING btree (model_size_id);


--
-- TOC entry 3425 (class 1259 OID 24783)
-- Name: fk_2; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_2 ON main.man_rights USING btree (man_id);


--
-- TOC entry 3426 (class 1259 OID 24784)
-- Name: fk_3; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_3 ON main.man_rights USING btree (right_id);


--
-- TOC entry 3429 (class 1259 OID 24843)
-- Name: fk_4; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_4 ON main.model USING btree (design_id);


--
-- TOC entry 3430 (class 1259 OID 24844)
-- Name: fk_5; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_5 ON main.model USING btree (group_id);


--
-- TOC entry 3431 (class 1259 OID 24845)
-- Name: fk_6; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_6 ON main.model USING btree (collection_id);


--
-- TOC entry 3432 (class 1259 OID 24846)
-- Name: fk_7; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_7 ON main.model USING btree (season_id);


--
-- TOC entry 3435 (class 1259 OID 24881)
-- Name: fk_8; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_8 ON main.model_color USING btree (model_id);


--
-- TOC entry 3436 (class 1259 OID 24882)
-- Name: fk_9; Type: INDEX; Schema: main; Owner: postgres
--

CREATE INDEX fk_9 ON main.model_color USING btree (m_color_id);


--
-- TOC entry 3482 (class 1259 OID 25137)
-- Name: fk_1; Type: INDEX; Schema: prod_warehouse; Owner: postgres
--

CREATE INDEX fk_1 ON prod_warehouse.product_for_sale USING btree (product_id);


--
-- TOC entry 3485 (class 1259 OID 25162)
-- Name: fk_2; Type: INDEX; Schema: prod_warehouse; Owner: postgres
--

CREATE INDEX fk_2 ON prod_warehouse.income USING btree (product_id);


--
-- TOC entry 3492 (class 1259 OID 25198)
-- Name: fk_1; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_1 ON selling.customer_phone USING btree (customer_id);


--
-- TOC entry 3497 (class 1259 OID 25325)
-- Name: fk_10; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_10 ON selling.discount USING btree (model_size_id);


--
-- TOC entry 3510 (class 1259 OID 25391)
-- Name: fk_13; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_13 ON selling.price_for_sale USING btree (price_list_id);


--
-- TOC entry 3511 (class 1259 OID 25392)
-- Name: fk_14; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_14 ON selling.price_for_sale USING btree (discount_id);


--
-- TOC entry 3514 (class 1259 OID 25427)
-- Name: fk_15; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_15 ON selling.order_info USING btree (online_platform_id);


--
-- TOC entry 3515 (class 1259 OID 25428)
-- Name: fk_16; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_16 ON selling.order_info USING btree (customer_id);


--
-- TOC entry 3518 (class 1259 OID 25475)
-- Name: fk_17; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_17 ON selling.order_detail USING btree (product_for_sale_id);


--
-- TOC entry 3519 (class 1259 OID 25476)
-- Name: fk_18; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_18 ON selling.order_detail USING btree (order_info_id);


--
-- TOC entry 3520 (class 1259 OID 25477)
-- Name: fk_18_1; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_18_1 ON selling.order_detail USING btree (price_for_sale_id);


--
-- TOC entry 3498 (class 1259 OID 25324)
-- Name: fk_2; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_2 ON selling.discount USING btree (model_id);


--
-- TOC entry 3488 (class 1259 OID 25182)
-- Name: fk_3; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_3 ON selling.customer USING btree (category_id);


--
-- TOC entry 3489 (class 1259 OID 25183)
-- Name: fk_3_1; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_3_1 ON selling.customer USING btree (country_id);


--
-- TOC entry 3507 (class 1259 OID 25356)
-- Name: fk_4; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_4 ON selling.price_list USING btree (model_id);


--
-- TOC entry 3499 (class 1259 OID 25326)
-- Name: fk_5_1; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_5_1 ON selling.discount USING btree (collection_id);


--
-- TOC entry 3500 (class 1259 OID 25327)
-- Name: fk_6; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_6 ON selling.discount USING btree (online_platform_id);


--
-- TOC entry 3501 (class 1259 OID 25328)
-- Name: fk_6_2; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_6_2 ON selling.discount USING btree (season_id);


--
-- TOC entry 3502 (class 1259 OID 25329)
-- Name: fk_8; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_8 ON selling.discount USING btree (product_id);


--
-- TOC entry 3503 (class 1259 OID 25330)
-- Name: fk_9; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_9 ON selling.discount USING btree (customer_category_id);


--
-- TOC entry 3504 (class 1259 OID 25331)
-- Name: fk_9_1; Type: INDEX; Schema: selling; Owner: postgres
--

CREATE INDEX fk_9_1 ON selling.discount USING btree (model_color_id);


--
-- TOC entry 3452 (class 1259 OID 24970)
-- Name: fk_1; Type: INDEX; Schema: warehouse; Owner: postgres
--

CREATE INDEX fk_1 ON warehouse.vendor_phone USING btree (vendor_id);


--
-- TOC entry 3469 (class 1259 OID 25072)
-- Name: fk_10; Type: INDEX; Schema: warehouse; Owner: postgres
--

CREATE INDEX fk_10 ON warehouse.balance USING btree (material_id);


--
-- TOC entry 3455 (class 1259 OID 25005)
-- Name: fk_3; Type: INDEX; Schema: warehouse; Owner: postgres
--

CREATE INDEX fk_3 ON warehouse.material USING btree (material_category_id);


--
-- TOC entry 3456 (class 1259 OID 25006)
-- Name: fk_3_1; Type: INDEX; Schema: warehouse; Owner: postgres
--

CREATE INDEX fk_3_1 ON warehouse.material USING btree (country_manufacturer_id);


--
-- TOC entry 3457 (class 1259 OID 25007)
-- Name: fk_4_1; Type: INDEX; Schema: warehouse; Owner: postgres
--

CREATE INDEX fk_4_1 ON warehouse.material USING btree (material_color_id);


--
-- TOC entry 3458 (class 1259 OID 25008)
-- Name: fk_5; Type: INDEX; Schema: warehouse; Owner: postgres
--

CREATE INDEX fk_5 ON warehouse.material USING btree (unit_id);


--
-- TOC entry 3459 (class 1259 OID 25009)
-- Name: fk_6; Type: INDEX; Schema: warehouse; Owner: postgres
--

CREATE INDEX fk_6 ON warehouse.material USING btree (material_type_id);


--
-- TOC entry 3462 (class 1259 OID 25045)
-- Name: fk_7; Type: INDEX; Schema: warehouse; Owner: postgres
--

CREATE INDEX fk_7 ON warehouse.income USING btree (material_id);


--
-- TOC entry 3463 (class 1259 OID 25046)
-- Name: fk_8; Type: INDEX; Schema: warehouse; Owner: postgres
--

CREATE INDEX fk_8 ON warehouse.income USING btree (vendor_id);


--
-- TOC entry 3466 (class 1259 OID 25059)
-- Name: fk_9; Type: INDEX; Schema: warehouse; Owner: postgres
--

CREATE INDEX fk_9 ON warehouse.expense USING btree (material_id);


--
-- TOC entry 3523 (class 2606 OID 24727)
-- Name: design fk_34; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.design
    ADD CONSTRAINT fk_34 FOREIGN KEY (type_id) REFERENCES main.lu(id);


--
-- TOC entry 3526 (class 2606 OID 24823)
-- Name: model fk_35; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model
    ADD CONSTRAINT fk_35 FOREIGN KEY (design_id) REFERENCES main.design(id);


--
-- TOC entry 3527 (class 2606 OID 24828)
-- Name: model fk_36; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model
    ADD CONSTRAINT fk_36 FOREIGN KEY (group_id) REFERENCES main.lu(id);


--
-- TOC entry 3528 (class 2606 OID 24833)
-- Name: model fk_37; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model
    ADD CONSTRAINT fk_37 FOREIGN KEY (collection_id) REFERENCES main.lu(id);


--
-- TOC entry 3529 (class 2606 OID 24838)
-- Name: model fk_38; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model
    ADD CONSTRAINT fk_38 FOREIGN KEY (season_id) REFERENCES main.lu(id);


--
-- TOC entry 3532 (class 2606 OID 24890)
-- Name: model_content fk_38_2; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_content
    ADD CONSTRAINT fk_38_2 FOREIGN KEY (model_id) REFERENCES main.model(id);


--
-- TOC entry 3530 (class 2606 OID 24871)
-- Name: model_color fk_38_3; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_color
    ADD CONSTRAINT fk_38_3 FOREIGN KEY (model_id) REFERENCES main.model(id);


--
-- TOC entry 3535 (class 2606 OID 24934)
-- Name: model_content_amount fk_39; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_content_amount
    ADD CONSTRAINT fk_39 FOREIGN KEY (model_content_id) REFERENCES main.model_content(id);


--
-- TOC entry 3550 (class 2606 OID 25112)
-- Name: product fk_39_1; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.product
    ADD CONSTRAINT fk_39_1 FOREIGN KEY (model_id) REFERENCES main.model(id);


--
-- TOC entry 3531 (class 2606 OID 24876)
-- Name: model_color fk_39_3; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_color
    ADD CONSTRAINT fk_39_3 FOREIGN KEY (m_color_id) REFERENCES main.lu(id);


--
-- TOC entry 3533 (class 2606 OID 24915)
-- Name: model_size fk_39_4; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_size
    ADD CONSTRAINT fk_39_4 FOREIGN KEY (model_id) REFERENCES main.model(id);


--
-- TOC entry 3551 (class 2606 OID 25107)
-- Name: product fk_40; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.product
    ADD CONSTRAINT fk_40 FOREIGN KEY (model_color_id) REFERENCES main.model_color(id);


--
-- TOC entry 3547 (class 2606 OID 25090)
-- Name: model_material fk_40_3; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_material
    ADD CONSTRAINT fk_40_3 FOREIGN KEY (model_color_id) REFERENCES main.model_color(id);


--
-- TOC entry 3534 (class 2606 OID 24920)
-- Name: model_size fk_40_4; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_size
    ADD CONSTRAINT fk_40_4 FOREIGN KEY (size_id) REFERENCES main.lu(id);


--
-- TOC entry 3548 (class 2606 OID 25080)
-- Name: model_material fk_41; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_material
    ADD CONSTRAINT fk_41 FOREIGN KEY (model_content_id) REFERENCES main.model_content(id);


--
-- TOC entry 3536 (class 2606 OID 24939)
-- Name: model_content_amount fk_41_1; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_content_amount
    ADD CONSTRAINT fk_41_1 FOREIGN KEY (model_size_id) REFERENCES main.model_size(id);


--
-- TOC entry 3552 (class 2606 OID 25117)
-- Name: product fk_41_3; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.product
    ADD CONSTRAINT fk_41_3 FOREIGN KEY (model_size_id) REFERENCES main.model_size(id);


--
-- TOC entry 3549 (class 2606 OID 25085)
-- Name: model_material fk_42; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.model_material
    ADD CONSTRAINT fk_42 FOREIGN KEY (material_id) REFERENCES warehouse.material(id);


--
-- TOC entry 3524 (class 2606 OID 24773)
-- Name: man_rights fk_47; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.man_rights
    ADD CONSTRAINT fk_47 FOREIGN KEY (man_id) REFERENCES main.man(id);


--
-- TOC entry 3525 (class 2606 OID 24778)
-- Name: man_rights fk_48; Type: FK CONSTRAINT; Schema: main; Owner: postgres
--

ALTER TABLE ONLY main.man_rights
    ADD CONSTRAINT fk_48 FOREIGN KEY (right_id) REFERENCES main.rights(id);


--
-- TOC entry 3553 (class 2606 OID 25132)
-- Name: product_for_sale fk_39_2; Type: FK CONSTRAINT; Schema: prod_warehouse; Owner: postgres
--

ALTER TABLE ONLY prod_warehouse.product_for_sale
    ADD CONSTRAINT fk_39_2 FOREIGN KEY (product_id) REFERENCES main.product(id);


--
-- TOC entry 3554 (class 2606 OID 25157)
-- Name: income fk_40_2; Type: FK CONSTRAINT; Schema: prod_warehouse; Owner: postgres
--

ALTER TABLE ONLY prod_warehouse.income
    ADD CONSTRAINT fk_40_2 FOREIGN KEY (product_id) REFERENCES main.product(id);


--
-- TOC entry 3558 (class 2606 OID 25284)
-- Name: discount fk_19; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.discount
    ADD CONSTRAINT fk_19 FOREIGN KEY (model_id) REFERENCES main.model(id);


--
-- TOC entry 3569 (class 2606 OID 25417)
-- Name: order_info fk_26; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.order_info
    ADD CONSTRAINT fk_26 FOREIGN KEY (online_platform_id) REFERENCES selling.online_platform(id);


--
-- TOC entry 3570 (class 2606 OID 25422)
-- Name: order_info fk_27; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.order_info
    ADD CONSTRAINT fk_27 FOREIGN KEY (customer_id) REFERENCES selling.customer(id);


--
-- TOC entry 3559 (class 2606 OID 25299)
-- Name: discount fk_29; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.discount
    ADD CONSTRAINT fk_29 FOREIGN KEY (online_platform_id) REFERENCES selling.online_platform(id);


--
-- TOC entry 3571 (class 2606 OID 25465)
-- Name: order_detail fk_32; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.order_detail
    ADD CONSTRAINT fk_32 FOREIGN KEY (order_info_id) REFERENCES selling.order_info(id);


--
-- TOC entry 3560 (class 2606 OID 25294)
-- Name: discount fk_34_1; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.discount
    ADD CONSTRAINT fk_34_1 FOREIGN KEY (collection_id) REFERENCES main.lu(id);


--
-- TOC entry 3561 (class 2606 OID 25304)
-- Name: discount fk_35_1; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.discount
    ADD CONSTRAINT fk_35_1 FOREIGN KEY (season_id) REFERENCES main.lu(id);


--
-- TOC entry 3555 (class 2606 OID 25177)
-- Name: customer fk_37_4; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.customer
    ADD CONSTRAINT fk_37_4 FOREIGN KEY (country_id) REFERENCES main.lu(id);


--
-- TOC entry 3556 (class 2606 OID 25172)
-- Name: customer fk_37_5; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.customer
    ADD CONSTRAINT fk_37_5 FOREIGN KEY (category_id) REFERENCES main.lu(id);


--
-- TOC entry 3562 (class 2606 OID 25314)
-- Name: discount fk_38_1; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.discount
    ADD CONSTRAINT fk_38_1 FOREIGN KEY (customer_category_id) REFERENCES main.lu(id);


--
-- TOC entry 3572 (class 2606 OID 25460)
-- Name: order_detail fk_42_1; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.order_detail
    ADD CONSTRAINT fk_42_1 FOREIGN KEY (product_for_sale_id) REFERENCES prod_warehouse.product_for_sale(id);


--
-- TOC entry 3566 (class 2606 OID 25351)
-- Name: price_list fk_43; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.price_list
    ADD CONSTRAINT fk_43 FOREIGN KEY (model_id) REFERENCES main.model(id);


--
-- TOC entry 3563 (class 2606 OID 25309)
-- Name: discount fk_44_1; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.discount
    ADD CONSTRAINT fk_44_1 FOREIGN KEY (product_id) REFERENCES main.product(id);


--
-- TOC entry 3564 (class 2606 OID 25319)
-- Name: discount fk_45; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.discount
    ADD CONSTRAINT fk_45 FOREIGN KEY (model_color_id) REFERENCES main.model_color(id);


--
-- TOC entry 3567 (class 2606 OID 25381)
-- Name: price_for_sale fk_45_1; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.price_for_sale
    ADD CONSTRAINT fk_45_1 FOREIGN KEY (price_list_id) REFERENCES selling.price_list(id);


--
-- TOC entry 3565 (class 2606 OID 25289)
-- Name: discount fk_46; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.discount
    ADD CONSTRAINT fk_46 FOREIGN KEY (model_size_id) REFERENCES main.model_size(id);


--
-- TOC entry 3568 (class 2606 OID 25386)
-- Name: price_for_sale fk_46_1; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.price_for_sale
    ADD CONSTRAINT fk_46_1 FOREIGN KEY (discount_id) REFERENCES selling.discount(id);


--
-- TOC entry 3573 (class 2606 OID 25470)
-- Name: order_detail fk_46_2; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.order_detail
    ADD CONSTRAINT fk_46_2 FOREIGN KEY (price_for_sale_id) REFERENCES selling.price_for_sale(id);


--
-- TOC entry 3557 (class 2606 OID 25193)
-- Name: customer_phone fk_50; Type: FK CONSTRAINT; Schema: selling; Owner: postgres
--

ALTER TABLE ONLY selling.customer_phone
    ADD CONSTRAINT fk_50 FOREIGN KEY (customer_id) REFERENCES selling.customer(id);


--
-- TOC entry 3545 (class 2606 OID 25054)
-- Name: expense fk_12_1; Type: FK CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.expense
    ADD CONSTRAINT fk_12_1 FOREIGN KEY (material_id) REFERENCES warehouse.material(id);


--
-- TOC entry 3538 (class 2606 OID 24980)
-- Name: material fk_37_2; Type: FK CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.material
    ADD CONSTRAINT fk_37_2 FOREIGN KEY (material_category_id) REFERENCES main.lu(id);


--
-- TOC entry 3539 (class 2606 OID 24985)
-- Name: material fk_37_3; Type: FK CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.material
    ADD CONSTRAINT fk_37_3 FOREIGN KEY (country_manufacturer_id) REFERENCES main.lu(id);


--
-- TOC entry 3540 (class 2606 OID 24990)
-- Name: material fk_42_2; Type: FK CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.material
    ADD CONSTRAINT fk_42_2 FOREIGN KEY (material_color_id) REFERENCES main.lu(id);


--
-- TOC entry 3541 (class 2606 OID 24995)
-- Name: material fk_44; Type: FK CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.material
    ADD CONSTRAINT fk_44 FOREIGN KEY (unit_id) REFERENCES main.lu(id);


--
-- TOC entry 3537 (class 2606 OID 24965)
-- Name: vendor_phone fk_49; Type: FK CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.vendor_phone
    ADD CONSTRAINT fk_49 FOREIGN KEY (vendor_id) REFERENCES warehouse.vendor(id);


--
-- TOC entry 3542 (class 2606 OID 25000)
-- Name: material fk_51; Type: FK CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.material
    ADD CONSTRAINT fk_51 FOREIGN KEY (material_type_id) REFERENCES main.lu(id);


--
-- TOC entry 3543 (class 2606 OID 25040)
-- Name: income fk_51_1; Type: FK CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.income
    ADD CONSTRAINT fk_51_1 FOREIGN KEY (vendor_id) REFERENCES warehouse.vendor(id);


--
-- TOC entry 3546 (class 2606 OID 25067)
-- Name: balance fk_6_1; Type: FK CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.balance
    ADD CONSTRAINT fk_6_1 FOREIGN KEY (material_id) REFERENCES warehouse.material(id);


--
-- TOC entry 3544 (class 2606 OID 25035)
-- Name: income fk_9; Type: FK CONSTRAINT; Schema: warehouse; Owner: postgres
--

ALTER TABLE ONLY warehouse.income
    ADD CONSTRAINT fk_9 FOREIGN KEY (material_id) REFERENCES warehouse.material(id);


-- Completed on 2024-09-27 21:15:38

--
-- PostgreSQL database dump complete
--

