--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- Name: app_version_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.app_version_status AS ENUM (
    'active',
    'nonactive'
);


ALTER TYPE public.app_version_status OWNER TO postgres;

--
-- Name: firmware_version_status; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.firmware_version_status AS ENUM (
    'active',
    'nonactive'
);


ALTER TYPE public.firmware_version_status OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    user_id uuid DEFAULT gen_random_uuid() NOT NULL,
    full_names text NOT NULL,
    username text,
    email text NOT NULL,
    password text NOT NULL,
    reset_token character varying(255),
    reset_token_expiration timestamp(6) without time zone,
    otp_verified boolean DEFAULT false,
    created_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    role_id uuid NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- Name: agreement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agreement (
    id smallint NOT NULL,
    agreement text,
    active boolean DEFAULT true NOT NULL,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    tooltip text
);


ALTER TABLE public.agreement OWNER TO postgres;

--
-- Name: agreement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.agreement_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.agreement_id_seq OWNER TO postgres;

--
-- Name: agreement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.agreement_id_seq OWNED BY public.agreement.id;


--
-- Name: app_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_version (
    description text NOT NULL,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    notes text,
    version text NOT NULL,
    app_version_status public.app_version_status DEFAULT 'active'::public.app_version_status NOT NULL
);


ALTER TABLE public.app_version OWNER TO postgres;

--
-- Name: colours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colours (
    color_id uuid DEFAULT gen_random_uuid() NOT NULL,
    color_code character varying(50) NOT NULL,
    code_number integer NOT NULL,
    created_at timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.colours OWNER TO postgres;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    address text,
    description text,
    phone character varying(15),
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: detail_experience; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detail_experience (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    stroboscopic_light smallint NOT NULL,
    audio_surround_sound smallint NOT NULL,
    vibro_acoustics smallint NOT NULL,
    led_intensity smallint NOT NULL,
    led_color smallint NOT NULL,
    sound_scape integer NOT NULL,
    infra_red_nea_ir smallint NOT NULL,
    infra_red_far_ir smallint NOT NULL,
    pemf_therapy boolean NOT NULL,
    olfactory_engagement boolean NOT NULL,
    binaural_beats_isochronic_tones boolean NOT NULL,
    direct_neutral_stimulation boolean NOT NULL,
    duration numeric(5,2) NOT NULL,
    created_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) with time zone,
    experience_id uuid NOT NULL,
    song text,
    video text
);


ALTER TABLE public.detail_experience OWNER TO postgres;

--
-- Name: experiences; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiences (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    link_class text NOT NULL,
    icon_class text NOT NULL,
    icon_name text NOT NULL,
    menu_name text NOT NULL,
    information text,
    active boolean DEFAULT true NOT NULL,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    deleted_at timestamp(6) without time zone,
    mode_id uuid,
    pod_id uuid
);


ALTER TABLE public.experiences OWNER TO postgres;

--
-- Name: experiences_properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experiences_properties (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    circle_line_color text NOT NULL,
    circle_line_width double precision NOT NULL,
    circle_fill_color text NOT NULL,
    circle_icon text NOT NULL,
    circle_caption text NOT NULL,
    circle_size double precision NOT NULL,
    enable_disable_session boolean NOT NULL,
    "order" smallint NOT NULL,
    tooltip text NOT NULL,
    icon text,
    created_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) with time zone,
    experience_id uuid NOT NULL
);


ALTER TABLE public.experiences_properties OWNER TO postgres;

--
-- Name: firmware_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.firmware_version (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    firmware_id text,
    light_version text,
    chair_version text,
    olvactory_version text,
    manual_controll_version text,
    air_condition_version text,
    volume_controll_version text,
    door_version text,
    firmware_version_status public.firmware_version_status DEFAULT 'active'::public.firmware_version_status NOT NULL,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.firmware_version OWNER TO postgres;

--
-- Name: group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."group" (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    group_name text,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."group" OWNER TO postgres;

--
-- Name: issues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.issues (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    fk_pod_id uuid NOT NULL,
    link_issue text,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.issues OWNER TO postgres;

--
-- Name: mode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mode (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    button_name text NOT NULL,
    disabled boolean DEFAULT false NOT NULL,
    active boolean DEFAULT true NOT NULL,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) with time zone
);


ALTER TABLE public.mode OWNER TO postgres;

--
-- Name: pod; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pod (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    url text NOT NULL,
    identification text NOT NULL,
    ip_address text NOT NULL,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    fk_app_version uuid NOT NULL,
    latitude text,
    longitude text,
    amplifier text,
    fk_customer uuid NOT NULL,
    mac_address_bluetooth text,
    pod_version text,
    serial_number text,
    server_version text,
    soundcard_name text,
    start_deploy timestamp(3) without time zone,
    fk_group_id uuid NOT NULL,
    fk_firmware_version uuid NOT NULL
);


ALTER TABLE public.pod OWNER TO postgres;

--
-- Name: podAdmin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."podAdmin" (
    "podId" uuid DEFAULT gen_random_uuid() NOT NULL,
    "group" text NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    location text NOT NULL,
    ip_address text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    deleted_at timestamp(3) without time zone
);


ALTER TABLE public."podAdmin" OWNER TO postgres;

--
-- Name: pod_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pod_history (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    fk_pod_id uuid NOT NULL,
    fk_pod_topic_id uuid NOT NULL,
    action text,
    value jsonb,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.pod_history OWNER TO postgres;

--
-- Name: pod_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pod_topics (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    module_name text,
    event_description text,
    topic text,
    action text,
    retain boolean,
    publish_example_value jsonb,
    subscribe_example_value jsonb,
    value_range text,
    remarks text,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    keyword text,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.pod_topics OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    user_id uuid DEFAULT gen_random_uuid() NOT NULL,
    role_name text NOT NULL,
    created_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: terms_and_conditions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.terms_and_conditions (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    terms_and_conditions text,
    active boolean DEFAULT true NOT NULL,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.terms_and_conditions OWNER TO postgres;

--
-- Name: terms_and_conditions_accepted; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.terms_and_conditions_accepted (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    fk_user_id uuid NOT NULL,
    accepted boolean DEFAULT false NOT NULL,
    accepted_date timestamp(6) with time zone,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.terms_and_conditions_accepted OWNER TO postgres;

--
-- Name: terms_and_conditions_answers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.terms_and_conditions_answers (
    id smallint NOT NULL,
    fk_user_id uuid NOT NULL,
    fk_question_id smallint NOT NULL,
    answer boolean DEFAULT false NOT NULL,
    answer_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.terms_and_conditions_answers OWNER TO postgres;

--
-- Name: terms_and_conditions_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.terms_and_conditions_answers_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.terms_and_conditions_answers_id_seq OWNER TO postgres;

--
-- Name: terms_and_conditions_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.terms_and_conditions_answers_id_seq OWNED BY public.terms_and_conditions_answers.id;


--
-- Name: terms_and_conditions_questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.terms_and_conditions_questions (
    id smallint NOT NULL,
    question text NOT NULL,
    information text,
    active boolean DEFAULT true NOT NULL,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    tooltip text
);


ALTER TABLE public.terms_and_conditions_questions OWNER TO postgres;

--
-- Name: terms_and_conditions_questions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.terms_and_conditions_questions_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.terms_and_conditions_questions_id_seq OWNER TO postgres;

--
-- Name: terms_and_conditions_questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.terms_and_conditions_questions_id_seq OWNED BY public.terms_and_conditions_questions.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    user_id uuid DEFAULT gen_random_uuid() NOT NULL,
    full_names text NOT NULL,
    username text,
    email text NOT NULL,
    password text NOT NULL,
    is_test_user boolean DEFAULT false,
    reset_token character varying(255),
    reset_token_expiration timestamp(6) without time zone,
    otp_verified boolean DEFAULT false,
    created_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: version_big_screen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.version_big_screen (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    file text NOT NULL,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    signature text,
    big_screen_version text,
    date_realese timestamp(3) without time zone,
    fk_app_version_id uuid NOT NULL
);


ALTER TABLE public.version_big_screen OWNER TO postgres;

--
-- Name: version_mobile_api; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.version_mobile_api (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    file text NOT NULL,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    signature text,
    mobile_api_version text,
    date_realese timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fk_app_version_id uuid NOT NULL
);


ALTER TABLE public.version_mobile_api OWNER TO postgres;

--
-- Name: version_small_screen; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.version_small_screen (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    file text NOT NULL,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    signature text,
    small_screen_version text,
    date_realese timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    fk_app_version_id uuid NOT NULL
);


ALTER TABLE public.version_small_screen OWNER TO postgres;

--
-- Name: agreement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement ALTER COLUMN id SET DEFAULT nextval('public.agreement_id_seq'::regclass);


--
-- Name: terms_and_conditions_answers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_and_conditions_answers ALTER COLUMN id SET DEFAULT nextval('public.terms_and_conditions_answers_id_seq'::regclass);


--
-- Name: terms_and_conditions_questions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_and_conditions_questions ALTER COLUMN id SET DEFAULT nextval('public.terms_and_conditions_questions_id_seq'::regclass);


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public._prisma_migrations VALUES ('7a52f14c-c26e-4c20-8b93-f8a17d683127', 'db53d327e07d4b8fef398df2802a513268079b665b1472b7df3c24594064838a', '2025-01-13 10:41:20.184404+08', '20250111040841_init', NULL, NULL, '2025-01-13 10:41:20.065488+08', 1);
INSERT INTO public._prisma_migrations VALUES ('257d5a7f-438d-4f66-89cc-35232e5a4a78', 'f3e56860fcab8fee491175b1b1c90ca8802c977e058e207eb0a28238a12734db', '2025-01-13 10:41:20.207834+08', '20250111062433_relation_pod_as_spread_sheet', NULL, NULL, '2025-01-13 10:41:20.185728+08', 1);
INSERT INTO public._prisma_migrations VALUES ('713db519-1306-4b7f-bfcc-4878d2216a6f', '27a7b662f5189d879bb7a557937abf04d2f4486ae4184ef54bb822974c4e41da', '2025-01-13 10:41:20.222921+08', '20250111064810_atribute_table', NULL, NULL, '2025-01-13 10:41:20.209141+08', 1);
INSERT INTO public._prisma_migrations VALUES ('80beb15a-bbac-4614-9d34-72bd31401abf', '698752460521bd0b43c7407b652171dc100dee9e93a81c4fcb40ca57b4e83d96', '2025-01-13 10:41:20.225573+08', '20250111072507_customer_table', NULL, NULL, '2025-01-13 10:41:20.223614+08', 1);
INSERT INTO public._prisma_migrations VALUES ('7967b053-b94f-4665-8207-0690b292c050', 'a7a22b839413dfacbf43872406030dc1234cc4731261dda9f873c4c6781ea874', '2025-01-13 10:41:20.229524+08', '20250112142134_group_name', NULL, NULL, '2025-01-13 10:41:20.226248+08', 1);
INSERT INTO public._prisma_migrations VALUES ('099556b0-06b3-4a33-bd48-f9ea351b5384', 'cafe73d267428b09afb56b1d2e8acb7c15c6a71c30ef86bf0148df42d54b5497', '2025-01-13 10:41:20.238887+08', '20250112143104_datatype_phonr', NULL, NULL, '2025-01-13 10:41:20.230165+08', 1);
INSERT INTO public._prisma_migrations VALUES ('43259b92-b993-48a8-ab44-f00a3220b3c2', 'dbbfff4c59814706d4b350059788cbc80ef56480c4519fa83da18d0b9b924e60', '2025-01-13 10:41:20.24714+08', '20250112143306_datatype_phone', NULL, NULL, '2025-01-13 10:41:20.239644+08', 1);
INSERT INTO public._prisma_migrations VALUES ('fa139598-5cc9-4fa2-a020-bdbc43871127', '0c257504590178eba5494d8efb2640549bee79c9e654b14ec49f3c3f85148cff', '2025-01-13 10:41:22.310237+08', '20250113024122_add_atribute_date', NULL, NULL, '2025-01-13 10:41:22.294264+08', 1);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: agreement; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: app_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.app_version VALUES ('ini misalnya versi pertama ya ges.. ', '2025-01-13 10:44:33.389+08', '2025-01-13 10:44:33.389+08', NULL, 'f6236271-a9d9-4604-a95f-da29726e23bb', 'ok ok ok', '1.2.0', 'active');


--
-- Data for Name: colours; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer VALUES ('2b120081-ac63-4990-bbd0-ee0ac005e262', 'dubai', 'tes ', '123456789101111', '2025-01-13 10:47:42.978678+08', NULL, '2025-01-13 10:47:42.978678+08');


--
-- Data for Name: detail_experience; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: experiences; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: experiences_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: firmware_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.firmware_version VALUES ('3d486e78-ecf7-4823-92dc-2a6c90db24b8', 'FIRMWARE001', 'Light v1.0', 'Chair v2.0', 'Olvactory v1.5', 'Manual v3.0', 'AC v4.1', 'Volume v2.2', 'Door v1.1', 'active', '2025-01-13 10:48:10.695074+08', NULL, '2025-01-13 10:48:10.695074+08');


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."group" VALUES ('1918d258-38c9-4932-9ec4-e1206497c55d', 'Group A', '2025-01-13 10:47:07.463965+08', NULL, '2025-01-13 10:47:07.463965+08');


--
-- Data for Name: issues; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: mode; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pod; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pod VALUES ('bd09c2ef-b615-4cf4-b77c-1d8d05c03555', 'POD001', 'Pod Device A', 'http://example.com', 'Pod Identification A', '192.168.1.1', '2025-01-13 10:48:13.719+08', '2025-01-13 10:48:13.719+08', NULL, 'f6236271-a9d9-4604-a95f-da29726e23bb', '12.345678', '98.765432', 'Amplifier A', '2b120081-ac63-4990-bbd0-ee0ac005e262', '00:11:22:33:44:55', '1.0.0', 'SN123456789', '1.0.0', 'SoundCard A', '2025-01-10 12:00:00', '1918d258-38c9-4932-9ec4-e1206497c55d', '3d486e78-ecf7-4823-92dc-2a6c90db24b8');


--
-- Data for Name: podAdmin; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pod_history; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pod_topics; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: terms_and_conditions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: terms_and_conditions_accepted; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: terms_and_conditions_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: terms_and_conditions_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: version_big_screen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.version_big_screen VALUES ('503976d3-7d8b-4b4f-8b76-e6cb75d78c3f', '1736736273366-448558784.jpg', '2025-01-13 10:44:33.389+08', '2025-01-13 10:44:33.389+08', NULL, 'signature_big_screen', '1.0.0', NULL, 'f6236271-a9d9-4604-a95f-da29726e23bb');


--
-- Data for Name: version_mobile_api; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.version_mobile_api VALUES ('f1684953-6403-4b68-8400-bddec7071623', '1736736273367-604275099.jpg', '2025-01-13 10:44:33.389+08', '2025-01-13 10:44:33.389+08', NULL, 'signature_mobile_api', '1.0.0', '2025-01-13 02:44:33.389', 'f6236271-a9d9-4604-a95f-da29726e23bb');


--
-- Data for Name: version_small_screen; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.version_small_screen VALUES ('84f9340f-34ad-4a27-a2da-bcb2aa67936f', '1736736273367-25435325.jpg', '2025-01-13 10:44:33.389+08', '2025-01-13 10:44:33.389+08', NULL, 'signature_small_screen', '1.0.0', '2025-01-13 02:44:33.389', 'f6236271-a9d9-4604-a95f-da29726e23bb');


--
-- Name: agreement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agreement_id_seq', 1, false);


--
-- Name: terms_and_conditions_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.terms_and_conditions_answers_id_seq', 1, false);


--
-- Name: terms_and_conditions_questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.terms_and_conditions_questions_id_seq', 1, false);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (user_id);


--
-- Name: agreement agreement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement
    ADD CONSTRAINT agreement_pkey PRIMARY KEY (id);


--
-- Name: app_version app_version_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_version
    ADD CONSTRAINT app_version_pkey PRIMARY KEY (id);


--
-- Name: colours colours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colours
    ADD CONSTRAINT colours_pkey PRIMARY KEY (color_id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: detail_experience detail_experience_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_experience
    ADD CONSTRAINT detail_experience_pkey PRIMARY KEY (id);


--
-- Name: experiences experiences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences
    ADD CONSTRAINT experiences_pkey PRIMARY KEY (id);


--
-- Name: experiences_properties experiences_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences_properties
    ADD CONSTRAINT experiences_properties_pkey PRIMARY KEY (id);


--
-- Name: firmware_version firmware_version_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firmware_version
    ADD CONSTRAINT firmware_version_pkey PRIMARY KEY (id);


--
-- Name: group group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT group_pkey PRIMARY KEY (id);


--
-- Name: issues issues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_pkey PRIMARY KEY (id);


--
-- Name: mode mode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mode
    ADD CONSTRAINT mode_pkey PRIMARY KEY (id);


--
-- Name: podAdmin podAdmin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."podAdmin"
    ADD CONSTRAINT "podAdmin_pkey" PRIMARY KEY ("podId");


--
-- Name: pod_history pod_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pod_history
    ADD CONSTRAINT pod_history_pkey PRIMARY KEY (id);


--
-- Name: pod pod_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pod
    ADD CONSTRAINT pod_pkey PRIMARY KEY (id);


--
-- Name: pod_topics pod_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pod_topics
    ADD CONSTRAINT pod_topics_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (user_id);


--
-- Name: terms_and_conditions_accepted terms_and_conditions_accepted_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_and_conditions_accepted
    ADD CONSTRAINT terms_and_conditions_accepted_pkey PRIMARY KEY (id);


--
-- Name: terms_and_conditions_answers terms_and_conditions_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_and_conditions_answers
    ADD CONSTRAINT terms_and_conditions_answers_pkey PRIMARY KEY (id);


--
-- Name: terms_and_conditions terms_and_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_and_conditions
    ADD CONSTRAINT terms_and_conditions_pkey PRIMARY KEY (id);


--
-- Name: terms_and_conditions_questions terms_and_conditions_questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_and_conditions_questions
    ADD CONSTRAINT terms_and_conditions_questions_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- Name: version_big_screen version_big_screen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.version_big_screen
    ADD CONSTRAINT version_big_screen_pkey PRIMARY KEY (id);


--
-- Name: version_mobile_api version_mobile_api_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.version_mobile_api
    ADD CONSTRAINT version_mobile_api_pkey PRIMARY KEY (id);


--
-- Name: version_small_screen version_small_screen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.version_small_screen
    ADD CONSTRAINT version_small_screen_pkey PRIMARY KEY (id);


--
-- Name: admin_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX admin_email_key ON public.admin USING btree (email);


--
-- Name: agreement_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX agreement_idx ON public.agreement USING btree (id, agreement);


--
-- Name: detail_experience_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX detail_experience_idx ON public.detail_experience USING btree (id);


--
-- Name: experience_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX experience_idx ON public.experiences USING btree (id);


--
-- Name: mode_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mode_idx ON public.mode USING btree (id, button_name);


--
-- Name: pod_history_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pod_history_idx ON public.pod_history USING btree (id, fk_pod_topic_id);


--
-- Name: pod_topics_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pod_topics_idx ON public.pod_topics USING btree (id);


--
-- Name: terms_and_conditions_accepted_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX terms_and_conditions_accepted_idx ON public.terms_and_conditions_accepted USING btree (id, fk_user_id);


--
-- Name: terms_and_conditions_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX terms_and_conditions_idx ON public.terms_and_conditions USING btree (id, terms_and_conditions);


--
-- Name: terms_and_conditions_questions_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX terms_and_conditions_questions_idx ON public.terms_and_conditions_questions USING btree (id, active);


--
-- Name: user_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_email_key ON public."user" USING btree (email);


--
-- Name: user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_idx ON public."user" USING btree (user_id, username);


--
-- Name: admin admin_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(user_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: detail_experience detail_experience_experience_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detail_experience
    ADD CONSTRAINT detail_experience_experience_id_fkey FOREIGN KEY (experience_id) REFERENCES public.experiences(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: experiences experiences_mode_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences
    ADD CONSTRAINT experiences_mode_id_fkey FOREIGN KEY (mode_id) REFERENCES public.mode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: experiences experiences_pod_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences
    ADD CONSTRAINT experiences_pod_id_fkey FOREIGN KEY (pod_id) REFERENCES public.pod(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: experiences_properties experiences_properties_experience_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experiences_properties
    ADD CONSTRAINT experiences_properties_experience_id_fkey FOREIGN KEY (experience_id) REFERENCES public.experiences(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pod_history fk_pod_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pod_history
    ADD CONSTRAINT fk_pod_id FOREIGN KEY (fk_pod_id) REFERENCES public.pod(id);


--
-- Name: pod_history fk_pod_topic_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pod_history
    ADD CONSTRAINT fk_pod_topic_id FOREIGN KEY (fk_pod_topic_id) REFERENCES public.pod_topics(id);


--
-- Name: terms_and_conditions_answers fk_question; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_and_conditions_answers
    ADD CONSTRAINT fk_question FOREIGN KEY (fk_question_id) REFERENCES public.terms_and_conditions_questions(id);


--
-- Name: terms_and_conditions_answers fk_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_and_conditions_answers
    ADD CONSTRAINT fk_user FOREIGN KEY (fk_user_id) REFERENCES public."user"(user_id);


--
-- Name: issues issues_fk_pod_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.issues
    ADD CONSTRAINT issues_fk_pod_id_fkey FOREIGN KEY (fk_pod_id) REFERENCES public.pod(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pod pod_fk_app_version_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pod
    ADD CONSTRAINT pod_fk_app_version_fkey FOREIGN KEY (fk_app_version) REFERENCES public.app_version(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pod pod_fk_customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pod
    ADD CONSTRAINT pod_fk_customer_fkey FOREIGN KEY (fk_customer) REFERENCES public.customer(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pod pod_fk_firmware_version_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pod
    ADD CONSTRAINT pod_fk_firmware_version_fkey FOREIGN KEY (fk_firmware_version) REFERENCES public.firmware_version(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: pod pod_fk_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pod
    ADD CONSTRAINT pod_fk_group_id_fkey FOREIGN KEY (fk_group_id) REFERENCES public."group"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: terms_and_conditions_accepted user_id_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_and_conditions_accepted
    ADD CONSTRAINT user_id_foreign_key FOREIGN KEY (fk_user_id) REFERENCES public."user"(user_id);


--
-- Name: version_big_screen version_big_screen_fk_app_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.version_big_screen
    ADD CONSTRAINT version_big_screen_fk_app_version_id_fkey FOREIGN KEY (fk_app_version_id) REFERENCES public.app_version(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: version_mobile_api version_mobile_api_fk_app_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.version_mobile_api
    ADD CONSTRAINT version_mobile_api_fk_app_version_id_fkey FOREIGN KEY (fk_app_version_id) REFERENCES public.app_version(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: version_small_screen version_small_screen_fk_app_version_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.version_small_screen
    ADD CONSTRAINT version_small_screen_fk_app_version_id_fkey FOREIGN KEY (fk_app_version_id) REFERENCES public.app_version(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

