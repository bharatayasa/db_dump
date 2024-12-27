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
-- Name: agreement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.agreement (
    id smallint NOT NULL,
    agreement text,
    active boolean DEFAULT true NOT NULL,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone
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
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
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
-- Name: flowchart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flowchart (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    ignite_by_socket text,
    ignite_by_mqtt text,
    pub_tablet_screen text,
    pub_big_screen text,
    previous_flow_id text,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    description text,
    fn text
);


ALTER TABLE public.flowchart OWNER TO postgres;

--
-- Name: flowchart_mqtt_publish; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flowchart_mqtt_publish (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    keyword character varying,
    value character varying,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    flowchart_id text
);


ALTER TABLE public.flowchart_mqtt_publish OWNER TO postgres;

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
    url text NOT NULL,
    identification text NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone,
    code text NOT NULL,
    fk_group_id text NOT NULL,
    "group" text NOT NULL,
    ip_address text NOT NULL,
    location text NOT NULL,
    name text NOT NULL,
    fk_user_id uuid NOT NULL
);


ALTER TABLE public.pod OWNER TO postgres;

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
-- Name: pod_settings_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pod_settings_info (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    for_label text,
    info text,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.pod_settings_info OWNER TO postgres;

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
-- Name: rate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rate (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    experience_id uuid,
    value integer,
    updated_date timestamp(6) with time zone,
    created_date timestamp(6) with time zone,
    fk_user_id uuid,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.rate OWNER TO postgres;

--
-- Name: self_development; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.self_development (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    self_development_name text,
    description text,
    created_date timestamp(6) with time zone,
    updated_date timestamp(6) with time zone,
    icon text,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.self_development OWNER TO postgres;

--
-- Name: self_development_sound; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.self_development_sound (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    sound_code text,
    duration text,
    description text,
    created_date timestamp(6) with time zone,
    updated_date timestamp(6) with time zone,
    sound_path text,
    file_path text,
    self_development_id uuid,
    title text,
    caption text,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.self_development_sound OWNER TO postgres;

--
-- Name: socket_topics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socket_topics (
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
    keyword text,
    created_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    update_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    auth_status boolean,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.socket_topics OWNER TO postgres;

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
    deleted_at timestamp(6) without time zone
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
-- Name: test_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test_user (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.test_user OWNER TO postgres;

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
    deleted_at timestamp(6) without time zone,
    otp_verified boolean DEFAULT false,
    created_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: user_favorite_self_development_sound; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_favorite_self_development_sound (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    self_development_sound_id text,
    user_id uuid,
    created_date timestamp(6) with time zone,
    updated_date timestamp(6) with time zone,
    deleted_at timestamp(6) without time zone
);


ALTER TABLE public.user_favorite_self_development_sound OWNER TO postgres;

--
-- Name: workrestplay; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workrestplay (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    wrp_name text,
    preset_name text,
    door_status boolean,
    pmf_status boolean,
    reading_light_intensity integer,
    led_intensity integer,
    led_color text,
    nir_intensity integer,
    fir_intensity integer,
    created_date timestamp(6) with time zone,
    updated_date timestamp(6) with time zone,
    user_id uuid,
    deleted_at timestamp(6) without time zone,
    "order" integer NOT NULL
);


ALTER TABLE public.workrestplay OWNER TO postgres;

--
-- Name: workrestplay_default; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workrestplay_default (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    wrp_name text NOT NULL,
    preset_name text NOT NULL,
    door_status boolean NOT NULL,
    pmf_status boolean NOT NULL,
    reading_light_intensity integer NOT NULL,
    led_intensity integer NOT NULL,
    led_color text NOT NULL,
    nir_intensity integer NOT NULL,
    fir_intensity integer NOT NULL,
    created_date timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_date timestamp(3) without time zone NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.workrestplay_default OWNER TO postgres;

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

INSERT INTO public._prisma_migrations VALUES ('b5b43427-e28c-43d0-aeea-72fb60f36885', '4861e662842bfa7d0261b8e3abdf067ac228541981e30aa1b0efb75f59fbe8f5', '2024-12-20 15:55:22.471143+00', '20241220155521_init', NULL, NULL, '2024-12-20 15:55:21.991356+00', 1);
INSERT INTO public._prisma_migrations VALUES ('416a4adb-22e9-4023-943b-2a6c9025cc30', '2ed81bc619ad93b41d317d6b058e8b854b727369724c23fc66e53255fe3ed3d4', '2024-12-20 15:59:45.145953+00', '20241220155944_mode_pod', NULL, NULL, '2024-12-20 15:59:44.792719+00', 1);
INSERT INTO public._prisma_migrations VALUES ('55686ac3-1c1b-4212-90ef-6bf0a5c1e028', '8358fd5faae7862c81788afbb7333f3639be6c3e61c7da22edc757684c69970c', '2024-12-20 16:04:02.823372+00', '20241220160402_user_on_pod', NULL, NULL, '2024-12-20 16:04:02.424436+00', 1);
INSERT INTO public._prisma_migrations VALUES ('8b25416b-a9d3-48e7-a096-1d15d20852fc', 'e8373a0748d2daf8d36486201b90140810aa2a376f0da4e71fb6912514189db8', '2024-12-21 02:48:19.736465+00', '20241221024819_add_date_user_tabel', NULL, NULL, '2024-12-21 02:48:19.698391+00', 1);
INSERT INTO public._prisma_migrations VALUES ('3c1ac28d-9600-4970-8fdb-144d047788e9', 'd1b6f720af651595c9d1d7dd839df4232e0338785afe6a6157da2be66b440aa9', '2024-12-21 04:18:52.401027+00', '20241221041852_add_atribute_experience_props', NULL, NULL, '2024-12-21 04:18:52.302754+00', 1);


--
-- Data for Name: agreement; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: colours; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: detail_experience; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.detail_experience VALUES ('c27d4ee2-3c48-4ae6-9c5d-76208f00824d', 11, 11, 11, 11, 11, 11, 22, 22, false, true, false, false, 11.10, '2024-12-27 01:51:52.29+00', '2024-12-27 01:51:52.29+00', NULL, '013a9f17-642c-42b4-83c3-be97002e518f', NULL, NULL);


--
-- Data for Name: experiences; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.experiences VALUES ('013a9f17-642c-42b4-83c3-be97002e518f', 'recover', 'recover', 'settings-outline', 'recover', 'recover', true, '2024-11-26 08:10:03.912+00', '2024-11-26 08:10:03.912+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'db7b2a31-27cf-4775-9fd5-1a3cde34d26d');


--
-- Data for Name: experiences_properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.experiences_properties VALUES ('a38ac304-4d7e-4c5b-a183-95d7d295ba0b', '#FF5733', 2.5, '#33FF57', 'updated_circle_icon.png', 'Updated Caption', 100, true, 1, 'heheheh', '8f6d948a-b16c-4f35-9b8a-6e1b99db1b5f.jpg', '2024-12-26 14:34:47.473+00', '2024-12-26 14:34:47.473+00', NULL, '013a9f17-642c-42b4-83c3-be97002e518f');


--
-- Data for Name: flowchart; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: flowchart_mqtt_publish; Type: TABLE DATA; Schema: public; Owner: postgres
--



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

INSERT INTO public.pod VALUES ('db7b2a31-27cf-4775-9fd5-1a3cde34d26d', 'https://example.com', 'POD222', 'admin_pod', 'securepassword', '2024-12-21 03:07:06.348+00', '2024-12-21 03:07:06.348+00', NULL, 'GRP-B321', 'Group B', 'Group B', '192.168.1.1', 'Jakarta, Indonesia', 'Example Pod', '0b4930d8-ce46-49a1-977f-873d5880a8fa');


--
-- Data for Name: pod_history; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pod_settings_info; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: pod_topics; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: rate; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: self_development; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: self_development_sound; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: socket_topics; Type: TABLE DATA; Schema: public; Owner: postgres
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
-- Data for Name: test_user; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public."user" VALUES ('4e76ad5b-b2b1-4fe5-8486-2c1fd1e10442', 'test add', 'dummy2', 'regenesis40@gmail.com6', '$2b$10$RuaskeSn/UJ1ct3LN78DDeL4aTvTeces7uL2zWEqzD6MXFoMkkgty', false, NULL, NULL, NULL, false, '2024-12-21 02:48:35.08014+00', '2024-12-21 02:48:35.08014+00');
INSERT INTO public."user" VALUES ('0b4930d8-ce46-49a1-977f-873d5880a8fa', 'Jane Smith', 'janesmith', 'janesmith@example.com', 'hashed_password2', true, 'reset_token_123', '2024-12-22 02:48:56.214362', NULL, true, '2024-12-21 02:48:56.214362+00', '2024-12-21 02:48:56.214362+00');
INSERT INTO public."user" VALUES ('126737d9-a0c0-4651-8c8a-9aef677b353b', 'Alice Brown', 'alicebrown', 'alicebrown@example.com', 'hashed_password4', false, NULL, NULL, NULL, true, '2024-12-21 02:48:56.214362+00', '2024-12-21 02:48:56.214362+00');
INSERT INTO public."user" VALUES ('34f9d673-ed97-4c8d-ada5-3385bbc20132', 'Test User', NULL, 'testuser@example.com', 'hashed_password3', true, NULL, NULL, NULL, false, '2024-12-21 02:48:56.214362+00', '2024-12-21 02:48:56.214362+00');
INSERT INTO public."user" VALUES ('825acb94-f970-4983-ad05-0771adc36c6e', 'John Doe', 'johndoe', 'johndoe@example.com', 'hashed_password1', false, NULL, NULL, NULL, false, '2024-12-21 02:48:56.214362+00', '2024-12-21 02:48:56.214362+00');
INSERT INTO public."user" VALUES ('ce3d72fa-611e-4589-990f-7c293faa17a3', 'Bob White', 'bobwhite', 'bobwhite@example.com', 'hashed_password5', false, 'reset_token_456', '2024-12-23 02:48:56.214362', NULL, true, '2024-12-21 02:48:56.214362+00', '2024-12-21 02:48:56.214362+00');
INSERT INTO public."user" VALUES ('64575dae-bc4b-4b98-900f-749f931823ea', 'test add', 'dummy2', 'regenesis40@gmail.com7', '$2b$10$3BQJ1lIP3bcJycjuNoJeHu4hiGUDaUP119ZTUe95GS7XJE7OG3KrK', false, NULL, NULL, NULL, false, '2024-12-21 03:10:07.186+00', '2024-12-21 03:10:07.186+00');


--
-- Data for Name: user_favorite_self_development_sound; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: workrestplay; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: workrestplay_default; Type: TABLE DATA; Schema: public; Owner: postgres
--



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
-- Name: agreement agreement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.agreement
    ADD CONSTRAINT agreement_pkey PRIMARY KEY (id);


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
-- Name: flowchart_mqtt_publish flowchart_mqtt_publish_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flowchart_mqtt_publish
    ADD CONSTRAINT flowchart_mqtt_publish_pkey PRIMARY KEY (id);


--
-- Name: flowchart flowchart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flowchart
    ADD CONSTRAINT flowchart_pkey PRIMARY KEY (id);


--
-- Name: mode mode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mode
    ADD CONSTRAINT mode_pkey PRIMARY KEY (id);


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
-- Name: pod_settings_info pod_settings_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pod_settings_info
    ADD CONSTRAINT pod_settings_info_pkey PRIMARY KEY (id);


--
-- Name: pod_topics pod_topics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pod_topics
    ADD CONSTRAINT pod_topics_pkey PRIMARY KEY (id);


--
-- Name: rate rate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rate
    ADD CONSTRAINT rate_pkey PRIMARY KEY (id);


--
-- Name: self_development self_development_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.self_development
    ADD CONSTRAINT self_development_pkey PRIMARY KEY (id);


--
-- Name: self_development_sound self_development_sound_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.self_development_sound
    ADD CONSTRAINT self_development_sound_pkey PRIMARY KEY (id);


--
-- Name: socket_topics socket_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socket_topics
    ADD CONSTRAINT socket_topic_pkey PRIMARY KEY (id);


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
-- Name: test_user test_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test_user
    ADD CONSTRAINT test_user_pkey PRIMARY KEY (id);


--
-- Name: user_favorite_self_development_sound user_favorite_self_development_sound_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_favorite_self_development_sound
    ADD CONSTRAINT user_favorite_self_development_sound_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (user_id);


--
-- Name: workrestplay_default workrestplay_dafault_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workrestplay_default
    ADD CONSTRAINT workrestplay_dafault_pkey PRIMARY KEY (id);


--
-- Name: workrestplay workrestplay_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workrestplay
    ADD CONSTRAINT workrestplay_pkey PRIMARY KEY (id);


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
-- Name: fk_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fk_user_idx ON public.rate USING btree (fk_user_id);


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
-- Name: rate_experience_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX rate_experience_idx ON public.rate USING btree (experience_id);


--
-- Name: socket_topic_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX socket_topic_idx ON public.socket_topics USING btree (id);


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
-- Name: test_user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX test_user_idx ON public.test_user USING btree (id);


--
-- Name: user_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX user_email_key ON public."user" USING btree (email);


--
-- Name: user_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_idx ON public."user" USING btree (user_id, username);


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
-- Name: pod fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pod
    ADD CONSTRAINT fk_user_id FOREIGN KEY (fk_user_id) REFERENCES public."user"(user_id);


--
-- Name: rate rate_fk_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rate
    ADD CONSTRAINT rate_fk_user_id_fkey FOREIGN KEY (fk_user_id) REFERENCES public."user"(user_id) ON UPDATE CASCADE ON DELETE SET NULL;


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

