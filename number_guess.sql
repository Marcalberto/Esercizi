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
    gamer character varying(22) NOT NULL,
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (37, 'Alb', 5);
INSERT INTO public.games VALUES (38, 'user_1795549132131', 843);
INSERT INTO public.games VALUES (39, 'user_1795549132131', 124);
INSERT INTO public.games VALUES (40, 'user_1795549132130', 90);
INSERT INTO public.games VALUES (41, 'user_1795549132130', 402);
INSERT INTO public.games VALUES (42, 'user_1795549132131', 317);
INSERT INTO public.games VALUES (43, 'user_1795549132131', 86);
INSERT INTO public.games VALUES (44, 'user_1795549132131', 279);
INSERT INTO public.games VALUES (45, 'user_1795549185280', 527);
INSERT INTO public.games VALUES (46, 'user_1795549185280', 127);
INSERT INTO public.games VALUES (47, 'user_1795549185279', 531);
INSERT INTO public.games VALUES (48, 'user_1795549185279', 153);
INSERT INTO public.games VALUES (49, 'user_1795549185280', 955);
INSERT INTO public.games VALUES (50, 'user_1795549185280', 784);
INSERT INTO public.games VALUES (51, 'user_1795549185280', 349);
INSERT INTO public.games VALUES (52, 'user_1795549680654', 188);
INSERT INTO public.games VALUES (53, 'user_1795549680654', 793);
INSERT INTO public.games VALUES (54, 'user_1795549680653', 80);
INSERT INTO public.games VALUES (55, 'user_1795549680653', 523);
INSERT INTO public.games VALUES (56, 'user_1795549680654', 458);
INSERT INTO public.games VALUES (57, 'user_1795549680654', 380);
INSERT INTO public.games VALUES (58, 'user_1795549680654', 662);
INSERT INTO public.games VALUES (59, 'user_1795549704913', 630);
INSERT INTO public.games VALUES (60, 'user_1795549704913', 986);
INSERT INTO public.games VALUES (61, 'user_1795549704912', 839);
INSERT INTO public.games VALUES (62, 'user_1795549704912', 277);
INSERT INTO public.games VALUES (63, 'user_1795549704913', 395);
INSERT INTO public.games VALUES (64, 'user_1795549704913', 529);
INSERT INTO public.games VALUES (65, 'user_1795549704913', 782);
INSERT INTO public.games VALUES (66, 'user_1795549771676', 49);
INSERT INTO public.games VALUES (67, 'user_1795549771676', 668);
INSERT INTO public.games VALUES (68, 'user_1795549771675', 611);
INSERT INTO public.games VALUES (69, 'user_1795549771675', 685);
INSERT INTO public.games VALUES (70, 'user_1795549771676', 136);
INSERT INTO public.games VALUES (71, 'user_1795549771676', 930);
INSERT INTO public.games VALUES (72, 'user_1795549771676', 833);
INSERT INTO public.games VALUES (73, 'user_1795549815935', 305);
INSERT INTO public.games VALUES (74, 'user_1795549815935', 759);
INSERT INTO public.games VALUES (75, 'user_1795549815934', 104);
INSERT INTO public.games VALUES (76, 'user_1795549815934', 260);
INSERT INTO public.games VALUES (77, 'user_1795549815935', 154);
INSERT INTO public.games VALUES (78, 'user_1795549815935', 31);
INSERT INTO public.games VALUES (79, 'user_1795549815935', 822);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 79, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- PostgreSQL database dump complete
--

