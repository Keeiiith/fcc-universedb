--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(100) NOT NULL,
    rotation_speed integer,
    description text,
    galaxy_type character varying(100) NOT NULL
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
-- Name: meteor; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.meteor (
    meteor_id integer NOT NULL,
    name character varying(100) NOT NULL,
    speed numeric NOT NULL,
    planet_id integer NOT NULL,
    impact boolean NOT NULL,
    meteor_type character varying(100)
);


ALTER TABLE public.meteor OWNER TO freecodecamp;

--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.meteor_meteor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meteor_meteor_id_seq OWNER TO freecodecamp;

--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.meteor_meteor_id_seq OWNED BY public.meteor.meteor_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    has_water boolean NOT NULL,
    planet_id integer NOT NULL,
    presence_of_life boolean,
    moon_size numeric
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
    name character varying(100) NOT NULL,
    population numeric,
    presence_of_life boolean DEFAULT false NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(100),
    distance_from_sun numeric,
    mass numeric
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_radius integer NOT NULL,
    star_color character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(100),
    distance_from_galaxy numeric
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
-- Name: meteor meteor_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor ALTER COLUMN meteor_id SET DEFAULT nextval('public.meteor_meteor_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 230, 'A large spiral galaxy', 'Spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 300, 'Elliptical galaxy', 'Elliptical');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 150, 'Spiral galaxy', 'Spiral');
INSERT INTO public.galaxy VALUES (4, 'Messier 82', 200, 'Irregular galaxy', 'Irregular');
INSERT INTO public.galaxy VALUES (5, 'NGC 1300', 250, 'Barred spiral galaxy', 'Barred spiral');
INSERT INTO public.galaxy VALUES (6, 'NGC 5866', 220, 'Lenticular galaxy', 'Lenticular');


--
-- Data for Name: meteor; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.meteor VALUES (1, 'Meteor A', 54000, 1, true, 'Asteroid');
INSERT INTO public.meteor VALUES (2, 'Meteor B', 67000, 2, false, 'Comet');
INSERT INTO public.meteor VALUES (3, 'Meteor C', 54000, 3, true, 'Asteroid');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 1, true, 3474.8);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 2, false, 11.0);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 2, false, 6.2);
INSERT INTO public.moon VALUES (4, 'Europa', true, 4, true, 3121.6);
INSERT INTO public.moon VALUES (5, 'Titan', true, 5, true, 5150.0);
INSERT INTO public.moon VALUES (6, 'Io', false, 4, false, 3643.2);
INSERT INTO public.moon VALUES (7, 'Callisto', false, 4, false, 4821.6);
INSERT INTO public.moon VALUES (8, 'Ganymede', false, 4, false, 5262.4);
INSERT INTO public.moon VALUES (9, 'Enceladus', true, 5, true, 504.2);
INSERT INTO public.moon VALUES (10, 'Mimas', false, 5, false, 396.0);
INSERT INTO public.moon VALUES (11, 'Triton', true, 6, true, 2706.6);
INSERT INTO public.moon VALUES (12, 'Charon', false, 9, false, 1212.0);
INSERT INTO public.moon VALUES (13, 'Rhea', false, 5, false, 1528.0);
INSERT INTO public.moon VALUES (14, 'Iapetus', false, 5, false, 1469.0);
INSERT INTO public.moon VALUES (15, 'Miranda', false, 6, false, 471.0);
INSERT INTO public.moon VALUES (16, 'Umbriel', false, 6, false, 584.0);
INSERT INTO public.moon VALUES (17, 'Ariel', false, 6, false, 1157.0);
INSERT INTO public.moon VALUES (18, 'Titania', false, 6, false, 1577.0);
INSERT INTO public.moon VALUES (19, 'Oberon', false, 6, false, 1523.0);
INSERT INTO public.moon VALUES (20, 'Pan', true, 3, true, 15.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 7800000000, true, 1, 'Rocky', 1, 5972000000000000000000000);
INSERT INTO public.planet VALUES (2, 'Mars', 0, false, 1, 'Rocky', 1.5, 641700000000000000000000);
INSERT INTO public.planet VALUES (3, 'Venus', 0, false, 1, 'Rocky', 0.72, 4867000000000000000000000);
INSERT INTO public.planet VALUES (4, 'Jupiter', 0, false, 2, 'Gas Giant', 5.2, 1898000000000000000000000000);
INSERT INTO public.planet VALUES (5, 'Saturn', 0, false, 2, 'Gas Giant', 9.5, 568300000000000000000000000);
INSERT INTO public.planet VALUES (6, 'Uranus', 0, false, 2, 'Ice Giant', 19.2, 86810000000000000000000000);
INSERT INTO public.planet VALUES (7, 'Neptune', 0, false, 2, 'Ice Giant', 30.1, 102400000000000000000000000);
INSERT INTO public.planet VALUES (8, 'Mercury', 0, false, 1, 'Rocky', 0.39, 330100000000000000000000);
INSERT INTO public.planet VALUES (9, 'Pluto', 0, false, 2, 'Dwarf Planet', 39.5, 13030000000000000000000);
INSERT INTO public.planet VALUES (10, 'Ceres', 0, false, 2, 'Dwarf Planet', 2.7, 938350000000000000000);
INSERT INTO public.planet VALUES (11, 'Eris', 0, false, 2, 'Dwarf Planet', 96.4, 16600000000000000000000);
INSERT INTO public.planet VALUES (12, 'Haumea', 0, false, 2, 'Dwarf Planet', 43.1, 40075000000000000000000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 695700, 'Yellow', 1, 'Main Sequence', 0);
INSERT INTO public.star VALUES (2, 'Sirius', 1000000, 'Blue', 2, 'Main Sequence', 8.6);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1500000, 'Red', 3, 'Red Supergiant', 642);
INSERT INTO public.star VALUES (4, 'Altair', 850000, 'White', 4, 'Main Sequence', 16.7);
INSERT INTO public.star VALUES (5, 'Rigel', 1200000, 'Blue', 5, 'Supergiant', 863);
INSERT INTO public.star VALUES (6, 'Alpha Centauri', 450000, 'Yellow', 6, 'Main Sequence', 4.37);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.meteor_meteor_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: meteor meteor_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_name_key UNIQUE (name);


--
-- Name: meteor meteor_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_pkey PRIMARY KEY (meteor_id);


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
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: meteor fk_planet_meteor; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT fk_planet_meteor FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

