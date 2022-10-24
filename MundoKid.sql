--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

-- Started on 2022-10-21 21:46:00

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

DROP DATABASE "MundoKid";
--
-- TOC entry 3331 (class 1262 OID 16799)
-- Name: MundoKid; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "MundoKid" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Spanish_Argentina.1252';


ALTER DATABASE "MundoKid" OWNER TO postgres;

\connect "MundoKid"

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
-- TOC entry 3332 (class 0 OID 0)
-- Dependencies: 3331
-- Name: DATABASE "MundoKid"; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE "MundoKid" IS 'BD de MundoKid, empresa de alquiler de articulos para fiestas infantiles';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 16800)
-- Name: articulos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articulos (
    id bigint NOT NULL,
    nombre character varying(40),
    categoria character(2),
    subcategoria character varying(10),
    stock integer,
    precio real,
    imagen_url character varying(100)
);


ALTER TABLE public.articulos OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16842)
-- Name: Id_articulo; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Id_articulo"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999999999
    CACHE 1;


ALTER TABLE public."Id_articulo" OWNER TO postgres;

--
-- TOC entry 3333 (class 0 OID 0)
-- Dependencies: 212
-- Name: Id_articulo; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Id_articulo" OWNED BY public.articulos.id;


--
-- TOC entry 210 (class 1259 OID 16805)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categorias (
    id_categoria character(2) NOT NULL,
    desc_categoria character varying(15)
);


ALTER TABLE public.categorias OWNER TO postgres;

--
-- TOC entry 3334 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE categorias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.categorias IS 'Categorias de Articulos en alquiler';


--
-- TOC entry 211 (class 1259 OID 16816)
-- Name: subcategorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subcategorias (
    id_subcategoria character varying(10) NOT NULL,
    id_categoria character(2),
    desc_subcategoria character varying(40)
);


ALTER TABLE public.subcategorias OWNER TO postgres;

--
-- TOC entry 3335 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE subcategorias; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.subcategorias IS 'Subcategorias de articulos en alquiler';


--
-- TOC entry 3322 (class 0 OID 16800)
-- Dependencies: 209
-- Data for Name: articulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (1, 'pb6-1', 'pb', 'pb6', 1, 0, 'pb6-1');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (2, 'pb6-2', 'pb', 'pb6', 1, 0, 'pb6-2');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (3, 'pb6-3', 'pb', 'pb6', 1, 0, 'pb6-3');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (4, 'pb6-4', 'pb', 'pb6', 1, 0, 'pb6-4');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (5, 'pb6-5', 'pb', 'pb6', 1, 0, 'pb6-5');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (6, 'pb6-6', 'pb', 'pb6', 1, 0, 'pb6-6');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (7, 'pb6-7', 'pb', 'pb6', 1, 0, 'pb6-7');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (8, 'pb6-8', 'pb', 'pb6', 1, 0, 'pb6-8');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (9, 'pb6-9', 'pb', 'pb6', 1, 0, 'pb6-9');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (10, 'pb8-1', 'pb', 'pb8', 1, 0, 'pb8-1');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (11, 'pb8-2', 'pb', 'pb8', 1, 0, 'pb8-2');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (12, 'pb8-3', 'pb', 'pb8', 1, 0, 'pb8-3');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (13, 'pb8-4', 'pb', 'pb8', 1, 0, 'pb8-4');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (14, 'pb8-5', 'pb', 'pb8', 1, 0, 'pb8-5');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (15, 'pb8-6', 'pb', 'pb8', 1, 0, 'pb8-6');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (16, 'pb8-7', 'pb', 'pb8', 1, 0, 'pb8-7');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (17, 'pb8-8', 'pb', 'pb8', 1, 0, 'pb8-8');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (18, 'pb10-1', 'pb', 'pb10', 1, 0, 'pb10-1');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (19, 'pb10-2', 'pb', 'pb10', 1, 0, 'pb10-2');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (20, 'pb10-3', 'pb', 'pb10', 1, 0, 'pb10-3');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (21, 'pb10-4', 'pb', 'pb10', 1, 0, 'pb10-4');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (22, 'pb10-5', 'pb', 'pb10', 1, 0, 'pb10-5');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (23, 'pb10-6', 'pb', 'pb10', 1, 0, 'pb10-6');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (24, 'pb10-7', 'pb', 'pb10', 1, 0, 'pb10-7');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (25, 'pb10-8', 'pb', 'pb10', 1, 0, 'pb10-8');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (26, 'pbgde-1', 'pb', 'pbgde', 1, 0, 'pbgde-1');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (27, 'pbgde-2', 'pb', 'pbgde', 1, 0, 'pbgde-2');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (28, 'pbgde-3', 'pb', 'pbgde', 1, 0, 'pbgde-3');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (29, 'pbgde-4', 'pb', 'pbgde', 1, 0, 'pbgde-4');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (30, 'pbgde-5', 'pb', 'pbgde', 1, 0, 'pbgde-5');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (31, 'pbgde-6', 'pb', 'pbgde', 1, 0, 'pbgde-6');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (32, 'pbgde-7', 'pb', 'pbgde', 1, 0, 'pbgde-7');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (33, 'pbgde-8', 'pb', 'pbgde', 1, 0, 'pbgde-8');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (34, 'pbbaby-1', 'pb', 'pbbaby', 1, 0, 'pbbaby-1');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (35, 'in2y5-1', 'in', 'in2y5', 1, 0, 'in2y5-1');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (36, 'in2y5-2', 'in', 'in2y5', 1, 0, 'in2y5-2');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (37, 'in2y5-3', 'in', 'in2y5', 1, 0, 'in2y5-3');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (38, 'in2y5-4', 'in', 'in2y5', 1, 0, 'in2y5-4');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (39, 'in2y5-5', 'in', 'in2y5', 1, 0, 'in2y5-5');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (40, 'in2y5-6', 'in', 'in2y5', 1, 0, 'in2y5-6');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (41, 'in2y5-7', 'in', 'in2y5', 1, 0, 'in2y5-7');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (42, 'in2y5-8', 'in', 'in2y5', 1, 0, 'in2y5-8');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (43, 'in2y5-9', 'in', 'in2y5', 1, 0, 'in2y5-9');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (44, 'in3x3-1', 'in', 'in3x3', 1, 0, 'in3x3-1');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (45, 'in3x3-2', 'in', 'in3x3', 1, 0, 'in3x3-2');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (46, 'in3x3-3', 'in', 'in3x3', 1, 0, 'in3x3-3');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (47, 'in3x3-4', 'in', 'in3x3', 1, 0, 'in3x3-4');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (48, 'in3x3-5', 'in', 'in3x3', 1, 0, 'in3x3-5');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (49, 'in3x3-6', 'in', 'in3x3', 1, 0, 'in3x3-6');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (50, 'in3x3-7', 'in', 'in3x3', 1, 0, 'in3x3-7');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (51, 'in3x3-8', 'in', 'in3x3', 1, 0, 'in3x3-8');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (52, 'in3x3-9', 'in', 'in3x3', 1, 0, 'in3x3-9');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (53, 'in3x6-1', 'in', 'in3x6', 1, 0, 'in3x6-1');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (54, 'in3x6-2', 'in', 'in3x6', 1, 0, 'in3x6-2');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (55, 'in3x6-3', 'in', 'in3x6', 1, 0, 'in3x6-3');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (56, 'in3x6-4', 'in', 'in3x6', 1, 0, 'in3x6-4');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (57, 'in3x6-5', 'in', 'in3x6', 1, 0, 'in3x6-5');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (58, 'in3x6-6', 'in', 'in3x6', 1, 0, 'in3x6-6');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (59, 'in3x6-7', 'in', 'in3x6', 1, 0, 'in3x6-7');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (60, 'metegol-1', 'ju', 'metegol', 1, 0, 'metegol-1');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (61, 'metegol-2', 'ju', 'metegol', 1, 0, 'metegol-2');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (62, 'metegol-3', 'ju', 'metegol', 1, 0, 'metegol-3');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (63, 'metegol-4', 'ju', 'metegol', 1, 0, 'metegol-4');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (64, 'metegol-5', 'ju', 'metegol', 1, 0, 'metegol-5');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (65, 'metegol-6', 'ju', 'metegol', 1, 0, 'metegol-6');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (66, 'metegol-7', 'ju', 'metegol', 1, 0, 'metegol-7');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (67, 'metegol-8', 'ju', 'metegol', 1, 0, 'metegol-8');
INSERT INTO public.articulos (id, nombre, categoria, subcategoria, stock, precio, imagen_url) VALUES (68, 'pingpong-1', 'ju', 'pingpong', 1, 0, 'ping-pong-1');
--
-- TOC entry 3323 (class 0 OID 16805)
-- Dependencies: 210
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categorias (id_categoria, desc_categoria) VALUES ('pb', 'Plaza Blanda');
INSERT INTO public.categorias (id_categoria, desc_categoria) VALUES ('in', 'Inflables');
INSERT INTO public.categorias (id_categoria, desc_categoria) VALUES ('ju', 'Juegos');


--
-- TOC entry 3324 (class 0 OID 16816)
-- Dependencies: 211
-- Data for Name: subcategorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.subcategorias (id_subcategoria, id_categoria, desc_subcategoria) VALUES ('pb6', 'pb', 'Plaza Blanda 6 Elementos');
INSERT INTO public.subcategorias (id_subcategoria, id_categoria, desc_subcategoria) VALUES ('pb8', 'pb', 'Plaza Blanda 8 Elementos');
INSERT INTO public.subcategorias (id_subcategoria, id_categoria, desc_subcategoria) VALUES ('pb10', 'pb', 'Plaza Blanda 10 Elementos');
INSERT INTO public.subcategorias (id_subcategoria, id_categoria, desc_subcategoria) VALUES ('pbgde', 'pb', 'Plaza Blanda Grande');
INSERT INTO public.subcategorias (id_subcategoria, id_categoria, desc_subcategoria) VALUES ('pbbaby', 'pb', 'Plaza Blanda Baby');
INSERT INTO public.subcategorias (id_subcategoria, id_categoria, desc_subcategoria) VALUES ('in2y5', 'in', 'Inflable chico 2,5 x 2.5');
INSERT INTO public.subcategorias (id_subcategoria, id_categoria, desc_subcategoria) VALUES ('in3x3', 'in', 'Inflable Mediano 3x3');
INSERT INTO public.subcategorias (id_subcategoria, id_categoria, desc_subcategoria) VALUES ('in3x6', 'in', 'Inflable Grande 3x6 con Tobogán');
INSERT INTO public.subcategorias (id_subcategoria, id_categoria, desc_subcategoria) VALUES ('metegol', 'ju', 'Metegol');
INSERT INTO public.subcategorias (id_subcategoria, id_categoria, desc_subcategoria) VALUES ('tejo', 'ju', 'Juego de Tejo');
INSERT INTO public.subcategorias (id_subcategoria, id_categoria, desc_subcategoria) VALUES ('sapo', 'ju', 'Juego de Sapo');
INSERT INTO public.subcategorias (id_subcategoria, id_categoria, desc_subcategoria) VALUES ('pingpong', 'ju', 'Mini Mesa de Ping Pong');
INSERT INTO public.subcategorias (id_subcategoria, id_categoria, desc_subcategoria) VALUES ('red', 'ju', 'Red para Fútbol Tenis');


--
-- TOC entry 3336 (class 0 OID 0)
-- Dependencies: 212
-- Name: Id_articulo; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Id_articulo"', 1, false);


--
-- TOC entry 3173 (class 2606 OID 16834)
-- Name: articulos articulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulos
    ADD CONSTRAINT articulos_pkey PRIMARY KEY (id);


--
-- TOC entry 3178 (class 2606 OID 16809)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 3180 (class 2606 OID 16820)
-- Name: subcategorias subcategorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategorias
    ADD CONSTRAINT subcategorias_pkey PRIMARY KEY (id_subcategoria);


--
-- TOC entry 3174 (class 1259 OID 16826)
-- Name: fki_a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_a ON public.articulos USING btree (categoria);


--
-- TOC entry 3175 (class 1259 OID 16815)
-- Name: fki_categoria_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_categoria_fkey ON public.articulos USING btree (categoria);


--
-- TOC entry 3176 (class 1259 OID 16832)
-- Name: fki_subcategoria_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_subcategoria_fkey ON public.articulos USING btree (subcategoria);


--
-- TOC entry 3181 (class 2606 OID 16821)
-- Name: articulos categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulos
    ADD CONSTRAINT categoria_fkey FOREIGN KEY (categoria) REFERENCES public.categorias(id_categoria) NOT VALID;


--
-- TOC entry 3182 (class 2606 OID 16827)
-- Name: articulos subcategoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.articulos
    ADD CONSTRAINT subcategoria_fkey FOREIGN KEY (subcategoria) REFERENCES public.subcategorias(id_subcategoria) NOT VALID;


-- Completed on 2022-10-21 21:46:00

--
-- PostgreSQL database dump complete
--

