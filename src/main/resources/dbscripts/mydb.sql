--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.11
-- Dumped by pg_dump version 9.6.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: myschema; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA myschema;


ALTER SCHEMA myschema OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: myrowtype; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.myrowtype AS (
	f1 integer,
	f2 text,
	f3 numeric
);


ALTER TYPE public.myrowtype OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: foo; Type: TABLE; Schema: myschema; Owner: postgres
--

CREATE TABLE myschema.foo (
    fooid integer,
    foosubid integer,
    fooname text
);


ALTER TABLE myschema.foo OWNER TO postgres;

--
-- Name: getfoo(integer); Type: FUNCTION; Schema: myschema; Owner: postgres
--

CREATE FUNCTION myschema.getfoo(integer) RETURNS SETOF myschema.foo
    LANGUAGE sql
    AS $_$
    SELECT * FROM foo WHERE fooid = $1;
$_$;


ALTER FUNCTION myschema.getfoo(integer) OWNER TO postgres;

--
-- Name: concat_lower_or_upper(text, text, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.concat_lower_or_upper(a text, b text, uppercase boolean DEFAULT false) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
 SELECT CASE
        WHEN $3 THEN UPPER($1 || ' ' || $2)
        ELSE LOWER($1 || ' ' || $2)
        END;
$_$;


ALTER FUNCTION public.concat_lower_or_upper(a text, b text, uppercase boolean) OWNER TO postgres;

--
-- Name: getf1(public.myrowtype); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getf1(public.myrowtype) RETURNS integer
    LANGUAGE sql
    AS $_$SELECT $1.f1$_$;


ALTER FUNCTION public.getf1(public.myrowtype) OWNER TO postgres;

--
-- Name: mytable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mytable (
    f1 integer,
    f2 double precision,
    f3 text
);


ALTER TABLE public.mytable OWNER TO postgres;

--
-- Name: getf1(public.mytable); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getf1(public.mytable) RETURNS integer
    LANGUAGE sql
    AS $_$SELECT $1.f1$_$;


ALTER FUNCTION public.getf1(public.mytable) OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: myschema; Owner: postgres
--

CREATE TABLE myschema.users (
    firstname text,
    lastname text,
    id integer NOT NULL
);


ALTER TABLE myschema.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: myschema; Owner: postgres
--

CREATE SEQUENCE myschema.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE myschema.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: myschema; Owner: postgres
--

ALTER SEQUENCE myschema.users_id_seq OWNED BY myschema.users.id;


--
-- Name: arr; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.arr (
    f1 integer[],
    f2 integer[]
);


ALTER TABLE public.arr OWNER TO postgres;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    name character varying(80),
    location point,
    altitude integer
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: capitals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.capitals (
    state character(2),
    comment text
)
INHERITS (public.cities);


ALTER TABLE public.capitals OWNER TO postgres;

--
-- Name: example; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.example (
    a integer NOT NULL,
    b integer,
    c integer NOT NULL
);


ALTER TABLE public.example OWNER TO postgres;

--
-- Name: weather; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.weather (
    city character varying(80),
    temp_lo integer,
    temp_hi integer,
    prcp real,
    date date
);


ALTER TABLE public.weather OWNER TO postgres;

--
-- Name: myview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.myview AS
 SELECT weather.city,
    weather.temp_lo,
    weather.temp_hi,
    weather.prcp,
    weather.date,
    cities.location
   FROM public.weather,
    public.cities
  WHERE ((weather.city)::text = (cities.name)::text);


ALTER TABLE public.myview OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    product_no integer,
    quantity integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_number integer NOT NULL,
    name text,
    price numeric,
    description text,
    CONSTRAINT products_name_check CHECK ((name <> ''::text))
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_product_no_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_no_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_no_seq OWNER TO postgres;

--
-- Name: student_score; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student_score (
    student_id integer NOT NULL,
    student_no character(10) NOT NULL,
    student_name character(200) NOT NULL,
    student_sex boolean DEFAULT true,
    student_age integer DEFAULT 7,
    english_score integer DEFAULT 60,
    math_score integer DEFAULT 60,
    yuwen_score integer DEFAULT 60
);


ALTER TABLE public.student_score OWNER TO postgres;

--
-- Name: student_score_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.student_score_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.student_score_student_id_seq OWNER TO postgres;

--
-- Name: student_score_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.student_score_student_id_seq OWNED BY public.student_score.student_id;


--
-- Name: t_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.t_user (
    user_id integer NOT NULL,
    user_name character(200) NOT NULL,
    active boolean DEFAULT false
);


ALTER TABLE public.t_user OWNER TO postgres;

--
-- Name: user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_user_id_seq OWNER TO postgres;

--
-- Name: user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_user_id_seq OWNED BY public.t_user.user_id;


--
-- Name: users id; Type: DEFAULT; Schema: myschema; Owner: postgres
--

ALTER TABLE ONLY myschema.users ALTER COLUMN id SET DEFAULT nextval('myschema.users_id_seq'::regclass);


--
-- Name: student_score student_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_score ALTER COLUMN student_id SET DEFAULT nextval('public.student_score_student_id_seq'::regclass);


--
-- Name: t_user user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_user ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


--
-- Data for Name: foo; Type: TABLE DATA; Schema: myschema; Owner: postgres
--

COPY myschema.foo (fooid, foosubid, fooname) FROM stdin;
1	1	fnma
2	11	f22nma
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: myschema; Owner: postgres
--

COPY myschema.users (firstname, lastname, id) FROM stdin;
Joe	Cool	1
John	Cl	2
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: myschema; Owner: postgres
--

SELECT pg_catalog.setval('myschema.users_id_seq', 2, true);


--
-- Data for Name: arr; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.arr (f1, f2) FROM stdin;
{{1,2},{3,4}}	{{5,6},{7,8}}
\.


--
-- Data for Name: capitals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.capitals (name, location, altitude, state, comment) FROM stdin;
San Francisco	(-194,53)	222	1 	\N
\.


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (name, location, altitude) FROM stdin;
San Francisco	(-194,53)	\N
\.


--
-- Data for Name: example; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.example (a, b, c) FROM stdin;
1	2	1
\.


--
-- Data for Name: mytable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mytable (f1, f2, f3) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, product_no, quantity) FROM stdin;
1	1	1
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (product_number, name, price, description) FROM stdin;
1	aa	2333.33	\N
\.


--
-- Name: products_product_no_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_no_seq', 1, true);


--
-- Data for Name: student_score; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student_score (student_id, student_no, student_name, student_sex, student_age, english_score, math_score, yuwen_score) FROM stdin;
4	0004      	liuliu                                                                                                                                                                                                  	t	7	60	60	60
1	0001      	zhangsan                                                                                                                                                                                                	f	11	100	99	99
2	0002      	lisi                                                                                                                                                                                                    	t	10	44	100	88
3	0003      	huangwu                                                                                                                                                                                                 	f	9	90	88	90
\.


--
-- Name: student_score_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.student_score_student_id_seq', 4, true);


--
-- Data for Name: t_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.t_user (user_id, user_name, active) FROM stdin;
1	zhangsan                                                                                                                                                                                                	f
2	lisi                                                                                                                                                                                                    	f
3	huangwu                                                                                                                                                                                                 	f
\.


--
-- Name: user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_user_id_seq', 3, true);


--
-- Data for Name: weather; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.weather (city, temp_lo, temp_hi, prcp, date) FROM stdin;
San Francisco	46	50	0.25	1994-11-27
San Francisco	41	55	1.11000001	1994-11-29
Hayward	37	54	2.32999992	1994-11-29
\.


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: myschema; Owner: postgres
--

ALTER TABLE ONLY myschema.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: example example_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.example
    ADD CONSTRAINT example_pkey PRIMARY KEY (a, c);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_number);


--
-- Name: student_score student_score_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student_score
    ADD CONSTRAINT student_score_pkey PRIMARY KEY (student_id);


--
-- Name: t_user user_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_user
    ADD CONSTRAINT user_name_unique UNIQUE (user_name);


--
-- Name: t_user user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_user
    ADD CONSTRAINT user_pk PRIMARY KEY (user_id);


--
-- Name: orders orders_product_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_product_no_fkey FOREIGN KEY (product_no) REFERENCES public.products(product_number);


--
-- PostgreSQL database dump complete
--

