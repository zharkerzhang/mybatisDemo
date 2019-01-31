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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: roads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roads (
    road_id integer NOT NULL,
    roads_geom public.geography(LineString,4326),
    road_name character varying(100)
);


ALTER TABLE public.roads OWNER TO postgres;

--
-- Name: roads_road_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roads_road_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roads_road_id_seq OWNER TO postgres;

--
-- Name: roads_road_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roads_road_id_seq OWNED BY public.roads.road_id;


--
-- Name: roads road_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roads ALTER COLUMN road_id SET DEFAULT nextval('public.roads_road_id_seq'::regclass);


--
-- Data for Name: roads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roads (road_id, roads_geom, road_name) FROM stdin;
1	0102000020E61000000200000000000000000052400000000000004F400000000000004AC00000000000004FC0	Jeff Rd
2	0102000020E6100000020000000000000000A0614000000000008053400000000000C057C00000000000003140	Geordie Rd
3	0102000020E61000000200000000000000002066C000000000008053C000000000000028400000000000004740	Paul St
4	0102000020E6100000020000000000000000004A400000000000C0514000000000004056C000000000008053C0	Graeme Ave
5	0102000020E610000002000000000000000080494000000000000048C00000000000C0514000000000008052C0	Phil Tce
6	0102000020E61000000200000000000000002060C000000000008053C000000000006062C00000000000004D40	Dave Cres
7	0102000020E61000000200000000000000002060C000000000008053C000000000006062C00000000000004D40	Dave Cres
8	0102000020E6100000020000000000000000A0614000000000008053400000000000C057C00000000000003140	Geordie Rd
9	0102000020E61000000200000000000000002066C000000000008053C000000000000028400000000000004740	Paul St
10	0102000020E6100000020000000000000000004A400000000000C0514000000000004056C000000000008053C0	Graeme Ave
11	0102000020E610000002000000000000000080494000000000000048C00000000000C0514000000000008052C0	Phil Tce
\.


--
-- Name: roads_road_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roads_road_id_seq', 11, true);


--
-- Name: roads roads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roads
    ADD CONSTRAINT roads_pkey PRIMARY KEY (road_id);


--
-- PostgreSQL database dump complete
--

