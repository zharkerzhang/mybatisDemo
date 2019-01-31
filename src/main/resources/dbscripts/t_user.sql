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
-- Name: t_user user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.t_user ALTER COLUMN user_id SET DEFAULT nextval('public.user_user_id_seq'::regclass);


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
-- PostgreSQL database dump complete
--

