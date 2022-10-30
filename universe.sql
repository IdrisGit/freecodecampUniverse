--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    type text,
    length_in_ly numeric(8,0),
    sc_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    is_spherical boolean,
    tidal_locked boolean,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    has_life boolean,
    no_moons integer,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: sc; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sc (
    sc_id integer NOT NULL,
    name character varying(60) NOT NULL,
    no_galaxies integer
);


ALTER TABLE public.sc OWNER TO freecodecamp;

--
-- Name: sc_sc_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sc_sc_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sc_sc_id_seq OWNER TO freecodecamp;

--
-- Name: sc_sc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sc_sc_id_seq OWNED BY public.sc.sc_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    size character varying(20),
    has_planets boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: sc sc_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sc ALTER COLUMN sc_id SET DEFAULT nextval('public.sc_sc_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 52850, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 110000, 1);
INSERT INTO public.galaxy VALUES (3, 'Sagittarius Dwarf Elliptical', 'Elliptical Loop', 65230, 1);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'Dwarf Irregular', 199000, 1);
INSERT INTO public.galaxy VALUES (5, 'Canis Major Overdensity', 'Dwarf Irregular', 25000, 1);
INSERT INTO public.galaxy VALUES (6, 'NGC 4911', 'Spiral', 230000, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Earth Moon', true, true, 1);
INSERT INTO public.moon VALUES (2, 'Deimons', false, true, 4);
INSERT INTO public.moon VALUES (3, 'Phobos', false, true, 4);
INSERT INTO public.moon VALUES (4, 'Lo', true, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', true, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', true, true, 5);
INSERT INTO public.moon VALUES (8, 'Hyperion', false, false, 6);
INSERT INTO public.moon VALUES (9, 'Phoebe', false, false, 6);
INSERT INTO public.moon VALUES (10, 'Mimas', true, true, 6);
INSERT INTO public.moon VALUES (11, 'Lapetus', true, true, 5);
INSERT INTO public.moon VALUES (12, 'Titan', true, true, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', true, true, 6);
INSERT INTO public.moon VALUES (14, 'Ariel', true, true, 7);
INSERT INTO public.moon VALUES (15, 'Oberon', true, true, 7);
INSERT INTO public.moon VALUES (16, 'Puck', true, true, 7);
INSERT INTO public.moon VALUES (17, 'Rosalind', true, true, 7);
INSERT INTO public.moon VALUES (18, 'Titania', true, true, 7);
INSERT INTO public.moon VALUES (19, 'Umbriel', true, true, 7);
INSERT INTO public.moon VALUES (20, 'Triton', true, true, 8);
INSERT INTO public.moon VALUES (21, 'Proteus', false, true, 8);
INSERT INTO public.moon VALUES (22, 'Galatea', true, true, 8);
INSERT INTO public.moon VALUES (23, 'Hippocamp', true, true, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', false, 0, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 80, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 83, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 14, 1);
INSERT INTO public.planet VALUES (9, 'TOI-1452b', false, NULL, 5);
INSERT INTO public.planet VALUES (10, 'WASP-39b', false, NULL, 6);
INSERT INTO public.planet VALUES (11, 'HIP 13044b', false, NULL, 7);
INSERT INTO public.planet VALUES (12, '14 Andromedae b', false, NULL, 8);


--
-- Data for Name: sc; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sc VALUES (1, 'Laniakea', 150000);
INSERT INTO public.sc VALUES (2, 'Saraswati', 43);
INSERT INTO public.sc VALUES (3, 'Coma', 3000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Average', true, 1);
INSERT INTO public.star VALUES (2, 'Antares', 'Red Supergiant', false, 1);
INSERT INTO public.star VALUES (3, 'UY Scuti', 'Red Hypergiant', false, 1);
INSERT INTO public.star VALUES (4, 'KW Sagittarii', 'Red Hypergiant', false, 1);
INSERT INTO public.star VALUES (5, 'TOI-1452', 'Red Dwarf', true, 1);
INSERT INTO public.star VALUES (6, 'WASP-39', 'Average', true, 1);
INSERT INTO public.star VALUES (7, 'HIP 13044', 'Red Giant', true, 2);
INSERT INTO public.star VALUES (8, '14 Andromedae', 'Orange Dwarf', true, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: sc_sc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sc_sc_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_name_key UNIQUE (name);


--
-- Name: planet planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_pkey PRIMARY KEY (planet_id);


--
-- Name: sc sc_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sc
    ADD CONSTRAINT sc_name_key UNIQUE (name);


--
-- Name: sc sc_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sc
    ADD CONSTRAINT sc_pkey PRIMARY KEY (sc_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_sc_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_sc_id_fkey FOREIGN KEY (sc_id) REFERENCES public.sc(sc_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planets_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planets_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

