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

INSERT INTO public.agreement VALUES (1, ' You can review and update your Profile Information, Password, and Disclaimer / User Agreement in your General Settings & Preference area. Just look out for the settings cog icon on the Homepage.', true, '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL);


--
-- Data for Name: colours; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: detail_experience; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.detail_experience VALUES ('c27d4ee2-3c48-4ae6-9c5d-76208f00824d', 11, 11, 11, 11, 11, 11, 22, 22, false, true, false, false, 11.10, '2024-12-27 01:51:52.29+00', '2024-12-27 01:51:52.29+00', NULL, '013a9f17-642c-42b4-83c3-be97002e518f', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('709e14e3-70b5-4a4e-8f61-5c67c6b90781', 0, 45, 85, 30, 6, 1002, 100, 40, true, true, true, false, 8.20, '2024-11-26 08:13:01.334671+00', '2024-11-26 08:13:01.334671+00', NULL, 'bce02479-972c-439f-8400-a8c364de0b79', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('b50888be-26e9-4b9c-8186-b5230c8e5dfc', 75, 65, 68, 30, 5, 10061, 100, 25, true, true, true, false, 17.00, '2024-11-26 08:13:01.334671+00', '2024-11-26 08:13:01.334671+00', NULL, '2aed98b4-e21d-46c5-aeef-59204e775b4f', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('bd49cc9e-f417-4e77-8ff7-62150c84975b', 75, 65, 68, 30, 5, 1006, 100, 25, true, true, true, false, 8.80, '2024-11-26 08:13:01.334671+00', '2024-11-26 08:13:01.334671+00', NULL, '7f5b3bc9-bad2-4bcd-ae24-824c9bbf2b0e', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('f74c4b2e-059c-4307-83e0-0a6d1ed2b497', 70, 55, 67, 30, 2, 1001, 100, 35, true, true, true, false, 7.70, '2024-11-26 08:13:01.334671+00', '2024-11-26 08:13:01.334671+00', NULL, 'd46f5b91-21c4-4ff8-9a02-9f38c99f3b9f', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('c6a159d7-0ad7-438b-b5c4-17ee1ca1eb5d', 75, 65, 68, 30, 5, 1006, 100, 25, true, true, true, false, 8.80, '2024-11-26 09:03:33.4132+00', '2024-11-26 09:03:33.4132+00', NULL, '25a6f469-3a88-4b4c-aa8b-7a880f0f01a0', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('2b32a1f9-9f60-49df-b6a4-1496de6a144e', 5, 7, 4, 8, 2, 6, 3, 4, true, false, true, false, 30.50, '2024-11-27 01:44:42.154+00', '2024-11-27 01:44:42.154+00', NULL, 'ff6cc444-2e30-4f14-bf32-cb92e9e6729b', NULL, NULL);
INSERT INTO public.detail_experience VALUES ('16521365-ea9a-413f-ab06-1a20cc9e9926', 5, 7, 4, 8, 2, 6, 3, 4, true, false, true, false, 30.50, '2024-11-26 08:13:01.334671+00', '2024-11-26 08:13:01.334671+00', NULL, '1b1bb162-952d-400f-adb8-66cc3b6a8ae3', NULL, NULL);


--
-- Data for Name: experiences; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.experiences VALUES ('013a9f17-642c-42b4-83c3-be97002e518f', 'recover', 'recover', 'settings-outline', 'recover', 'recover', true, '2024-11-26 08:10:03.912+00', '2024-11-26 08:10:03.912+00', NULL, '82d4ac45-764e-41a4-91f6-c24d8962c488', 'db7b2a31-27cf-4775-9fd5-1a3cde34d26d');
INSERT INTO public.experiences VALUES ('25a6f469-3a88-4b4c-aa8b-7a880f0f01a0', 'relax', 'regenesis-relax-icon', 'settings-outline', 'relax', 'Relax information', true, '2024-11-26 08:08:18.884037+00', '2024-11-26 08:08:18.884037+00', NULL, NULL, NULL);
INSERT INTO public.experiences VALUES ('bce02479-972c-439f-8400-a8c364de0b79', 'recharge', 'regenesis-recharge-icon', 'settings-outline', 'recharge', 'Recharge information', true, '2024-11-26 08:08:18.884037+00', '2024-11-26 08:08:18.884037+00', NULL, NULL, NULL);
INSERT INTO public.experiences VALUES ('2aed98b4-e21d-46c5-aeef-59204e775b4f', 'reconnect', 'regenesis-reconnect-icon', 'settings-outline', 'reconnect', 'Reconnect information', true, '2024-11-26 08:08:18.884037+00', '2024-11-26 08:08:18.884037+00', NULL, NULL, NULL);
INSERT INTO public.experiences VALUES ('3df876c8-4e61-4d89-931a-9e7b23e3e212', 'rejuvenate', 'regenesis-rejuvenate-icon', 'settings-outline', 'rejuvenate', 'Rejuvenate information', true, '2024-11-26 08:09:05.296603+00', '2024-11-26 08:09:05.296603+00', NULL, NULL, NULL);
INSERT INTO public.experiences VALUES ('7f5b3bc9-bad2-4bcd-ae24-824c9bbf2b0e', 'novak_mode', 'novak_mode', 'settings-outline', 'novak_mode', 'novak_mode information', true, '2024-11-26 08:09:35.413855+00', '2024-11-26 08:09:35.413855+00', NULL, NULL, NULL);
INSERT INTO public.experiences VALUES ('d46f5b91-21c4-4ff8-9a02-9f38c99f3b9f', 'recover', 'recover', 'settings-outline', 'recover', 'recover', true, '2024-11-26 08:10:03.912302+00', '2024-11-26 08:10:03.912302+00', NULL, NULL, NULL);
INSERT INTO public.experiences VALUES ('1b1bb162-952d-400f-adb8-66cc3b6a8ae3', 'bio_feedback', 'bio_feedback', 'bio_feedback', 'bio_feedback', 'bio_feedback information text.', true, '2024-11-27 02:06:35.951+00', '2024-11-27 02:06:35.951+00', NULL, NULL, NULL);
INSERT INTO public.experiences VALUES ('ff6cc444-2e30-4f14-bf32-cb92e9e6729b', 'self_development', 'self_development', 'self_development', 'self_development', 'self_development', true, '2024-12-10 03:17:36.802568+00', '2024-12-10 03:17:36.802568+00', NULL, NULL, NULL);


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

INSERT INTO public.pod_topics VALUES ('8606f387-dd30-4f5c-849a-b322b9d4060a', 'Pause resume By Tablet', 'Pause resume By Tablet', '${prefix}mod_audio/track/cmd', 'publish', NULL, NULL, NULL, NULL, NULL, '2024-09-26 01:52:11.028647+00', '2024-09-28 01:41:24.646371+00', 'pauseResumeSessionByScreen', NULL);
INSERT INTO public.pod_topics VALUES ('d51b58db-cbdb-47f9-a933-434b81f6218b', 'skip forward session', 'skip forward session', '${prefix}mod_audio/track/seek', 'publish', NULL, NULL, '{"duration": 463, "position": 369}', NULL, NULL, '2024-11-01 06:39:31.308204+00', '2024-11-01 06:39:31.308204+00', 'durationPosition', NULL);
INSERT INTO public.pod_topics VALUES ('3c119d55-f391-4cd3-9dc2-c4d68f453ed3', 'Tablet Pause Button', 'Pause / Resume Session by Manual Controll', '${prefix}mod_control/session_cmd', 'publish', NULL, NULL, NULL, NULL, NULL, '2024-09-20 03:39:38.160358+00', '2024-09-28 01:41:24.646371+00', 'pauseResumeSession', NULL);
INSERT INTO public.pod_topics VALUES ('a9e7f871-d380-4a02-a3a6-a2ed0abdaac4', 'Audio', 'Set stroboscopic intensity', '${prefix}mod_audio/strobo/set_level', 'publish', NULL, NULL, '76', '0 .. 100', NULL, '2024-08-29 07:29:09.506469+00', '2024-09-28 01:41:24.646371+00', 'increaseDecreaseLightIntensity', NULL);
INSERT INTO public.pod_topics VALUES ('baa7ec19-ff52-4313-87be-5777319f3c49', 'Audio', 'Set vibro acoustic level', '${prefix}mod_audio/vibration/set_level', 'publish', NULL, NULL, '45', '0 .. 100', NULL, '2024-08-29 07:29:09.506469+00', '2024-09-28 01:41:24.646371+00', 'increaseDecreaseVibrationIntensity', NULL);
INSERT INTO public.pod_topics VALUES ('37e5339e-c790-46ad-98b6-e42a8745ced6', 'Server', 'Server version', 'mod_server/version', 'subscribe', NULL, '2', NULL, '2', NULL, '2024-08-29 07:29:09.506469+00', '2024-09-28 01:41:24.646371+00', 'serverVersion', NULL);
INSERT INTO public.pod_topics VALUES ('6069410a-b6a2-4c48-8414-93f53ab9025c', 'Server', 'POD ID', 'mod_server/pod_id', 'subscribe', NULL, NULL, NULL, 'MAC address of MiniPC', NULL, '2024-08-29 07:29:09.506469+00', '2024-09-28 01:41:24.646371+00', 'macAddress', NULL);
INSERT INTO public.pod_topics VALUES ('9faede72-07ed-4780-a2c5-f0744814974d', 'Manual Control', '(ROTARY) Audio change volume', 'mod_server/501/data', 'subscribe', NULL, '{"A": 3, "id": 501}', NULL, '-10 .. +10', NULL, '2024-08-29 07:29:09.506469+00', '2024-09-28 01:41:24.646371+00', 'manualControll', NULL);
INSERT INTO public.pod_topics VALUES ('b97fc5f5-3cb5-40f7-9e9f-280cca1abe3b', 'Audio', 'Set audio volume level', '${prefix}mod_audio/audio/set_level', 'publish', NULL, NULL, '89', '0 .. 100', NULL, '2024-08-29 07:29:09.506469+00', '2024-09-28 01:41:24.646371+00', 'setAudioLevel', NULL);
INSERT INTO public.pod_topics VALUES ('fdfa9899-a79a-4dc1-aaf1-0ceb8587cc28', 'Chair', 'POB State', '${prefix}mod_chair/pob_state', 'subscribe', NULL, NULL, NULL, NULL, NULL, '2024-09-19 05:04:18.035286+00', '2024-09-28 01:41:24.646371+00', 'pobState', NULL);
INSERT INTO public.pod_topics VALUES ('352e2968-7f40-4304-a2e3-86d128550479', 'turn On Bluetooth', 'Turn on bluetooth', '${prefix}mod_audio/bt/cmd', 'publish', NULL, NULL, NULL, NULL, NULL, '2024-11-22 03:37:48.900918+00', '2024-11-22 03:37:48.900918+00', 'turnOnBT', NULL);
INSERT INTO public.pod_topics VALUES ('c8309142-10ab-4d5a-a02d-5c32ff47f140', 'set Bluetooth name', 'set bluetooth name', '${prefix}mod_audio/bt/set_alias', 'publish', NULL, NULL, NULL, NULL, NULL, '2024-11-22 03:37:48.900918+00', '2024-11-22 03:37:48.900918+00', 'setBTName', NULL);
INSERT INTO public.pod_topics VALUES ('66ee7c16-01b8-48f1-b854-8bc3915d869e', 'get BT PIN', 'get BT PIN', '${prefix}mod_audio/bt/pin', 'subscribe', NULL, NULL, NULL, NULL, NULL, '2024-11-22 03:37:48.900918+00', '2024-11-22 03:37:48.900918+00', 'getBTPIN', NULL);
INSERT INTO public.pod_topics VALUES ('e2a6fb11-ed45-46ec-b8a2-43bf0c92a0af', 'confirm BT PIN', 'confirm BT PIN', '${prefix}mod_audio/bt/confirm_pin', 'publish', NULL, NULL, NULL, NULL, NULL, '2024-11-22 03:37:48.900918+00', '2024-11-22 03:37:48.900918+00', 'confirmBTPIN', NULL);
INSERT INTO public.pod_topics VALUES ('ec5a2715-c47f-482d-93bc-1c8c5d951209', 'get BT State', 'get BTState', '${prefix}mod_audio/bt/state', 'subscribe', NULL, NULL, NULL, NULL, NULL, '2024-11-22 03:37:48.900918+00', '2024-11-22 03:37:48.900918+00', 'getBTState', NULL);


--
-- Data for Name: rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rate VALUES ('eabf7448-9089-466e-9558-d521b863c3c6', 'bce02479-972c-439f-8400-a8c364de0b79', 3, NULL, NULL, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', NULL);


--
-- Data for Name: self_development; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.self_development VALUES ('4813a167-2dfe-45e5-a6b0-72d9575bb584', 'GUIDED MEDITATION', 'GUIDED MEDITATION', NULL, NULL, 'guided_meditation.png', NULL);
INSERT INTO public.self_development VALUES ('92421a6b-24f9-4cb0-9bda-a6a728cab1ca', 'GUIDED BREATHWORK', 'GUIDED BREATHWORK', NULL, NULL, 'guided_breathwork.png', NULL);
INSERT INTO public.self_development VALUES ('5bdf0007-bd55-4b4d-a424-1e7330863dcf', 'SOUND HEALING', 'SOUND HEALING', NULL, NULL, 'sound_healing.png', NULL);


--
-- Data for Name: self_development_sound; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.self_development_sound VALUES ('ce46c45b-0728-4384-adc5-88bb6cfb7617', '1001', '10', 'description1', NULL, NULL, '/sound/sound1001.mp3', '/video/sound001.webm', '4813a167-2dfe-45e5-a6b0-72d9575bb584', 'Song 1', 'This is song 1', NULL);
INSERT INTO public.self_development_sound VALUES ('4ed9b660-2bd5-4261-89f4-f8dc18a83214', '1002', '15', 'description2', NULL, NULL, '/sound/sound1002.mp3', '/video/sound002.webm', '4813a167-2dfe-45e5-a6b0-72d9575bb584', 'Song 2', 'This is song 2', NULL);


--
-- Data for Name: socket_topics; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.socket_topics VALUES ('bb5ce7bc-b26d-41bc-9d59-57c2f54d6411', 'rechargeLoadAniDone', 'rechargeLoadAniDone', 'rechargeLoadAniDone', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'rechargeLoadAniDone', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('b1ef2155-449c-4b1e-8353-a2a2bdda9811', 'submitdisclaimer', 'submitdisclaimer', 'submitdisclaimer', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'submitdisclaimer', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', false, NULL);
INSERT INTO public.socket_topics VALUES ('4f995aa0-da8d-4e85-aa18-37f7e7d98283', 'submitlogin', 'submitlogin', 'submitlogin', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'submitlogin', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', false, NULL);
INSERT INTO public.socket_topics VALUES ('94ddfe3f-a24c-4e29-bf36-600a7162abc9', 'selectSession', 'selectSession', 'selectSession', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'selectSession', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('397e67d4-4904-4324-bdae-f8fd916fb2c4', 'confirmSession', 'confirmSession', 'confirmSession', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'confirmSession', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('f68a634b-8b08-40d6-bb97-7d1c5e83a3d8', 'session-data', 'session-data', 'session-data', 'publish', NULL, NULL, NULL, NULL, NULL, 'session-data', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('e1bf8a6a-c945-4325-b172-3448c9a716ad', 'durationPosition', 'durationPosition', 'durationPosition', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'durationPosition', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('f825016f-7b51-4dde-8233-3ce64f230ba1', 'task12done', 'task12done', 'task12done', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'task12done', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('b33bbc9e-954d-429c-bb78-1be78f13b22c', 'set audio level', 'set audio level from app side', 'audioVolume', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'audioVolume', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', false, NULL);
INSERT INTO public.socket_topics VALUES ('7f81b693-ad33-43a0-8c30-edc81c2ee1d8', 'light intensity', 'light intensity from app side', 'lightIntensity', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'lightIntensity', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', false, NULL);
INSERT INTO public.socket_topics VALUES ('927229d8-7a08-42b7-82bb-0106bf871245', 'vibrationIntensity', 'vibrationIntensity from app side', 'vibrationIntensity', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'vibrationIntensity', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', false, NULL);
INSERT INTO public.socket_topics VALUES ('ee2615cf-4323-466a-923c-35f103da730c', 'rate', 'rate', 'rate', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'rate', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('cdb46dad-2379-47e8-be16-a065de261b4c', 'backtohome', 'backtohome', 'backtohome', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'backtohome', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('6846ac2b-d9a4-4876-b9e6-fbeefc919442', 'experience-data', 'experience-data', 'experience-data', 'publish', NULL, NULL, NULL, NULL, NULL, 'experience-data', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('11351801-8e55-4059-94d0-f7c8087fb50b', 'audio-volume', 'audio-volume', 'audio-volume', 'publish', NULL, NULL, NULL, NULL, NULL, 'audio-volume', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', false, NULL);
INSERT INTO public.socket_topics VALUES ('4f3e8280-ef9c-46d5-8f6a-d7000b375080', 'light-intensity', 'light-intensity', 'light-intensity', 'publish', NULL, NULL, NULL, NULL, NULL, 'light-intensity', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', false, NULL);
INSERT INTO public.socket_topics VALUES ('b28807bb-6a80-412e-9375-118baa40ec14', 'vibration-intensity', 'vibration-intensity', 'vibration-intensity', 'publish', NULL, NULL, NULL, NULL, NULL, 'vibration-intensity', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', false, NULL);
INSERT INTO public.socket_topics VALUES ('7faa26de-71fb-4748-aa92-041a840786a8', 'pause', 'pauseResumeProcessing from app side', 'pause', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'pause', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', true, NULL);
INSERT INTO public.socket_topics VALUES ('492c687e-4434-43b7-872f-7731abf6d49c', 'big-screen', 'big-screen', 'big-screen', 'publish', NULL, NULL, NULL, NULL, NULL, 'big-screen', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', true, NULL);
INSERT INTO public.socket_topics VALUES ('3778af9c-0003-43c3-80e9-a161b2ad09fe', 'tablet or bigscreen', 'currentScreen. get current screen from app side', 'currentScreen', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'currentScreen', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', false, NULL);
INSERT INTO public.socket_topics VALUES ('e906f859-e496-4555-ad87-35eca17aa20e', 'task2done', 'task2done', 'task2done', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'task2done', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', false, NULL);
INSERT INTO public.socket_topics VALUES ('ebe7aaf9-321a-455c-88fd-181729cae8fb', 'API', 'chair-status', 'chair-status', 'publish', NULL, NULL, NULL, NULL, NULL, 'chair-status', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', false, NULL);
INSERT INTO public.socket_topics VALUES ('fa3b6fb0-741d-4b2b-a09c-6437c97393cd', 'API', 'tablet-screen', 'tablet-screen', 'publish', NULL, NULL, NULL, NULL, NULL, 'tablet-screen', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', false, NULL);
INSERT INTO public.socket_topics VALUES ('4a731751-6f5c-4f43-ba3e-c6db1aad1c04', 'tablet or bigscreen', 'acknowledge', 'acknowledge', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'acknowledge', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', false, NULL);
INSERT INTO public.socket_topics VALUES ('9966b96e-42a3-4b39-be76-8078b008e177', 'API', 'fullmode', 'fullmode', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'fullmode', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', false, NULL);
INSERT INTO public.socket_topics VALUES ('63b7d457-c080-41c5-aa09-5120233f8361', 'signuptab', 'signuptab', 'signuptab', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'signuptab', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', false, NULL);
INSERT INTO public.socket_topics VALUES ('4b042c60-2854-4f10-aa69-46e33c19995a', 'tablet', 'desclimer', 'desclimer', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'desclimer', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('ffc9c295-3104-4ad9-adfb-20419f170949', 'sessionmode', 'sessionmode', 'sessionmode', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'sessionmode', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('62d1211e-1c88-48f1-8ab7-d23ce07f76e0', 'imdone', 'imdone', 'imdone', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'imdone', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('43494b6b-1f63-46a4-a4f3-1b5fda6702e3', 'endsession', 'endsession', 'endsession', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'endsession', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('0b29930f-33d5-4fa6-acf5-efec8dfd1744', 'resetSystem', 'resetSystem', 'resetSystem', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'resetSystem', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('4705e4a7-c719-4cc4-bc54-93c6fb83b035', 'server', 'forward pause to bigscreen', 'pausevideo', 'publish', NULL, NULL, NULL, NULL, NULL, 'pausevideo', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('2dc17012-4378-4c70-a1ee-2b9a43d237ff', 'self development', 'selectSelfDev', 'selectSelfDev', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'selectSelfDev', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('727405b5-69f9-4d8f-9ce8-4ff5373eda99', 'wrp', 'goto WRP', 'gotoWorkrestPlay', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'gotoWorkrestPlay', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('4c2a7390-9fb4-48e6-81f7-4d519fd62433', 'self Development page', 'self Development page', 'gotoSelfDev', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'gotoSelfDev', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('91ba97d6-0ddc-4f91-8f7b-e22bbcec298a', 'playWRP', 'playWRP', 'playWRP', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'playWRP', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('d7b70c11-16c8-42b6-8d99-dbc9196326ec', 'resume', 'resume session in bigscreen', 'resumeBigScreen', 'publish', NULL, NULL, NULL, NULL, NULL, 'resumeBigScreen', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('e5b76218-62cd-4088-b02f-4bb32727ce5e', 'durationVideo', 'duration video for bigScreen', 'durationVideo', 'publish', NULL, NULL, NULL, NULL, NULL, 'durationVideo', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('a20b454a-e99a-4864-a10c-1f60d2444c40', 'gotoHome', 'topic for back to home', 'gotoHome', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'gotoHome', '2024-11-20 02:43:52.962124+00', '2024-11-20 02:43:52.962124+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('44de8c1c-3fd6-4a14-812f-84a949a4b5ea', 'backPage', 'topic for back to previous page', 'backPage', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'backPage', '2024-11-20 02:44:07.803787+00', '2024-11-20 02:44:07.803787+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('1de6a546-87b4-4332-ad9e-950c883af988', 'Bluetooth Connected', 'Bluetooth Connected', 'BTConnected', 'publish', NULL, NULL, NULL, NULL, NULL, 'BTConnected', '2024-11-20 08:43:28.813411+00', '2024-11-20 08:43:28.813411+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('afcab07f-fedc-4beb-9acf-64031ab530f2', 'send preset to big screen from small screen 1', 'send preset to big screen from small screen 1', 'sendPresetData', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'sendPresetData', '2024-11-21 06:38:56.351464+00', '2024-11-21 06:38:56.351464+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('32856a11-b17c-48fa-8fd9-06d0a0a1119b', 'send preset to big screen from small screen 2', 'send preset to big screen from small screen 2', 'sendPresetData2', 'publish', NULL, NULL, NULL, NULL, NULL, 'sendPresetData2', '2024-11-21 06:39:07.428678+00', '2024-11-21 06:39:07.428678+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('2edad35e-93b8-434c-bf36-354f2b806aa6', 'Disconnect Bluetooth', 'Disconnect Bluetooth', 'BTDisConnect', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'BTDisConnect', '2024-11-23 03:16:14.377003+00', '2024-11-23 03:16:14.377003+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('b387f006-7ca7-4be1-9d81-cf2d36e47c8c', 'Open Settings Page', 'Open Settings Page', 'settings', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'settings', '2024-11-26 02:58:14.448611+00', '2024-11-26 02:58:14.448611+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('0b74cfdf-5165-4356-850f-d2872141b055', 'Open Settings Page', 'Open Settings Page', 'settings', 'publish', NULL, NULL, NULL, NULL, NULL, 'settings2', '2024-11-26 02:58:41.035394+00', '2024-11-26 02:58:41.035394+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('07eb8837-8949-40ff-b1ed-f335eba09072', 'BTPIN', 'BTPIN', 'BTPIN', 'publish', NULL, NULL, NULL, NULL, NULL, 'BTPIN', '2024-11-26 02:58:41.035394+00', '2024-11-26 02:58:41.035394+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('00a32ca2-3bbb-4f54-9c26-02750409d5d9', 'turnOnBT', 'turnOnBT', 'turnOnBT', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'turnOnBT', '2024-11-26 02:58:41.035394+00', '2024-11-26 02:58:41.035394+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('35c8a494-ea35-4110-b148-86bc02a88999', 'BTName', 'BTName', 'BTName', 'publish', NULL, NULL, NULL, NULL, NULL, 'BTName', '2024-11-26 02:58:41.035394+00', '2024-11-26 02:58:41.035394+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('44d99853-dcfe-45fa-b611-a5dc4ff38987', 'ConfirmBTPIN', 'ConfirmBTPIN', 'ConfirmBTPIN', 'subscribe', NULL, NULL, NULL, NULL, NULL, 'ConfirmBTPIN', '2024-11-26 02:58:41.035394+00', '2024-11-26 02:58:41.035394+00', NULL, NULL);
INSERT INTO public.socket_topics VALUES ('5de8b28c-2ca0-480d-a72a-363fc54759ac', 'BTDisConnected', 'BTDisConnected', 'BTDisConnected', 'publish', NULL, NULL, NULL, NULL, NULL, 'BTDisConnected', '2024-12-11 03:52:22.316294+00', '2024-12-11 03:52:22.316294+00', NULL, NULL);


--
-- Data for Name: terms_and_conditions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: terms_and_conditions_accepted; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.terms_and_conditions_accepted VALUES ('7df5a300-1d5f-4b13-9d44-f5ed89ddbb4b', '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', true, '2025-01-06 06:43:09.64+00', '2025-01-06 06:43:09.642+00', '2025-01-06 06:43:09.642+00', NULL);


--
-- Data for Name: terms_and_conditions_answers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.terms_and_conditions_answers VALUES (1, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', 1, false, '2025-01-06 06:43:09.639+00', NULL);
INSERT INTO public.terms_and_conditions_answers VALUES (2, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', 2, true, '2025-01-06 06:43:09.639+00', NULL);
INSERT INTO public.terms_and_conditions_answers VALUES (3, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', 3, false, '2025-01-06 06:43:09.639+00', NULL);
INSERT INTO public.terms_and_conditions_answers VALUES (4, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', 4, false, '2025-01-06 06:43:09.639+00', NULL);
INSERT INTO public.terms_and_conditions_answers VALUES (5, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', 5, false, '2025-01-06 06:43:09.639+00', NULL);
INSERT INTO public.terms_and_conditions_answers VALUES (6, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', 6, false, '2025-01-06 06:43:09.639+00', NULL);
INSERT INTO public.terms_and_conditions_answers VALUES (7, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', 7, false, '2025-01-06 06:43:09.639+00', NULL);


--
-- Data for Name: terms_and_conditions_questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.terms_and_conditions_questions VALUES (1, 'Are you pregnant?', 'Question information', true, '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL);
INSERT INTO public.terms_and_conditions_questions VALUES (2, 'Do you have any allergies?', 'Question information', true, '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL);
INSERT INTO public.terms_and_conditions_questions VALUES (3, 'Have you had a fever in the last 24 hours?', 'Question information', true, '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL);
INSERT INTO public.terms_and_conditions_questions VALUES (4, 'Are you currently taking any medication?', 'Question information', true, '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL);
INSERT INTO public.terms_and_conditions_questions VALUES (5, 'Do you have any chronic diseases?', 'Question information', true, '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL);
INSERT INTO public.terms_and_conditions_questions VALUES (6, 'Have you traveled internationally in the last 14 days?', 'Question information', true, '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL);
INSERT INTO public.terms_and_conditions_questions VALUES (7, 'test', 'just test', true, '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL);


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
INSERT INTO public."user" VALUES ('7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', 'faiz', NULL, 'faiz.regenesis@gmail.com', '$2b$10$ZvedftOQoqt63Nwv3wyvDuuqT7ICv6AVJqtnbbXYcXYpMBeyCoXyW', false, NULL, NULL, NULL, false, '2025-01-06 06:42:15.458+00', '2025-01-06 06:42:15.458+00');


--
-- Data for Name: user_favorite_self_development_sound; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_favorite_self_development_sound VALUES ('3d4a258e-59ca-4145-84d7-86d5b7c943aa', 'ce46c45b-0728-4384-adc5-88bb6cfb7617', '4bdeb08d-4d84-49b1-9524-91ed350a7dde', '2024-12-02 05:22:05.562475+00', '2024-12-02 05:22:05.562475+00', NULL);
INSERT INTO public.user_favorite_self_development_sound VALUES ('6e2597e1-9cd0-46e2-b3a2-9a014d832afc', 'ce46c45b-0728-4384-adc5-88bb6cfb7617', '99ba0688-0ea7-499d-8fd9-81dd4d82682b', NULL, NULL, NULL);


--
-- Data for Name: workrestplay; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.workrestplay VALUES ('5812b396-28f7-4e7a-8a43-8d933d2f0752', 'Work', 'preset 2', true, true, 75, 75, '4', 75, 75, NULL, NULL, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', NULL, 2);
INSERT INTO public.workrestplay VALUES ('2b2dc788-765b-4771-b2dd-4cee54d65d1a', 'Work', 'preset 3', true, true, 50, 50, '3', 50, 50, NULL, NULL, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', NULL, 3);
INSERT INTO public.workrestplay VALUES ('f3ec0cab-0be0-44f4-ab51-341eedab1c5b', 'Rest', 'preset 1', false, false, 40, 40, '2', 40, 40, NULL, NULL, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', NULL, 1);
INSERT INTO public.workrestplay VALUES ('937b6fd5-df51-4d93-91b5-3b37d29fcdfe', 'Rest', 'preset 2', false, false, 30, 30, '1', 30, 30, NULL, NULL, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', NULL, 2);
INSERT INTO public.workrestplay VALUES ('79226a10-a936-48dd-87a7-d9788b901e73', 'Rest', 'preset 3', false, false, 20, 20, '5', 20, 20, NULL, NULL, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', NULL, 3);
INSERT INTO public.workrestplay VALUES ('ff95354d-e074-4230-8f85-512f1df0f86b', 'Play', 'preset 1', true, true, 5, 5, '4', 5, 5, NULL, NULL, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', NULL, 1);
INSERT INTO public.workrestplay VALUES ('241ed6c0-7b8d-4c5a-b993-2e50cfbefe39', 'Play', 'preset 2', true, true, 90, 90, '3', 90, 90, NULL, NULL, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', NULL, 2);
INSERT INTO public.workrestplay VALUES ('e38a8dc8-4100-473d-a5ef-a1095acc34b5', 'Play', 'preset 3', true, true, 90, 90, '2', 60, 60, NULL, NULL, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', NULL, 3);
INSERT INTO public.workrestplay VALUES ('0a42d19e-36a0-4a29-8f37-3783ad94c5c9', 'Work', 'preset 1', true, true, 100, 100, '5', 56, 100, NULL, NULL, '7a4e7e36-cb09-4e3b-8f84-b6d39a186fbc', NULL, 1);


--
-- Data for Name: workrestplay_default; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.workrestplay_default VALUES ('8bb5a508-0cd0-4706-92ea-ce78f7b5517e', 'Work', 'preset 1', true, true, 100, 100, '5', 100, 100, '2024-12-02 13:22:05.562', '2024-12-02 13:22:05.562', 1);
INSERT INTO public.workrestplay_default VALUES ('abb9fc02-a2b5-4569-b2a3-fc928ffd7810', 'Work', 'preset 2', true, true, 75, 75, '4', 75, 75, '2024-12-02 13:22:05.562', '2024-12-02 13:22:05.562', 2);
INSERT INTO public.workrestplay_default VALUES ('73fea07f-5675-4ab3-8140-3046caebd1ca', 'Work', 'preset 3', true, true, 50, 50, '3', 50, 50, '2024-12-02 13:22:05.562', '2024-12-02 13:22:05.562', 3);
INSERT INTO public.workrestplay_default VALUES ('3fc11270-7dbb-4a8c-b67b-d2892748d969', 'Rest', 'preset 1', false, false, 40, 40, '2', 40, 40, '2024-12-02 13:22:05.562', '2024-12-02 13:22:05.562', 1);
INSERT INTO public.workrestplay_default VALUES ('94fe301a-8f07-4e90-a999-c14774667f6e', 'Rest', 'preset 2', false, false, 30, 30, '1', 30, 30, '2024-12-02 13:22:05.562', '2024-12-02 13:22:05.562', 2);
INSERT INTO public.workrestplay_default VALUES ('0f30ceb6-98b1-4de0-8ecd-f5fead60afdf', 'Rest', 'preset 3', false, false, 20, 20, '5', 20, 20, '2024-12-02 13:22:05.562', '2024-12-02 13:22:05.562', 3);
INSERT INTO public.workrestplay_default VALUES ('c4ff8bcd-d6ab-487c-83d3-cb675009d4ce', 'Play', 'preset 1', true, true, 5, 5, '4', 5, 5, '2024-12-02 13:22:05.562', '2024-12-02 13:22:05.562', 1);
INSERT INTO public.workrestplay_default VALUES ('f526898c-36c5-453a-9836-5c59c2588f98', 'Play', 'preset 2', true, true, 90, 90, '3', 90, 90, '2024-12-02 13:22:05.562', '2024-12-02 13:22:05.562', 2);
INSERT INTO public.workrestplay_default VALUES ('2f7f8484-2590-46c3-bc4b-9ed7dcecf6d8', 'Play', 'preset 3', true, true, 90, 90, '2', 60, 60, '2024-12-02 13:22:05.562', '2024-12-02 13:22:05.562', 3);


--
-- Name: agreement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.agreement_id_seq', 1, false);


--
-- Name: terms_and_conditions_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.terms_and_conditions_answers_id_seq', 7, true);


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

