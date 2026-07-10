--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 10, 365);
INSERT INTO public.games VALUES (2, 10, 778);
INSERT INTO public.games VALUES (3, 11, 604);
INSERT INTO public.games VALUES (4, 11, 690);
INSERT INTO public.games VALUES (5, 10, 114);
INSERT INTO public.games VALUES (6, 10, 140);
INSERT INTO public.games VALUES (7, 10, 557);
INSERT INTO public.games VALUES (8, 12, 729);
INSERT INTO public.games VALUES (9, 12, 431);
INSERT INTO public.games VALUES (10, 13, 235);
INSERT INTO public.games VALUES (11, 13, 817);
INSERT INTO public.games VALUES (12, 12, 689);
INSERT INTO public.games VALUES (13, 12, 588);
INSERT INTO public.games VALUES (14, 12, 406);
INSERT INTO public.games VALUES (15, 14, 811);
INSERT INTO public.games VALUES (16, 14, 676);
INSERT INTO public.games VALUES (17, 15, 763);
INSERT INTO public.games VALUES (18, 15, 801);
INSERT INTO public.games VALUES (19, 14, 551);
INSERT INTO public.games VALUES (20, 14, 729);
INSERT INTO public.games VALUES (21, 14, 728);
INSERT INTO public.games VALUES (22, 16, 10);
INSERT INTO public.games VALUES (23, 17, 232);
INSERT INTO public.games VALUES (24, 17, 449);
INSERT INTO public.games VALUES (25, 18, 345);
INSERT INTO public.games VALUES (26, 18, 624);
INSERT INTO public.games VALUES (27, 17, 629);
INSERT INTO public.games VALUES (28, 17, 123);
INSERT INTO public.games VALUES (29, 17, 842);
INSERT INTO public.games VALUES (30, 19, 437);
INSERT INTO public.games VALUES (31, 19, 145);
INSERT INTO public.games VALUES (32, 20, 825);
INSERT INTO public.games VALUES (33, 20, 668);
INSERT INTO public.games VALUES (34, 19, 706);
INSERT INTO public.games VALUES (35, 19, 29);
INSERT INTO public.games VALUES (36, 19, 770);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'y');
INSERT INTO public.users VALUES (2, 'user_1783701271926');
INSERT INTO public.users VALUES (3, 'user_1783701271925');
INSERT INTO public.users VALUES (4, 't');
INSERT INTO public.users VALUES (5, 'user_1783701508439');
INSERT INTO public.users VALUES (6, 'user_1783701508438');
INSERT INTO public.users VALUES (7, 'r');
INSERT INTO public.users VALUES (8, 'user_1783701647915');
INSERT INTO public.users VALUES (9, 'user_1783701647914');
INSERT INTO public.users VALUES (10, 'user_1783701734959');
INSERT INTO public.users VALUES (11, 'user_1783701734958');
INSERT INTO public.users VALUES (12, 'user_1783701784933');
INSERT INTO public.users VALUES (13, 'user_1783701784932');
INSERT INTO public.users VALUES (14, 'user_1783701822197');
INSERT INTO public.users VALUES (15, 'user_1783701822196');
INSERT INTO public.users VALUES (16, 'u');
INSERT INTO public.users VALUES (17, 'user_1783701938320');
INSERT INTO public.users VALUES (18, 'user_1783701938319');
INSERT INTO public.users VALUES (19, 'user_1783702001437');
INSERT INTO public.users VALUES (20, 'user_1783702001436');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 36, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 20, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

