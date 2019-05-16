--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7 (Ubuntu 10.7-1.pgdg18.04+1)
-- Dumped by pg_dump version 10.7 (Ubuntu 10.7-1.pgdg18.04+1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO admin;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO admin;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO admin;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO admin;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO admin;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO admin;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO admin;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: criterios_barco; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.criterios_barco (
    id integer NOT NULL,
    matricula character varying(50) NOT NULL,
    casco character varying(50) NOT NULL,
    regimen character varying(50) NOT NULL,
    tipo character varying(50) NOT NULL,
    eslora numeric(5,2) NOT NULL,
    manga numeric(5,2) NOT NULL,
    puntal numeric(5,2) NOT NULL,
    csv_id integer
);


ALTER TABLE public.criterios_barco OWNER TO admin;

--
-- Name: criterios_barco_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.criterios_barco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.criterios_barco_id_seq OWNER TO admin;

--
-- Name: criterios_barco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.criterios_barco_id_seq OWNED BY public.criterios_barco.id;


--
-- Name: criterios_condicion; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.criterios_condicion (
    "idCondicion" integer NOT NULL,
    nombre character varying(200) NOT NULL,
    porcentaje integer NOT NULL,
    "isSelected" boolean NOT NULL,
    ponderado numeric(5,4) NOT NULL,
    "idCriterio_id" integer NOT NULL
);


ALTER TABLE public.criterios_condicion OWNER TO admin;

--
-- Name: criterios_condicion_idCondicion_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."criterios_condicion_idCondicion_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."criterios_condicion_idCondicion_seq" OWNER TO admin;

--
-- Name: criterios_condicion_idCondicion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."criterios_condicion_idCondicion_seq" OWNED BY public.criterios_condicion."idCondicion";


--
-- Name: criterios_criterio; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.criterios_criterio (
    "idCriterio" integer NOT NULL,
    nombre character varying(200) NOT NULL,
    children integer NOT NULL,
    porcentaje integer NOT NULL,
    nivel integer NOT NULL,
    "multipleOptions" boolean NOT NULL,
    "idCriterioPadre_id" integer
);


ALTER TABLE public.criterios_criterio OWNER TO admin;

--
-- Name: criterios_criterio_idCriterio_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."criterios_criterio_idCriterio_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."criterios_criterio_idCriterio_seq" OWNER TO admin;

--
-- Name: criterios_criterio_idCriterio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."criterios_criterio_idCriterio_seq" OWNED BY public.criterios_criterio."idCriterio";


--
-- Name: criterios_csv; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.criterios_csv (
    "idCSV" integer NOT NULL,
    "nombreArchivo" character varying(50) NOT NULL,
    eliminados1 integer NOT NULL,
    eliminados2 integer NOT NULL,
    eliminados3 integer NOT NULL,
    eliminados4 integer NOT NULL
);


ALTER TABLE public.criterios_csv OWNER TO admin;

--
-- Name: criterios_csv_idCSV_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."criterios_csv_idCSV_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."criterios_csv_idCSV_seq" OWNER TO admin;

--
-- Name: criterios_csv_idCSV_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."criterios_csv_idCSV_seq" OWNED BY public.criterios_csv."idCSV";


--
-- Name: criterios_formulario; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.criterios_formulario (
    "idFormulario" integer NOT NULL,
    "nombreFormulario" character varying(100) NOT NULL,
    tipo character varying(50) NOT NULL,
    nivel character varying(50) NOT NULL,
    ponderado character varying(5),
    condiciones character varying(100),
    usuario_id integer
);


ALTER TABLE public.criterios_formulario OWNER TO admin;

--
-- Name: criterios_formulario_idFormulario_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public."criterios_formulario_idFormulario_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."criterios_formulario_idFormulario_seq" OWNER TO admin;

--
-- Name: criterios_formulario_idFormulario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public."criterios_formulario_idFormulario_seq" OWNED BY public.criterios_formulario."idFormulario";


--
-- Name: criterios_usuario; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.criterios_usuario (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    usuario character varying(100) NOT NULL,
    dni character varying(8) NOT NULL,
    correo character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    instituto character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.criterios_usuario OWNER TO admin;

--
-- Name: criterios_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.criterios_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.criterios_usuario_id_seq OWNER TO admin;

--
-- Name: criterios_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.criterios_usuario_id_seq OWNED BY public.criterios_usuario.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO admin;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO admin;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO admin;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO admin;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: criterios_barco id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_barco ALTER COLUMN id SET DEFAULT nextval('public.criterios_barco_id_seq'::regclass);


--
-- Name: criterios_condicion idCondicion; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_condicion ALTER COLUMN "idCondicion" SET DEFAULT nextval('public."criterios_condicion_idCondicion_seq"'::regclass);


--
-- Name: criterios_criterio idCriterio; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_criterio ALTER COLUMN "idCriterio" SET DEFAULT nextval('public."criterios_criterio_idCriterio_seq"'::regclass);


--
-- Name: criterios_csv idCSV; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_csv ALTER COLUMN "idCSV" SET DEFAULT nextval('public."criterios_csv_idCSV_seq"'::regclass);


--
-- Name: criterios_formulario idFormulario; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_formulario ALTER COLUMN "idFormulario" SET DEFAULT nextval('public."criterios_formulario_idFormulario_seq"'::regclass);


--
-- Name: criterios_usuario id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_usuario ALTER COLUMN id SET DEFAULT nextval('public.criterios_usuario_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add csv	1	add_csv
2	Can change csv	1	change_csv
3	Can delete csv	1	delete_csv
4	Can view csv	1	view_csv
5	Can add usuario	2	add_usuario
6	Can change usuario	2	change_usuario
7	Can delete usuario	2	delete_usuario
8	Can view usuario	2	view_usuario
9	Can add formulario	3	add_formulario
10	Can change formulario	3	change_formulario
11	Can delete formulario	3	delete_formulario
12	Can view formulario	3	view_formulario
13	Can add criterio	4	add_criterio
14	Can change criterio	4	change_criterio
15	Can delete criterio	4	delete_criterio
16	Can view criterio	4	view_criterio
17	Can add condicion	5	add_condicion
18	Can change condicion	5	change_condicion
19	Can delete condicion	5	delete_condicion
20	Can view condicion	5	view_condicion
21	Can add barco	6	add_barco
22	Can change barco	6	change_barco
23	Can delete barco	6	delete_barco
24	Can view barco	6	view_barco
25	Can add log entry	7	add_logentry
26	Can change log entry	7	change_logentry
27	Can delete log entry	7	delete_logentry
28	Can view log entry	7	view_logentry
29	Can add permission	8	add_permission
30	Can change permission	8	change_permission
31	Can delete permission	8	delete_permission
32	Can view permission	8	view_permission
33	Can add group	9	add_group
34	Can change group	9	change_group
35	Can delete group	9	delete_group
36	Can view group	9	view_group
37	Can add user	10	add_user
38	Can change user	10	change_user
39	Can delete user	10	delete_user
40	Can view user	10	view_user
41	Can add content type	11	add_contenttype
42	Can change content type	11	change_contenttype
43	Can delete content type	11	delete_contenttype
44	Can view content type	11	view_contenttype
45	Can add session	12	add_session
46	Can change session	12	change_session
47	Can delete session	12	delete_session
48	Can view session	12	view_session
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$oRj6a7nQl3dt$TujPK0Gp5GvPqnqO18AMqouXd/oxylmlu6L4TrvLMOg=	2019-05-16 12:43:57.536537-05	t	admin			mguerrav@unsa.edu.pe	t	t	2019-05-16 11:53:41.092295-05
2	pbkdf2_sha256$150000$EB4rPs5CPWgV$Di8qAsMVCtSaulUXULwO3hx/QB7FU+8MLiWODHISUJY=	\N	f	MarGue	MARIA ALEXANDRA	GUERRA	mguerrav@unsa.edu.pe	f	t	2019-05-16 12:48:47.348672-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: criterios_barco; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.criterios_barco (id, matricula, casco, regimen, tipo, eslora, manga, puntal, csv_id) FROM stdin;
\.


--
-- Data for Name: criterios_condicion; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.criterios_condicion ("idCondicion", nombre, porcentaje, "isSelected", ponderado, "idCriterio_id") FROM stdin;
2	Permanente	40	f	0.0121	25
3	Temporal	60	f	0.0182	25
4	Local y de Otras Caletas	30	f	0.0045	26
5	Local Solamente	70	f	0.0106	26
6	Alta	40	f	0.0061	27
7	Baja	60	f	0.0091	27
8	Pesca de Alta Variedad	30	f	0.0091	28
9	Pesca Monoespecifica	70	f	0.0212	28
10	Pesca exclusiva	35	f	0.0053	29
11	Alterna la pesca con otras actividades	65	f	0.0098	29
12	Lanchas y naves mayores	40	f	0.0121	30
13	Embarcaciones Menores	60	f	0.0182	30
14	Alto Volumen > 30%	25	f	0.0113	31
15	Volumen Medio <30; >20	35	f	0.0159	31
16	Volumen Bajo	40	f	0.0182	31
17	Alto numero	40	f	0.0303	32
18	Bajo numero	60	f	0.0454	32
19	Alto numero	35	f	0.0159	33
20	Bajo numero	65	f	0.0295	33
21	Urbana	35	f	0.0116	34
22	Rural	65	f	0.0215	34
23	Pavimentadas	40	f	0.0132	35
24	Trocha carrosable	60	f	0.0198	35
25	No disponen	60	f	0.0132	36
26	Limitado	30	f	0.0066	36
27	Amplia area disponible	10	f	0.0022	36
28	Alta	20	f	0.0022	37
29	Baja	30	f	0.0033	37
30	Nula	50	f	0.0055	37
31	Positiva	10	f	0.0011	38
32	Nula	40	f	0.0044	38
33	Negativa	50	f	0.0055	38
34	Local e Intermediados	30	f	0.0062	39
35	Local	70	f	0.0144	39
36	Grupal	30	f	0.0041	40
37	Individual	70	f	0.0096	40
38	Proyectos PNIPA en ejecucion	25	f	0.0052	41
39	Concesion de acuicultura	25	f	0.0052	41
40	Planta  de proceso	25	f	0.0052	41
41	Restaurante	25	f	0.0052	41
42	Administracion o Gestion	33	f	0.0068	42
43	Comercializacion	34	f	0.0070	42
44	Manipuleo y Proceso	33	f	0.0068	42
45	Fuerte	30	f	0.0165	43
46	Debil	70	f	0.0385	43
47	Aseo	20	f	0.0014	44
48	Deporte	20	f	0.0014	44
49	Fiscalizacion	20	f	0.0014	44
50	Ordenamiento	20	f	0.0014	44
51	Organizacion Grupal	20	f	0.0014	44
52	Muelle	5	f	0.0056	45
53	Varadero	5	f	0.0056	45
54	Zona de abrigo	20	f	0.0225	45
55	Explanada de Trabajo	30	f	0.0338	45
56	Panioles o bodegas	40	f	0.0450	45
57	Camara de Refrigeracion	5	f	0.0045	46
58	Planta de procesamiento primario	5	f	0.0045	46
59	Oficinas de administracion	5	f	0.0045	46
60	Puestos de Venta	5	f	0.0045	46
61	Redes de incendio	10	f	0.0090	46
62	Comisaria	10	f	0.0090	46
63	Local social y sede	10	f	0.0090	46
64	Servicio de Combustible	10	f	0.0090	46
65	Talleres	20	f	0.0180	46
66	Galpon	20	f	0.0180	46
67	Planta de Hielo	40	f	0.0270	47
68	Winche	30	f	0.0203	47
69	Grupo electrogeno y pluma	30	f	0.0203	47
70	Agua potable	20	f	0.0135	48
71	Electricidad	20	f	0.0135	48
72	Alcantarillado	20	f	0.0135	48
73	Comunicaciones	15	f	0.0101	48
74	Posta sanitaria	15	f	0.0101	48
75	Agencia Bancaria	10	f	0.0068	48
76	Amplia	30	f	0.0203	49
77	Escasa	70	f	0.0473	49
78	Con mantenimiento	30	f	0.0135	50
79	Muy Deterioradas	70	f	0.0315	50
\.


--
-- Data for Name: criterios_criterio; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.criterios_criterio ("idCriterio", nombre, children, porcentaje, nivel, "multipleOptions", "idCriterioPadre_id") FROM stdin;
19	General	3	55	0	f	\N
20	Infraestructura y Servicios	1	45	0	f	\N
21	Operacionales	9	55	1	f	19
22	Entorno	5	20	1	f	19
23	Organizacion	6	25	1	f	19
24	Infraestructura y Servicio	6	100	1	f	20
25	Actividad	2	10	2	f	21
26	Punto de Desembarque	2	5	2	f	21
27	Migracion de pescadores de la caleta	2	5	2	f	21
28	Diversidad de Recursos desembarcados	2	10	2	f	21
29	Diversidad de actividades del Pescador	2	5	2	f	21
30	Tipo de embarcaciones en la caleta	2	10	2	f	21
31	Volumenes de desembarque	3	15	2	f	21
32	Numero de Pescadores	2	25	2	f	21
33	Numero de Embarcaciones	2	15	2	f	21
34	Localizacion	2	30	2	f	22
35	Vias de acceso	2	30	2	f	22
36	Disponibilidad de terreno para intervencion de mejoras	3	20	2	f	22
37	Actividad turistica aledania	3	10	2	f	22
38	Relacion de la caleta con el turismo	3	10	2	f	22
39	Comercializacion	2	15	2	f	23
40	Tipo de Comercializacion	2	10	2	f	23
41	Otras actividades que no realizan	4	15	2	t	23
42	Cursos de capacitacion no realizados	3	15	2	t	23
43	Comportamiento organizacional	2	40	2	f	23
44	Comisiones y actividades en otras áreas que no se practican en las caletas	5	5	2	t	23
45	Infraestructura portuaria existente	5	25	2	t	24
46	Infraestructura Complementaria que disponen	10	20	2	t	24
47	Equipos que no poseen	3	15	2	t	24
48	Servicios basicos que no dispone la caleta	6	15	2	t	24
49	Disponibilidad de espacio en la caleta	2	15	2	t	24
50	Estado de Infraestructura Existente	2	10	2	t	24
\.


--
-- Data for Name: criterios_csv; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.criterios_csv ("idCSV", "nombreArchivo", eliminados1, eliminados2, eliminados3, eliminados4) FROM stdin;
\.


--
-- Data for Name: criterios_formulario; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.criterios_formulario ("idFormulario", "nombreFormulario", tipo, nivel, ponderado, condiciones, usuario_id) FROM stdin;
\.


--
-- Data for Name: criterios_usuario; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.criterios_usuario (id, nombre, apellido, usuario, dni, correo, password, instituto, user_id) FROM stdin;
1	MARIA ALEXANDRA	GUERRA	MarGue	72975699	mguerrav@unsa.edu.pe	prueba1	UNSA	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	criterios	csv
2	criterios	usuario
3	criterios	formulario
4	criterios	criterio
5	criterios	condicion
6	criterios	barco
7	admin	logentry
8	auth	permission
9	auth	group
10	auth	user
11	contenttypes	contenttype
12	sessions	session
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-05-16 11:39:07.145988-05
2	auth	0001_initial	2019-05-16 11:39:07.583181-05
3	admin	0001_initial	2019-05-16 11:39:08.33385-05
4	admin	0002_logentry_remove_auto_add	2019-05-16 11:39:08.55047-05
5	admin	0003_logentry_add_action_flag_choices	2019-05-16 11:39:08.563253-05
6	contenttypes	0002_remove_content_type_name	2019-05-16 11:39:08.596466-05
7	auth	0002_alter_permission_name_max_length	2019-05-16 11:39:08.61154-05
8	auth	0003_alter_user_email_max_length	2019-05-16 11:39:08.634404-05
9	auth	0004_alter_user_username_opts	2019-05-16 11:39:08.651597-05
10	auth	0005_alter_user_last_login_null	2019-05-16 11:39:08.665246-05
11	auth	0006_require_contenttypes_0002	2019-05-16 11:39:08.67278-05
12	auth	0007_alter_validators_add_error_messages	2019-05-16 11:39:08.688947-05
13	auth	0008_alter_user_username_max_length	2019-05-16 11:39:08.744295-05
14	auth	0009_alter_user_last_name_max_length	2019-05-16 11:39:08.777152-05
15	auth	0010_alter_group_name_max_length	2019-05-16 11:39:08.795702-05
16	auth	0011_update_proxy_permissions	2019-05-16 11:39:08.813215-05
17	criterios	0001_initial	2019-05-16 11:39:09.198456-05
18	sessions	0001_initial	2019-05-16 11:39:09.506731-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
qz2n1q7z8ggz92k2cmj2oicv6b9y09ou	OGRkOTczOTg5NzYxMWI2NDQ1YjlkNjJkODZlN2QwNDgzNTk3ZWJkODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NWYyNjBlMWZmODcxMTllYmE1MTQzZWRkZjIyMjk3NGI4NDE5ZTlhIn0=	2019-05-30 12:43:57.587082-05
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: criterios_barco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.criterios_barco_id_seq', 1, false);


--
-- Name: criterios_condicion_idCondicion_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."criterios_condicion_idCondicion_seq"', 79, true);


--
-- Name: criterios_criterio_idCriterio_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."criterios_criterio_idCriterio_seq"', 50, true);


--
-- Name: criterios_csv_idCSV_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."criterios_csv_idCSV_seq"', 1, false);


--
-- Name: criterios_formulario_idFormulario_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public."criterios_formulario_idFormulario_seq"', 1, false);


--
-- Name: criterios_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.criterios_usuario_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 18, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: criterios_barco criterios_barco_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_barco
    ADD CONSTRAINT criterios_barco_pkey PRIMARY KEY (id);


--
-- Name: criterios_condicion criterios_condicion_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_condicion
    ADD CONSTRAINT criterios_condicion_pkey PRIMARY KEY ("idCondicion");


--
-- Name: criterios_criterio criterios_criterio_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_criterio
    ADD CONSTRAINT criterios_criterio_pkey PRIMARY KEY ("idCriterio");


--
-- Name: criterios_csv criterios_csv_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_csv
    ADD CONSTRAINT criterios_csv_pkey PRIMARY KEY ("idCSV");


--
-- Name: criterios_formulario criterios_formulario_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_formulario
    ADD CONSTRAINT criterios_formulario_pkey PRIMARY KEY ("idFormulario");


--
-- Name: criterios_usuario criterios_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_usuario
    ADD CONSTRAINT criterios_usuario_pkey PRIMARY KEY (id);


--
-- Name: criterios_usuario criterios_usuario_user_id_key; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_usuario
    ADD CONSTRAINT criterios_usuario_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: criterios_barco_csv_id_0c8d295a; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX criterios_barco_csv_id_0c8d295a ON public.criterios_barco USING btree (csv_id);


--
-- Name: criterios_condicion_idCriterio_id_67f017b4; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "criterios_condicion_idCriterio_id_67f017b4" ON public.criterios_condicion USING btree ("idCriterio_id");


--
-- Name: criterios_criterio_idCriterioPadre_id_2850987f; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "criterios_criterio_idCriterioPadre_id_2850987f" ON public.criterios_criterio USING btree ("idCriterioPadre_id");


--
-- Name: criterios_formulario_usuario_id_7c7592b1; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX criterios_formulario_usuario_id_7c7592b1 ON public.criterios_formulario USING btree (usuario_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: criterios_barco criterios_barco_csv_id_0c8d295a_fk_criterios_csv_idCSV; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_barco
    ADD CONSTRAINT "criterios_barco_csv_id_0c8d295a_fk_criterios_csv_idCSV" FOREIGN KEY (csv_id) REFERENCES public.criterios_csv("idCSV") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: criterios_condicion criterios_condicion_idCriterio_id_67f017b4_fk_criterios; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_condicion
    ADD CONSTRAINT "criterios_condicion_idCriterio_id_67f017b4_fk_criterios" FOREIGN KEY ("idCriterio_id") REFERENCES public.criterios_criterio("idCriterio") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: criterios_criterio criterios_criterio_idCriterioPadre_id_2850987f_fk_criterios; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_criterio
    ADD CONSTRAINT "criterios_criterio_idCriterioPadre_id_2850987f_fk_criterios" FOREIGN KEY ("idCriterioPadre_id") REFERENCES public.criterios_criterio("idCriterio") DEFERRABLE INITIALLY DEFERRED;


--
-- Name: criterios_formulario criterios_formulario_usuario_id_7c7592b1_fk_criterios; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_formulario
    ADD CONSTRAINT criterios_formulario_usuario_id_7c7592b1_fk_criterios FOREIGN KEY (usuario_id) REFERENCES public.criterios_usuario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: criterios_usuario criterios_usuario_user_id_ba173f37_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.criterios_usuario
    ADD CONSTRAINT criterios_usuario_user_id_ba173f37_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

