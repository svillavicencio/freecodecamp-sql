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
    name character varying(60) NOT NULL,
    description text,
    total_stars integer NOT NULL,
    distance_from_earth numeric(15,3)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    distance_from_earth numeric(15,3) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    distance_from_earth numeric(15,3),
    total_planets integer NOT NULL,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'A', 'GALAXY A', 1563, 654654.456);
INSERT INTO public.galaxy VALUES (2, 'B', 'GALAXY B', 1523, 65224654.456);
INSERT INTO public.galaxy VALUES (3, 'C', 'GALAXY C', 13, 64.456);
INSERT INTO public.galaxy VALUES (4, 'D', 'GALAXY D', 163, 54654.456);
INSERT INTO public.galaxy VALUES (5, 'E', 'GALAXY E', 1322, 54654.456);
INSERT INTO public.galaxy VALUES (6, 'F', 'GALAXY F', 151163, 62254654.456);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 5, 'El único satélite natural de la Tierra, responsable de las mareas.', 384.400);
INSERT INTO public.moon VALUES (22, 'Fobos', 6, 'La luna más grande de Marte, con una órbita cercana a su superficie.', 9.378);
INSERT INTO public.moon VALUES (23, 'Deimos', 6, 'La luna más pequeña de Marte, con una órbita más lejana.', 23.460);
INSERT INTO public.moon VALUES (24, 'Europa', 7, 'Un satélite helado de Júpiter que podría tener un océano subterráneo.', 628.300);
INSERT INTO public.moon VALUES (25, 'Ganímedes', 7, 'El satélite más grande del sistema solar, orbitando Júpiter.', 1.070);
INSERT INTO public.moon VALUES (26, 'Calisto', 7, 'Un satélite de Júpiter con una superficie densamente craterizada.', 1.883);
INSERT INTO public.moon VALUES (27, 'Ío', 7, 'La luna volcánica más activa del sistema solar, orbitando Júpiter.', 628.300);
INSERT INTO public.moon VALUES (28, 'Titán', 8, 'El satélite más grande de Saturno, con una atmósfera espesa.', 1.222);
INSERT INTO public.moon VALUES (29, 'Encélado', 8, 'Un satélite de Saturno conocido por sus géiseres de agua helada.', 1.272);
INSERT INTO public.moon VALUES (30, 'Mimas', 8, 'Una luna de Saturno con un cráter gigante que le da aspecto de "estrella de la muerte".', 1.250);
INSERT INTO public.moon VALUES (31, 'Tritón', 9, 'El satélite más grande de Neptuno, conocido por su órbita retrógrada.', 4.501);
INSERT INTO public.moon VALUES (32, 'Nereida', 9, 'Una luna de Neptuno con una órbita extremadamente elíptica.', 5.513);
INSERT INTO public.moon VALUES (33, 'Charon', 10, 'El satélite más grande de Plutón, casi un sistema binario.', 7.530);
INSERT INTO public.moon VALUES (34, 'Styx', 10, 'Una pequeña luna en el sistema de Plutón.', 7.550);
INSERT INTO public.moon VALUES (35, 'Kepler-22b I', 11, 'Un posible satélite del exoplaneta Kepler-22b.', 620.000);
INSERT INTO public.moon VALUES (36, 'Kepler-22b II', 11, 'Otro satélite hipotético de Kepler-22b.', 630.000);
INSERT INTO public.moon VALUES (37, 'Proxima b I', 12, 'Un satélite en el sistema de Proxima Centauri.', 4.246);
INSERT INTO public.moon VALUES (38, 'Trappist-1e I', 13, 'Un satélite de un planeta en la zona habitable de Trappist-1.', 39.500);
INSERT INTO public.moon VALUES (39, 'Trappist-1e II', 13, 'Otro satélite del planeta Trappist-1e.', 39.600);
INSERT INTO public.moon VALUES (40, 'Gliese 581g I', 12, 'Un posible satélite del exoplaneta Gliese 581g.', 20.300);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (5, 'Mercurio', 1, false, true, 'El planeta más cercano al Sol y uno de los más pequeños del sistema solar.');
INSERT INTO public.planet VALUES (6, 'Venus', 1, false, true, 'Un planeta extremadamente caliente con una atmósfera densa.');
INSERT INTO public.planet VALUES (7, 'Tierra', 2, true, true, 'Nuestro planeta, único conocido con vida.');
INSERT INTO public.planet VALUES (8, 'Marte', 2, false, true, 'Conocido como el planeta rojo debido a su color característico.');
INSERT INTO public.planet VALUES (9, 'Júpiter', 3, false, true, 'El planeta más grande del sistema solar, con una gran mancha roja.');
INSERT INTO public.planet VALUES (10, 'Saturno', 3, false, true, 'Famoso por sus impresionantes anillos.');
INSERT INTO public.planet VALUES (11, 'Urano', 4, false, true, 'Un planeta helado con un eje de rotación inclinado.');
INSERT INTO public.planet VALUES (12, 'Neptuno', 4, false, true, 'El planeta más lejano del sistema solar, con fuertes vientos.');
INSERT INTO public.planet VALUES (13, 'Kepler-22b', 5, true, true, 'Un exoplaneta que podría ser habitable.');
INSERT INTO public.planet VALUES (14, 'Proxima b', 6, true, true, 'Un planeta rocoso en órbita alrededor de Proxima Centauri.');
INSERT INTO public.planet VALUES (15, 'Trappist-1e', 6, true, true, 'Un planeta en la zona habitable del sistema Trappist-1.');
INSERT INTO public.planet VALUES (16, 'Gliese 581g', 5, true, true, 'Un exoplaneta potencialmente habitable en la constelación de Libra.');


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestre', 'Planetas rocosos como la Tierra, que tienen una superficie sólida y son principalmente compuestos de silicatos y metales.');
INSERT INTO public.planet_type VALUES (2, 'Gaseoso', 'Planetas gigantes como Júpiter y Saturno, compuestos principalmente de hidrógeno y helio, sin una superficie sólida definida.');
INSERT INTO public.planet_type VALUES (3, 'Hieloso', 'Planetas o lunas con una superficie predominantemente de agua congelada o dióxido de carbono, con temperaturas extremadamente bajas.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 3, 8.611, 2, 'La estrella más brillante del cielo nocturno.');
INSERT INTO public.star VALUES (2, 'Betelgeuse', 5, 642.500, 1, 'Una supergigante roja ubicada en la constelación de Orión.');
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 1, 4.246, 0, 'La estrella más cercana al sistema solar.');
INSERT INTO public.star VALUES (4, 'Rigel', 4, 863.000, 3, 'Una estrella azul brillante en la constelación de Orión.');
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 2, 4.367, 1, 'Forma parte del sistema estelar Alpha Centauri.');
INSERT INTO public.star VALUES (6, 'Vega', 6, 25.050, 0, 'Una de las estrellas más luminosas en el cielo nocturno.');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 40, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 16, true);


--
-- Name: planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

