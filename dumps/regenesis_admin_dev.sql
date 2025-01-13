--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2 (Debian 17.2-1.pgdg120+1)
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
    big_screen text,
    small_screen text,
    mobil_api text,
    description text,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    id uuid DEFAULT gen_random_uuid() NOT NULL
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
    fk_group_id text NOT NULL,
    "group" text NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    url text NOT NULL,
    identification text NOT NULL,
    password text NOT NULL,
    username text NOT NULL,
    ip_address text NOT NULL,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    location text NOT NULL,
    fk_app_version uuid NOT NULL
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

INSERT INTO public._prisma_migrations VALUES ('eedd2024-ca39-4a2a-b827-0bd2fbc1a4fc', 'def1125ccd23413d8f4c6c832313b609ecc612342f7cc98f6d95e52a7a3c1545', '2025-01-09 02:58:57.005172+00', '20250109025856_version_tabel', NULL, NULL, '2025-01-09 02:58:56.870556+00', 1);
INSERT INTO public._prisma_migrations VALUES ('4e366120-bf35-49e2-bfd5-d240e9ded8b8', '0139fbe1b01535c11bbf4366db3d6ab33734eb325198efe357c38bb2c2e6f8b9', '2025-01-09 03:32:12.990312+00', '20250109033212_tabel_version_id', NULL, NULL, '2025-01-09 03:32:12.931688+00', 1);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: agreement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.agreement VALUES (1, ' You can review and update your Profile Information, Password, and Disclaimer / User Agreement in your General Settings & Preference area. Just look out for the settings cog icon on the Homepage.', true, '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);


--
-- Data for Name: app_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.app_version VALUES ('1.0.0', '1.0.0', '1.0.0', 'Initial release', '2025-01-09 03:33:27.92458+00', '2025-01-09 03:33:27.92458+00', NULL, 'b1f93e74-8b6e-4b0c-8765-12c546e56e2a');


--
-- Data for Name: colours; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: detail_experience; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.detail_experience VALUES ('0f0c5e50-be42-4eb1-801d-a1cd74bb3895', 100, 100, 22, 22, 22, 100, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, '5349ac0f-6992-465a-ac7c-c626baf7fbdd', 'ad76fcdb-6468-45c2-ac28-05d53f9d5249.mp3', '37ff8a65-75d6-4f04-9e9c-c89339393382.mp4');
INSERT INTO public.detail_experience VALUES ('e75fb755-64ef-4768-abe3-b58f759b4578', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, '2c45bb68-dcf0-4acd-bb9e-de4b8ca647c5', 'c94b96c0-60ca-4513-96c2-015cd757cfea.mp3', '400fd2e4-294b-4c2a-a2ba-ee424188afd1.mp4');
INSERT INTO public.detail_experience VALUES ('375aecbb-209d-4395-a824-952c0a0339c9', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-21 03:46:50.549+00', '2025-01-06 03:44:58.476+00', NULL, '34d3be3f-5e0a-48b7-8d51-0484e3962013', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('5f9bfa6c-499c-4bc7-80bd-a9ade229193d', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-21 03:46:50.549+00', '2025-01-06 03:44:58.476+00', NULL, '04815f17-aa81-4cb6-b712-758f311a50b8', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('e868c4b4-91fe-4203-be5b-9187b2ce6bb9', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-21 03:46:50.549+00', '2025-01-06 03:44:58.476+00', NULL, 'f8cffb95-969d-48c1-97eb-38603e0a27c7', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('0b9aa2e9-250a-42a9-9d8f-dbce5a5b24e4', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 08:18:16.4+00', '2025-01-06 03:44:58.476+00', NULL, '013a9f17-642c-42b4-83c3-be97002e518f', '6ce3b654-1697-496c-b1ea-0bc28a996f03.txt', '12238afb-41ee-433f-b5af-48a373005609.txt');
INSERT INTO public.detail_experience VALUES ('39a18e2b-166c-48de-9d98-a8c111d479b0', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, '04815f17-aa81-4cb6-b712-758f311a50b8', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('acc452a6-1bff-4974-bca0-08baf3c4579a', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, '34d3be3f-5e0a-48b7-8d51-0484e3962013', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('0e10eb6c-11fa-4b2a-95f9-054ec3891331', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, '9cae08fa-6f2b-435c-bac8-8169e9935879', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('f2d5693e-45dc-49f2-a386-d57d71f47d71', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, 'f8cffb95-969d-48c1-97eb-38603e0a27c7', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('238777a3-2ec7-4eab-81db-34fbf1bd0fe7', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, '013a9f17-642c-42b4-83c3-be97002e518f', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('97ed1632-df13-4a60-a811-736a239ce5b7', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, '47d526a2-eaa3-4326-94d9-3f606eecef86', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('3f50bd4d-50ce-4c51-931d-61436ef4f337', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, '4a7d6152-b882-4b3a-a372-3ef35820205a', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('739f4cca-115c-4fb2-8dda-49539ea24e5e', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, '5c00f0f5-6715-41ec-bc2f-d55f7f5c5839', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('66258892-1216-4217-8534-f2e3490087ea', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, 'fc245401-ca69-4382-947f-3c1af337a81d', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('bd2f3e2d-fdb4-41cd-a4cb-76d6e1eb3437', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-21 07:06:40.828+00', '2025-01-06 03:44:58.476+00', NULL, '9cae08fa-6f2b-435c-bac8-8169e9935879', '6077425a-572d-4d60-96df-d91902bea955.mp4', 'cf5433e5-af97-46d7-a74e-fc6d11070e6c.mp4');
INSERT INTO public.detail_experience VALUES ('8420647e-1d2b-4272-a787-dba4122fe343', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, 'cc9602d4-90b6-4d61-910b-bc0b70a39ec5', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('bd2d7908-718e-4422-b4ac-4070f7c64cfb', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, '41523ce0-3cef-473b-99e4-bc51e49cdd56', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('70c801af-39ba-4b3d-90f2-c4976d7e7e79', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-21 03:46:50.549+00', '2025-01-06 03:44:58.476+00', NULL, '9f224399-eaf2-4196-9ce2-6d8319d7c00b', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('e7f28693-4b35-43d1-a61c-cd7f1d510aef', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, '9f224399-eaf2-4196-9ce2-6d8319d7c00b', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('c3ace9d8-d206-4887-8b13-28cf27e7caf0', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, '558d152a-579d-4096-94dc-cbe287b8899d', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('510d8e25-8d21-48c6-b756-75fddbcb2743', 22, 22, 22, 22, 22, 22, 22, 22, false, false, false, false, 20.00, '2025-01-07 05:34:26.875+00', '2025-01-07 05:34:26.879+00', NULL, '448279d0-d3fa-43f9-953b-fe3801b445e8', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('26f1a5a5-7d0f-4135-946b-1212e55bc2c0', 22, 22, 22, 22, 22, 22, 22, 22, false, false, false, false, 20.00, '2025-01-07 05:34:27+00', '2025-01-07 05:34:27.002+00', NULL, 'baf53bf3-c945-41c0-afa4-7cad6a6566a5', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('e2973d9e-403e-45bf-995d-dcd1b33d8bef', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, '08291601-5776-438e-aef5-32f5cf740ee7', '8c683cf4-b231-4288-9603-79ba9d46a934.mp3', '1361d3a7-a94a-4a3e-8eab-d783954d10b0.mp4');
INSERT INTO public.detail_experience VALUES ('00947463-afc9-415a-bf12-62e310ce37fb', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, 'e9f9abd7-3c90-49ea-8695-8cfb2c425bba', '5b199493-4d39-4f6c-9acc-edf8b9db1748.mp3', '033bbf31-7205-4b62-b69e-3b81de96e9b1.mp4');
INSERT INTO public.detail_experience VALUES ('f9b5a90a-30ad-46a1-8079-11281665ceb3', 100, 100, 100, 100, 100, 100, 100, 100, false, false, false, false, 100.00, '2025-01-08 02:47:11.892+00', '2025-01-08 02:47:11.892+00', NULL, 'e9f9abd7-3c90-49ea-8695-8cfb2c425bba', '0ed5d2de-59ab-4cf4-8b64-15fdf8056cc2.mp3', '72b95a59-f76b-401a-a2d8-a1037c054917.mp4');
INSERT INTO public.detail_experience VALUES ('e418c5ee-9ec5-4611-be03-83097a1e443b', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, '063c224b-2fa7-4fa5-b5ad-a656e2d152b8', '0cc6a7e8-98c1-44e8-90de-df912390c8c0.mp3', 'be1edbd2-ed96-4125-af05-1dee76398116.mp4');
INSERT INTO public.detail_experience VALUES ('257f2c93-8b89-47f6-91fc-07ba1a76fe2b', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, 'd5be6619-e483-4c0b-a40a-da742226dd1b', '72482be5-d873-421f-b098-7882d3a2e128.mp3', '96ed6c76-659b-4e77-b360-019dd0063795.mp4');
INSERT INTO public.detail_experience VALUES ('1016aa91-ed14-4001-bad0-7e0a3e7ed02f', 33, 33, 33, 33, 33, 33, 33, 33, true, true, true, true, 22.10, '2025-01-07 05:34:26.948+00', '2025-01-07 05:34:26.95+00', NULL, '2f7d1649-7a5f-41e5-8aca-7cf5e4d2d7f4', '00abf782-9f43-4872-94a8-fdbf903d0a4c.jpg', 'ce48935e-d3d8-4a69-beb0-78a901b9eb25.mp4');
INSERT INTO public.detail_experience VALUES ('2368b040-9cc7-4b6d-8865-6fc764a3b126', 22, 22, 22, 22, 22, 22, 22, 22, true, true, true, true, 20.00, '2024-12-29 09:07:41.65+00', '2025-01-06 03:44:58.476+00', NULL, '1b9ae22b-a8cf-466a-b813-5312391d72ce', '033208cb-ac71-492d-bad7-5ff206bbead1.mp3', '4b8c5090-3c41-41de-9702-bc1c6457cc3c.mp4');


--
-- Data for Name: experiences; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.experiences VALUES ('448279d0-d3fa-43f9-953b-fe3801b445e8', 'recharge', 'regenesis-recharge-icon', 'settings-outline', 'recharge', 'Recharge information', true, '2024-11-26 08:08:18.884+00', '2024-11-26 08:08:18.884+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'db7b2a31-27cf-4775-9fd5-1a3cde34d26d');
INSERT INTO public.experiences VALUES ('013a9f17-642c-42b4-83c3-be97002e518f', 'recover', 'recover', 'settings-outline', 'recover', 'recover', true, '2024-11-26 08:10:03.912+00', '2024-11-26 08:10:03.912+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'db7b2a31-27cf-4775-9fd5-1a3cde34d26d');
INSERT INTO public.experiences VALUES ('04815f17-aa81-4cb6-b712-758f311a50b8', 'bio_feedback', 'bio_feedback', 'bio_feedback', 'bio_feedback', 'bio_feedback information text.', true, '2024-11-27 02:06:35.951+00', '2024-11-27 02:06:35.951+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'db7b2a31-27cf-4775-9fd5-1a3cde34d26d');
INSERT INTO public.experiences VALUES ('34d3be3f-5e0a-48b7-8d51-0484e3962013', 'novak_mode', 'novak_mode', 'settings-outline', 'novak_mode', 'novak_mode information', true, '2024-11-26 08:09:35.413+00', '2024-11-26 08:09:35.413+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'db7b2a31-27cf-4775-9fd5-1a3cde34d26d');
INSERT INTO public.experiences VALUES ('9cae08fa-6f2b-435c-bac8-8169e9935879', 'novak_mode1', 'novak_mode', 'settings-outline', 'novak_mode', 'novak_mode information', true, '2024-11-26 08:09:35.413+00', '2024-11-26 08:09:35.413+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'db7b2a31-27cf-4775-9fd5-1a3cde34d26d');
INSERT INTO public.experiences VALUES ('9f224399-eaf2-4196-9ce2-6d8319d7c00b', 'relax', 'regenesis-relax-icon', 'settings-outline', 'relax', 'Relax information', true, '2024-11-26 08:08:18.884+00', '2024-11-26 08:08:18.884+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'db7b2a31-27cf-4775-9fd5-1a3cde34d26d');
INSERT INTO public.experiences VALUES ('f8cffb95-969d-48c1-97eb-38603e0a27c7', 'rejuvenate', 'regenesis-rejuvenate-icon', 'settings-outline', 'rejuvenate', 'Rejuvenate information', true, '2024-11-26 08:09:05.296+00', '2024-11-26 08:09:05.296+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'db7b2a31-27cf-4775-9fd5-1a3cde34d26d');
INSERT INTO public.experiences VALUES ('d5be6619-e483-4c0b-a40a-da742226dd1b', 'novak_mode', 'novak_mode', 'settings-outline', 'novak_mode', 'novak_mode information', true, '2024-11-26 08:09:35.413+00', '2024-11-26 08:09:35.413+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'c649dab4-4182-4dd2-b6a9-28445a28d796');
INSERT INTO public.experiences VALUES ('2f7d1649-7a5f-41e5-8aca-7cf5e4d2d7f4', 'recharge', 'regenesis-recharge-icon', 'settings-outline', 'recharge', 'Recharge information', true, '2024-11-26 08:08:18.884+00', '2024-11-26 08:08:18.884+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'c649dab4-4182-4dd2-b6a9-28445a28d796');
INSERT INTO public.experiences VALUES ('1b9ae22b-a8cf-466a-b813-5312391d72ce', 'recover', 'recover', 'settings-outline', 'recover', 'recover', true, '2024-11-26 08:10:03.912+00', '2024-11-26 08:10:03.912+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'c649dab4-4182-4dd2-b6a9-28445a28d796');
INSERT INTO public.experiences VALUES ('5349ac0f-6992-465a-ac7c-c626baf7fbdd', 'novak_mode2', 'novak_mode', 'settings-outline', 'novak_mode', 'novak_mode information', true, '2024-11-26 08:09:35.413+00', '2024-11-26 08:09:35.413+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'c649dab4-4182-4dd2-b6a9-28445a28d796');
INSERT INTO public.experiences VALUES ('e9f9abd7-3c90-49ea-8695-8cfb2c425bba', 'bio_feedback', 'bio_feedback', 'bio_feedback', 'bio_feedback', 'bio_feedback information text.', true, '2024-11-27 02:06:35.951+00', '2024-11-27 02:06:35.951+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'c649dab4-4182-4dd2-b6a9-28445a28d796');
INSERT INTO public.experiences VALUES ('063c224b-2fa7-4fa5-b5ad-a656e2d152b8', 'relax', 'regenesis-relax-icon', 'settings-outline', 'relax', 'Relax information', true, '2024-11-26 08:08:18.884+00', '2024-11-26 08:08:18.884+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'c649dab4-4182-4dd2-b6a9-28445a28d796');
INSERT INTO public.experiences VALUES ('08291601-5776-438e-aef5-32f5cf740ee7', 'reconnect', 'regenesis-reconnect-icon', 'settings-outline', 'reconnect', 'Reconnect information', true, '2024-11-26 08:08:18.884+00', '2024-11-26 08:08:18.884+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'c649dab4-4182-4dd2-b6a9-28445a28d796');
INSERT INTO public.experiences VALUES ('2c45bb68-dcf0-4acd-bb9e-de4b8ca647c5', 'rejuvenate', 'regenesis-rejuvenate-icon', 'settings-outline', 'rejuvenate', 'Rejuvenate information', true, '2024-11-26 08:09:05.296+00', '2024-11-26 08:09:05.296+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'c649dab4-4182-4dd2-b6a9-28445a28d796');
INSERT INTO public.experiences VALUES ('47d526a2-eaa3-4326-94d9-3f606eecef86', 'novak_mode', 'novak_mode', 'settings-outline', 'novak_mode', 'novak_mode information', true, '2024-11-26 08:09:35.413+00', '2024-11-26 08:09:35.413+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'c95a1317-b6d2-4962-a28e-7b7a3f3fa1a2');
INSERT INTO public.experiences VALUES ('baf53bf3-c945-41c0-afa4-7cad6a6566a5', 'recharge', 'regenesis-recharge-icon', 'settings-outline', 'recharge', 'Recharge information', true, '2024-11-26 08:08:18.884+00', '2024-11-26 08:08:18.884+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'c95a1317-b6d2-4962-a28e-7b7a3f3fa1a2');
INSERT INTO public.experiences VALUES ('cc9602d4-90b6-4d61-910b-bc0b70a39ec5', 'recover', 'recover', 'settings-outline', 'recover', 'recover', true, '2024-11-26 08:10:03.912+00', '2024-11-26 08:10:03.912+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'c95a1317-b6d2-4962-a28e-7b7a3f3fa1a2');
INSERT INTO public.experiences VALUES ('4a7d6152-b882-4b3a-a372-3ef35820205a', 'novak_mode2', 'novak_mode', 'settings-outline', 'novak_mode', 'novak_mode information', true, '2024-11-26 08:09:35.413+00', '2024-11-26 08:09:35.413+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'c95a1317-b6d2-4962-a28e-7b7a3f3fa1a2');
INSERT INTO public.experiences VALUES ('5c00f0f5-6715-41ec-bc2f-d55f7f5c5839', 'bio_feedback', 'bio_feedback', 'bio_feedback', 'bio_feedback', 'bio_feedback information text.', true, '2024-11-27 02:06:35.951+00', '2024-11-27 02:06:35.951+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'c95a1317-b6d2-4962-a28e-7b7a3f3fa1a2');
INSERT INTO public.experiences VALUES ('558d152a-579d-4096-94dc-cbe287b8899d', 'relax', 'regenesis-relax-icon', 'settings-outline', 'relax', 'Relax information', true, '2024-11-26 08:08:18.884+00', '2024-11-26 08:08:18.884+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'c95a1317-b6d2-4962-a28e-7b7a3f3fa1a2');
INSERT INTO public.experiences VALUES ('41523ce0-3cef-473b-99e4-bc51e49cdd56', 'reconnect', 'regenesis-reconnect-icon', 'settings-outline', 'reconnect', 'Reconnect information', true, '2024-11-26 08:08:18.884+00', '2024-11-26 08:08:18.884+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'c95a1317-b6d2-4962-a28e-7b7a3f3fa1a2');
INSERT INTO public.experiences VALUES ('fc245401-ca69-4382-947f-3c1af337a81d', 'rejuvenate', 'regenesis-rejuvenate-icon', 'settings-outline', 'rejuvenate', 'Rejuvenate information', true, '2024-11-26 08:09:05.296+00', '2024-11-26 08:09:05.296+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'c95a1317-b6d2-4962-a28e-7b7a3f3fa1a2');


--
-- Data for Name: experiences_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.experiences_properties VALUES ('09361f99-d061-444e-80c6-973ffaafa358', '#FF5733', 2.5, '#33FF57', 'updated_circle_icon.png', 'Updated Caption', 10.5, true, 1, 'upupupupup', NULL, '2024-12-12 17:32:24.583+00', '2024-12-12 17:32:24.583+00', NULL, '9cae08fa-6f2b-435c-bac8-8169e9935879');
INSERT INTO public.experiences_properties VALUES ('b2a09d13-15a3-46ea-a925-b9adc9d39f1a', '#FF5733', 2.5, '#33FF57', 'updated_circle_icon.png', 'Updated Caption', 10.5, true, 1, 'upupupupup', NULL, '2024-12-12 17:32:24.583+00', '2024-12-12 17:32:24.583+00', NULL, '34d3be3f-5e0a-48b7-8d51-0484e3962013');
INSERT INTO public.experiences_properties VALUES ('b8c0738f-be8c-4da8-bbc0-b2bb269e139e', '#FF5733', 2.5, '#33FF57', 'updated_circle_icon.png', 'Updated Caption', 10.5, true, 1, 'upupupupup', NULL, '2024-12-12 17:32:24.583+00', '2024-12-12 17:32:24.583+00', NULL, '04815f17-aa81-4cb6-b712-758f311a50b8');
INSERT INTO public.experiences_properties VALUES ('2f368b15-c3a5-47c1-8a72-4c4f8f203903', '#FF5733', 2.5, '#33FF57', 'updated_circle_icon.png', 'Updated Caption', 10.5, true, 1, 'upupupupup', NULL, '2024-12-12 17:32:24.583+00', '2024-12-12 17:32:24.583+00', NULL, 'f8cffb95-969d-48c1-97eb-38603e0a27c7');
INSERT INTO public.experiences_properties VALUES ('029bb8c7-e6cd-4004-a0ba-1bdbb31d9e13', '#FF5733', 2.5, '#33FF57', 'updated_circle_icon.png', 'Updated Caption', 10.5, true, 1, 'upupupupup', NULL, '2024-12-12 17:32:24.583+00', '2024-12-12 17:32:24.583+00', NULL, '47d526a2-eaa3-4326-94d9-3f606eecef86');
INSERT INTO public.experiences_properties VALUES ('49248cfd-e176-4792-b2b2-21621245abfc', '#FF5733', 2.5, '#33FF57', 'updated_circle_icon.png', 'Updated Caption', 10.5, true, 1, 'upupupupup', NULL, '2024-12-12 17:32:24.583+00', '2024-12-12 17:32:24.583+00', NULL, '4a7d6152-b882-4b3a-a372-3ef35820205a');
INSERT INTO public.experiences_properties VALUES ('adaf9b7f-1e4e-44fa-a63a-0a68e362caf5', '#FF5733', 2.5, '#33FF57', 'updated_circle_icon.png', 'Updated Caption', 10.5, true, 1, 'upupupupup', NULL, '2024-12-12 17:32:24.583+00', '2024-12-12 17:32:24.583+00', NULL, '5c00f0f5-6715-41ec-bc2f-d55f7f5c5839');
INSERT INTO public.experiences_properties VALUES ('e9284282-3cd0-4074-b5f5-f410cbdb045f', '#FF5733', 2.5, '#33FF57', 'updated_circle_icon.png', 'Updated Caption', 10.5, true, 1, 'upupupupup', NULL, '2024-12-12 17:32:24.583+00', '2024-12-12 17:32:24.583+00', NULL, 'fc245401-ca69-4382-947f-3c1af337a81d');
INSERT INTO public.experiences_properties VALUES ('56e697c8-3a63-4cb3-9660-1e8ec9be3595', '#FF5733', 2.5, '#33FF57', 'updated_circle_icon.png', 'Updated Caption', 10.5, true, 1, 'upupupupup', NULL, '2024-12-12 17:32:24.583+00', '2025-01-05 15:13:22.476+00', NULL, '41523ce0-3cef-473b-99e4-bc51e49cdd56');
INSERT INTO public.experiences_properties VALUES ('094dc2d6-a636-4174-b87e-d44e5f5305ac', '#FF5733', 2.5, '#33FF57', 'updated_circle_icon.png', 'Updated Caption', 10.5, true, 1, 'upupupupup', NULL, '2024-12-12 17:32:24.583+00', '2025-01-05 14:57:40.623+00', NULL, 'cc9602d4-90b6-4d61-910b-bc0b70a39ec5');
INSERT INTO public.experiences_properties VALUES ('a38ac304-4d7e-4c5b-a183-95d7d295ba0b', '#FF5733', 2.5, '#33FF57', 'updated_circle_icon.png', 'Updated Caption', 100, true, 1, 'heheheh', 'ddc8aac0-d57b-446a-90b0-d7878d121d4f.txt', '2024-12-12 17:32:24.583+00', '2025-01-05 14:57:40.623+00', NULL, '013a9f17-642c-42b4-83c3-be97002e518f');
INSERT INTO public.experiences_properties VALUES ('faba3df0-893e-4adf-aa45-483eb2b8be44', '#FF5733', 2.5, '#33FF57', 'new_circle_icon.png', 'Updated Caption', 10, true, 2, 'Updated Tooltip', 'updated_icon.png', '2024-12-12 17:32:24.583+00', '2025-01-05 15:42:16.237+00', NULL, '9f224399-eaf2-4196-9ce2-6d8319d7c00b');
INSERT INTO public.experiences_properties VALUES ('7b1d87b3-da5e-4219-a466-e15ffd22d307', '#FF5733', 2.5, '#33FF57', 'new_circle_icon.png', 'Updated Caption', 10, true, 2, 'Updated Tooltip', 'updated_icon.png', '2024-12-12 17:32:24.583+00', '2025-01-05 15:42:16.237+00', NULL, '558d152a-579d-4096-94dc-cbe287b8899d');
INSERT INTO public.experiences_properties VALUES ('caba2213-aea1-4260-ab1b-fe71b9a99431', '#FF5733', 2.5, '#deed0c', 'updated_circle_icon.png', 'Updated Caption', 100, true, 1, 'upupupupup', '49a86f5c-29f8-4293-84a0-0f4cffd2ae0b.webp', '2024-12-12 17:32:24.583+00', '2024-12-12 17:32:24.583+00', NULL, 'e9f9abd7-3c90-49ea-8695-8cfb2c425bba');
INSERT INTO public.experiences_properties VALUES ('723658fb-d12d-49e8-aeef-0a87f4c960d0', '#FF5733', 2.5, '#33FF57', 'new_circle_icon.png', 'update', 10, true, 2, 'Updated', 'updated_icon.png', '2024-12-12 17:32:24.583+00', '2025-01-08 03:58:20.621+00', NULL, 'baf53bf3-c945-41c0-afa4-7cad6a6566a5');
INSERT INTO public.experiences_properties VALUES ('d923a58c-1580-4ea7-b703-45c01916e527', '#FF5733', 2.5, '#b70620', 'new_circle_icon.png', 'Updated Caption', 100, true, 2, 'Updated Tooltip', 'f28fabe5-29d0-4429-bc04-2c25b8afb93f.webp', '2024-12-12 17:32:24.583+00', '2025-01-05 15:42:16.237+00', NULL, '063c224b-2fa7-4fa5-b5ad-a656e2d152b8');
INSERT INTO public.experiences_properties VALUES ('a746db6a-05e3-4815-91af-b7d607a28a1c', '#FF5733', 2.5, '#c1d7c5', 'updated_circle_icon.png', 'Updated Caption', 100, true, 1, 'upupupupup', 'dc61b34e-705f-4ba8-b44e-868a68d949de.svg', '2024-12-12 17:32:24.583+00', '2024-12-12 17:32:24.583+00', NULL, 'd5be6619-e483-4c0b-a40a-da742226dd1b');
INSERT INTO public.experiences_properties VALUES ('33555005-4d06-4820-94d5-9e6190352675', '#FF5733', 1, '#5e2697', 'updated_circle_icon.png', 'Updated Caption', 100, true, 1, 'heheheh', '553cc8dd-2acc-4f57-89e1-2bb2e85a2484.webp', '2024-12-12 17:32:24.583+00', '2025-01-08 03:58:20.584+00', NULL, '2f7d1649-7a5f-41e5-8aca-7cf5e4d2d7f4');
INSERT INTO public.experiences_properties VALUES ('1d752c1e-20e9-45a2-966e-1320d83d7f91', '#FF5733', 2.5, '#ff6600', 'updated_circle_icon.png', 'Updated Caption', 100, true, 1, 'upupupupup', '1c09d07c-c66b-41ae-8bc9-a57d6731f3ee.jpg', '2024-12-12 17:32:24.583+00', '2025-01-05 14:57:40.623+00', NULL, '1b9ae22b-a8cf-466a-b813-5312391d72ce');
INSERT INTO public.experiences_properties VALUES ('52ae3b64-53b0-44ce-a2d4-407a7eb033cf', '#FF5733', 2.5, '#ffffff', 'updated_circle_icon.png', 'Updated Caption', 100, true, 1, 'upupupupup', '070df90b-dbc1-480b-9b49-144f08938667.png', '2024-12-12 17:32:24.583+00', '2024-12-12 17:32:24.583+00', NULL, '5349ac0f-6992-465a-ac7c-c626baf7fbdd');
INSERT INTO public.experiences_properties VALUES ('6595930f-c9e4-4d85-9070-9f5ebc80b8f8', '#FF5733', 2.5, '#2017a1', 'updated_circle_icon.png', 'Updated Caption', 100, true, 1, 'upupupupup', '3acd6185-a26e-4bef-b1d9-e1af7b241835.png', '2024-12-12 17:32:24.583+00', '2024-12-12 17:32:24.583+00', NULL, '2c45bb68-dcf0-4acd-bb9e-de4b8ca647c5');
INSERT INTO public.experiences_properties VALUES ('6d70f7be-d854-4120-8b5d-5618a288c583', '#FF5733', 2.5, '#3d4c40', 'updated_circle_icon.png', 'Updated Caption', 100, false, 1, 'upupupupup', '5abcb45f-3a74-4f0d-9f9f-02047bb9d6cb.png', '2024-12-12 17:32:24.583+00', '2025-01-05 15:13:22.476+00', NULL, '08291601-5776-438e-aef5-32f5cf740ee7');
INSERT INTO public.experiences_properties VALUES ('10508858-1d88-4b60-bae5-0dd6abc07d64', '#FF5733', 2.5, '#33FF57', 'new_circle_icon.png', 'update', 10, true, 2, 'Updated', 'updated_icon.png', '2025-01-06 02:46:00.974+00', '2025-01-08 03:58:20.547+00', NULL, '448279d0-d3fa-43f9-953b-fe3801b445e8');


--
-- Data for Name: mode; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.mode VALUES ('19a39f62-d717-4999-9c9f-e900fa7ce2e1', 'WORK REST PLAY', false, true, '2024-12-10 02:51:15.300244+00', '2024-12-10 02:51:15.300244+00', NULL);
INSERT INTO public.mode VALUES ('5bf0b548-0f45-4dac-a0a1-d3cef8338cf0', 'SELF DEVELOPMENT', false, true, '2024-12-10 02:51:15.300244+00', '2024-12-10 02:51:15.300244+00', NULL);
INSERT INTO public.mode VALUES ('82d4ac45-764e-41a4-91f6-c24d8962c488', 'SESSION MODE', false, true, '2024-12-10 02:51:15.300244+00', '2024-12-10 02:51:15.300244+00', NULL);
INSERT INTO public.mode VALUES ('cf001e65-e337-450a-8c74-b9aafe098e6b', 'TRAINING MODE', true, true, '2024-12-10 02:51:15.300244+00', '2024-12-10 02:51:15.300244+00', NULL);


--
-- Data for Name: pod; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pod VALUES ('c649dab4-4182-4dd2-b6a9-28445a28d796', 'Group B', 'Group B', 'GRP-B321', 'Example Pod', 'https://example.com', 'POD222', 'securepassword', 'admin_pod', '192.168.1.1', '2025-01-09 04:10:57.732+00', '2025-01-09 04:10:57.732+00', NULL, 'Jakarta, Indonesia', 'b1f93e74-8b6e-4b0c-8765-12c546e56e2a');
INSERT INTO public.pod VALUES ('c95a1317-b6d2-4962-a28e-7b7a3f3fa1a2', 'Group B', 'Group B', 'GRP-B321', 'Example Pod', 'https://example.com', 'POD222', 'securepassword', 'admin_pod', '192.168.1.1', '2025-01-09 04:10:21.424+00', '2025-01-09 04:10:21.424+00', NULL, 'Jakarta, Indonesia', 'b1f93e74-8b6e-4b0c-8765-12c546e56e2a');
INSERT INTO public.pod VALUES ('db7b2a31-27cf-4775-9fd5-1a3cde34d26d', 'Group B', 'Group B', 'GRP-B321', 'Example Pod', 'https://example.com', 'POD222', 'securepassword', 'admin_pod', '192.168.1.1', '2025-01-09 04:10:56.043+00', '2025-01-09 04:10:56.043+00', NULL, 'Jakarta, Indonesia', 'b1f93e74-8b6e-4b0c-8765-12c546e56e2a');


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

INSERT INTO public.terms_and_conditions_questions VALUES (1, 'Are you pregnant?', 'Question information', true, '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.terms_and_conditions_questions VALUES (2, 'Do you have any allergies?', 'Question information', true, '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.terms_and_conditions_questions VALUES (3, 'Have you had a fever in the last 24 hours?', 'Question information', true, '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.terms_and_conditions_questions VALUES (4, 'Are you currently taking any medication?', 'Question information', true, '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.terms_and_conditions_questions VALUES (5, 'Do you have any chronic diseases?', 'Question information', true, '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.terms_and_conditions_questions VALUES (6, 'Have you traveled internationally in the last 14 days?', 'Question information', true, '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.terms_and_conditions_questions VALUES (7, 'test', 'just test', true, '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."user" VALUES ('34f9d673-ed97-4c8d-ada5-3385bbc20132', 'John Doe', 'johndoe', 'johndoe@example.com', 'hashed_password1', false, NULL, NULL, false, '2024-12-21 02:39:57.4252+00', '2024-12-21 02:39:57.4252+00', NULL);
INSERT INTO public."user" VALUES ('ce3d72fa-611e-4589-990f-7c293faa17a3', 'Jane Smith', 'janesmith', 'janesmith@example.com', 'hashed_password2', true, 'reset_token_123', '2024-12-22 10:39:57.4252', true, '2024-12-21 02:39:57.4252+00', '2024-12-21 02:39:57.4252+00', NULL);
INSERT INTO public."user" VALUES ('126737d9-a0c0-4651-8c8a-9aef677b353b', 'Test User', NULL, 'testuser@example.com', 'hashed_password3', true, NULL, NULL, false, '2024-12-21 02:39:57.4252+00', '2024-12-21 02:39:57.4252+00', NULL);
INSERT INTO public."user" VALUES ('825acb94-f970-4983-ad05-0771adc36c6e', 'Alice Brown', 'alicebrown', 'alicebrown@example.com', 'hashed_password4', false, NULL, NULL, true, '2024-12-21 02:39:57.4252+00', '2024-12-21 02:39:57.4252+00', NULL);
INSERT INTO public."user" VALUES ('0b4930d8-ce46-49a1-977f-873d5880a8fa', 'Bob White', 'bobwhite', 'bobwhite@example.com', 'hashed_password5', false, 'reset_token_456', '2024-12-23 10:39:57.4252', true, '2024-12-21 02:39:57.4252+00', '2024-12-21 02:39:57.4252+00', NULL);


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
-- Name: pod_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX pod_idx ON public.pod USING btree (id);


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
-- Name: pod pod_fk_app_version_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pod
    ADD CONSTRAINT pod_fk_app_version_fkey FOREIGN KEY (fk_app_version) REFERENCES public.app_version(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: terms_and_conditions_accepted user_id_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.terms_and_conditions_accepted
    ADD CONSTRAINT user_id_foreign_key FOREIGN KEY (fk_user_id) REFERENCES public."user"(user_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

