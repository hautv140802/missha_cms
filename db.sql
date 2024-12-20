--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0 (Debian 17.0-1.pgdg120+1)
-- Dumped by pg_dump version 17.0 (Debian 17.0-1.pgdg120+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_permissions; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.admin_permissions (
    id integer NOT NULL,
    action character varying(255),
    action_parameters jsonb,
    subject character varying(255),
    properties jsonb,
    conditions jsonb,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_permissions OWNER TO missha_user;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.admin_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_id_seq OWNER TO missha_user;

--
-- Name: admin_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.admin_permissions_id_seq OWNED BY public.admin_permissions.id;


--
-- Name: admin_permissions_role_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.admin_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);


ALTER TABLE public.admin_permissions_role_links OWNER TO missha_user;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.admin_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNER TO missha_user;

--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.admin_permissions_role_links_id_seq OWNED BY public.admin_permissions_role_links.id;


--
-- Name: admin_roles; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.admin_roles (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    description character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_roles OWNER TO missha_user;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.admin_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_roles_id_seq OWNER TO missha_user;

--
-- Name: admin_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.admin_roles_id_seq OWNED BY public.admin_roles.id;


--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.admin_users (
    id integer NOT NULL,
    firstname character varying(255),
    lastname character varying(255),
    username character varying(255),
    email character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    registration_token character varying(255),
    is_active boolean,
    blocked boolean,
    prefered_language character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.admin_users OWNER TO missha_user;

--
-- Name: admin_users_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.admin_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_id_seq OWNER TO missha_user;

--
-- Name: admin_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.admin_users_id_seq OWNED BY public.admin_users.id;


--
-- Name: admin_users_roles_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.admin_users_roles_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    role_order double precision,
    user_order double precision
);


ALTER TABLE public.admin_users_roles_links OWNER TO missha_user;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.admin_users_roles_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNER TO missha_user;

--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.admin_users_roles_links_id_seq OWNED BY public.admin_users_roles_links.id;


--
-- Name: bookings; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.bookings (
    id integer NOT NULL,
    customer_email character varying(255),
    customer_full_name character varying(255),
    customer_phone character varying(255),
    date timestamp(6) without time zone,
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.bookings OWNER TO missha_user;

--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.bookings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_id_seq OWNER TO missha_user;

--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- Name: bookings_service_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.bookings_service_links (
    id integer NOT NULL,
    booking_id integer,
    service_id integer
);


ALTER TABLE public.bookings_service_links OWNER TO missha_user;

--
-- Name: bookings_service_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.bookings_service_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_service_links_id_seq OWNER TO missha_user;

--
-- Name: bookings_service_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.bookings_service_links_id_seq OWNED BY public.bookings_service_links.id;


--
-- Name: bookings_user_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.bookings_user_links (
    id integer NOT NULL,
    booking_id integer,
    user_id integer
);


ALTER TABLE public.bookings_user_links OWNER TO missha_user;

--
-- Name: bookings_user_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.bookings_user_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_user_links_id_seq OWNER TO missha_user;

--
-- Name: bookings_user_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.bookings_user_links_id_seq OWNED BY public.bookings_user_links.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.categories OWNER TO missha_user;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_id_seq OWNER TO missha_user;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.files (
    id integer NOT NULL,
    name character varying(255),
    alternative_text character varying(255),
    caption character varying(255),
    width integer,
    height integer,
    formats jsonb,
    hash character varying(255),
    ext character varying(255),
    mime character varying(255),
    size numeric(10,2),
    url character varying(255),
    preview_url character varying(255),
    provider character varying(255),
    provider_metadata jsonb,
    folder_path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.files OWNER TO missha_user;

--
-- Name: files_folder_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.files_folder_links (
    id integer NOT NULL,
    file_id integer,
    folder_id integer,
    file_order double precision
);


ALTER TABLE public.files_folder_links OWNER TO missha_user;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.files_folder_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_folder_links_id_seq OWNER TO missha_user;

--
-- Name: files_folder_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.files_folder_links_id_seq OWNED BY public.files_folder_links.id;


--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_id_seq OWNER TO missha_user;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: files_related_morphs; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.files_related_morphs (
    id integer NOT NULL,
    file_id integer,
    related_id integer,
    related_type character varying(255),
    field character varying(255),
    "order" double precision
);


ALTER TABLE public.files_related_morphs OWNER TO missha_user;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.files_related_morphs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.files_related_morphs_id_seq OWNER TO missha_user;

--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.files_related_morphs_id_seq OWNED BY public.files_related_morphs.id;


--
-- Name: i18n_locale; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.i18n_locale (
    id integer NOT NULL,
    name character varying(255),
    code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.i18n_locale OWNER TO missha_user;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.i18n_locale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.i18n_locale_id_seq OWNER TO missha_user;

--
-- Name: i18n_locale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.i18n_locale_id_seq OWNED BY public.i18n_locale.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    content text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.messages OWNER TO missha_user;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messages_id_seq OWNER TO missha_user;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: messages_room_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.messages_room_links (
    id integer NOT NULL,
    message_id integer,
    room_id integer
);


ALTER TABLE public.messages_room_links OWNER TO missha_user;

--
-- Name: messages_room_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.messages_room_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messages_room_links_id_seq OWNER TO missha_user;

--
-- Name: messages_room_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.messages_room_links_id_seq OWNED BY public.messages_room_links.id;


--
-- Name: messages_sender_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.messages_sender_links (
    id integer NOT NULL,
    message_id integer,
    user_id integer
);


ALTER TABLE public.messages_sender_links OWNER TO missha_user;

--
-- Name: messages_sender_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.messages_sender_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messages_sender_links_id_seq OWNER TO missha_user;

--
-- Name: messages_sender_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.messages_sender_links_id_seq OWNED BY public.messages_sender_links.id;


--
-- Name: order_details; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.order_details (
    id integer NOT NULL,
    unit_price bigint,
    quantity integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.order_details OWNER TO missha_user;

--
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.order_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_details_id_seq OWNER TO missha_user;

--
-- Name: order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.order_details_id_seq OWNED BY public.order_details.id;


--
-- Name: order_details_order_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.order_details_order_links (
    id integer NOT NULL,
    order_detail_id integer,
    order_id integer,
    order_detail_order double precision
);


ALTER TABLE public.order_details_order_links OWNER TO missha_user;

--
-- Name: order_details_order_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.order_details_order_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_details_order_links_id_seq OWNER TO missha_user;

--
-- Name: order_details_order_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.order_details_order_links_id_seq OWNED BY public.order_details_order_links.id;


--
-- Name: order_details_product_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.order_details_product_links (
    id integer NOT NULL,
    order_detail_id integer,
    product_id integer
);


ALTER TABLE public.order_details_product_links OWNER TO missha_user;

--
-- Name: order_details_product_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.order_details_product_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_details_product_links_id_seq OWNER TO missha_user;

--
-- Name: order_details_product_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.order_details_product_links_id_seq OWNED BY public.order_details_product_links.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    customer_email character varying(255),
    customer_full_name character varying(255),
    customer_phone character varying(255),
    shipping_address character varying(255),
    shipping_method character varying(255),
    payment_method character varying(255),
    total bigint,
    status character varying(255),
    transport_fee bigint,
    order_code character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    reason character varying(255)
);


ALTER TABLE public.orders OWNER TO missha_user;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO missha_user;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: orders_user_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.orders_user_links (
    id integer NOT NULL,
    order_id integer,
    user_id integer
);


ALTER TABLE public.orders_user_links OWNER TO missha_user;

--
-- Name: orders_user_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.orders_user_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_user_links_id_seq OWNER TO missha_user;

--
-- Name: orders_user_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.orders_user_links_id_seq OWNED BY public.orders_user_links.id;


--
-- Name: orders_voucher_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.orders_voucher_links (
    id integer NOT NULL,
    order_id integer,
    voucher_id integer
);


ALTER TABLE public.orders_voucher_links OWNER TO missha_user;

--
-- Name: orders_voucher_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.orders_voucher_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_voucher_links_id_seq OWNER TO missha_user;

--
-- Name: orders_voucher_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.orders_voucher_links_id_seq OWNED BY public.orders_voucher_links.id;


--
-- Name: product_lines; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.product_lines (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.product_lines OWNER TO missha_user;

--
-- Name: product_lines_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.product_lines_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_lines_id_seq OWNER TO missha_user;

--
-- Name: product_lines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.product_lines_id_seq OWNED BY public.product_lines.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    price bigint,
    sale_price bigint,
    total_purchase integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    description text,
    quan integer,
    quantity integer
);


ALTER TABLE public.products OWNER TO missha_user;

--
-- Name: products_categories_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.products_categories_links (
    id integer NOT NULL,
    product_id integer,
    category_id integer,
    category_order double precision,
    product_order double precision
);


ALTER TABLE public.products_categories_links OWNER TO missha_user;

--
-- Name: products_categories_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.products_categories_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_categories_links_id_seq OWNER TO missha_user;

--
-- Name: products_categories_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.products_categories_links_id_seq OWNED BY public.products_categories_links.id;


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO missha_user;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: products_product_line_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.products_product_line_links (
    id integer NOT NULL,
    product_id integer,
    product_line_id integer,
    product_order double precision
);


ALTER TABLE public.products_product_line_links OWNER TO missha_user;

--
-- Name: products_product_line_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.products_product_line_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_line_links_id_seq OWNER TO missha_user;

--
-- Name: products_product_line_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.products_product_line_links_id_seq OWNED BY public.products_product_line_links.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.rooms (
    id integer NOT NULL,
    room_id character varying(255),
    seen_status boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.rooms OWNER TO missha_user;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.rooms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rooms_id_seq OWNER TO missha_user;

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- Name: rooms_user_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.rooms_user_links (
    id integer NOT NULL,
    room_id integer,
    user_id integer
);


ALTER TABLE public.rooms_user_links OWNER TO missha_user;

--
-- Name: rooms_user_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.rooms_user_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rooms_user_links_id_seq OWNER TO missha_user;

--
-- Name: rooms_user_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.rooms_user_links_id_seq OWNED BY public.rooms_user_links.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.services (
    id integer NOT NULL,
    title character varying(255),
    short_description text,
    price bigint,
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.services OWNER TO missha_user;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO missha_user;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: skin_properties; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.skin_properties (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    published_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.skin_properties OWNER TO missha_user;

--
-- Name: skin_properties_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.skin_properties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skin_properties_id_seq OWNER TO missha_user;

--
-- Name: skin_properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.skin_properties_id_seq OWNED BY public.skin_properties.id;


--
-- Name: skin_properties_products_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.skin_properties_products_links (
    id integer NOT NULL,
    skin_property_id integer,
    product_id integer,
    product_order double precision,
    skin_property_order double precision
);


ALTER TABLE public.skin_properties_products_links OWNER TO missha_user;

--
-- Name: skin_properties_products_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.skin_properties_products_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skin_properties_products_links_id_seq OWNER TO missha_user;

--
-- Name: skin_properties_products_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.skin_properties_products_links_id_seq OWNED BY public.skin_properties_products_links.id;


--
-- Name: slugs; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.slugs (
    id integer NOT NULL,
    slug text,
    count integer,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.slugs OWNER TO missha_user;

--
-- Name: slugs_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.slugs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.slugs_id_seq OWNER TO missha_user;

--
-- Name: slugs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.slugs_id_seq OWNED BY public.slugs.id;


--
-- Name: strapi_api_token_permissions; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.strapi_api_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_token_permissions OWNER TO missha_user;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.strapi_api_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNER TO missha_user;

--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.strapi_api_token_permissions_id_seq OWNED BY public.strapi_api_token_permissions.id;


--
-- Name: strapi_api_token_permissions_token_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.strapi_api_token_permissions_token_links (
    id integer NOT NULL,
    api_token_permission_id integer,
    api_token_id integer,
    api_token_permission_order double precision
);


ALTER TABLE public.strapi_api_token_permissions_token_links OWNER TO missha_user;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.strapi_api_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNER TO missha_user;

--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.strapi_api_token_permissions_token_links_id_seq OWNED BY public.strapi_api_token_permissions_token_links.id;


--
-- Name: strapi_api_tokens; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.strapi_api_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_api_tokens OWNER TO missha_user;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.strapi_api_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNER TO missha_user;

--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.strapi_api_tokens_id_seq OWNED BY public.strapi_api_tokens.id;


--
-- Name: strapi_core_store_settings; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.strapi_core_store_settings (
    id integer NOT NULL,
    key character varying(255),
    value text,
    type character varying(255),
    environment character varying(255),
    tag character varying(255)
);


ALTER TABLE public.strapi_core_store_settings OWNER TO missha_user;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.strapi_core_store_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNER TO missha_user;

--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.strapi_core_store_settings_id_seq OWNED BY public.strapi_core_store_settings.id;


--
-- Name: strapi_database_schema; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.strapi_database_schema (
    id integer NOT NULL,
    schema json,
    "time" timestamp without time zone,
    hash character varying(255)
);


ALTER TABLE public.strapi_database_schema OWNER TO missha_user;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.strapi_database_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_database_schema_id_seq OWNER TO missha_user;

--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.strapi_database_schema_id_seq OWNED BY public.strapi_database_schema.id;


--
-- Name: strapi_migrations; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.strapi_migrations (
    id integer NOT NULL,
    name character varying(255),
    "time" timestamp without time zone
);


ALTER TABLE public.strapi_migrations OWNER TO missha_user;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.strapi_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_migrations_id_seq OWNER TO missha_user;

--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.strapi_migrations_id_seq OWNED BY public.strapi_migrations.id;


--
-- Name: strapi_release_actions; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.strapi_release_actions (
    id integer NOT NULL,
    type character varying(255),
    target_id integer,
    target_type character varying(255),
    content_type character varying(255),
    locale character varying(255),
    is_entry_valid boolean,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_release_actions OWNER TO missha_user;

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.strapi_release_actions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_id_seq OWNER TO missha_user;

--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.strapi_release_actions_id_seq OWNED BY public.strapi_release_actions.id;


--
-- Name: strapi_release_actions_release_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.strapi_release_actions_release_links (
    id integer NOT NULL,
    release_action_id integer,
    release_id integer,
    release_action_order double precision
);


ALTER TABLE public.strapi_release_actions_release_links OWNER TO missha_user;

--
-- Name: strapi_release_actions_release_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.strapi_release_actions_release_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_release_actions_release_links_id_seq OWNER TO missha_user;

--
-- Name: strapi_release_actions_release_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.strapi_release_actions_release_links_id_seq OWNED BY public.strapi_release_actions_release_links.id;


--
-- Name: strapi_releases; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.strapi_releases (
    id integer NOT NULL,
    name character varying(255),
    released_at timestamp(6) without time zone,
    scheduled_at timestamp(6) without time zone,
    timezone character varying(255),
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_releases OWNER TO missha_user;

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.strapi_releases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_releases_id_seq OWNER TO missha_user;

--
-- Name: strapi_releases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.strapi_releases_id_seq OWNED BY public.strapi_releases.id;


--
-- Name: strapi_transfer_token_permissions; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.strapi_transfer_token_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_token_permissions OWNER TO missha_user;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNER TO missha_user;

--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_id_seq OWNED BY public.strapi_transfer_token_permissions.id;


--
-- Name: strapi_transfer_token_permissions_token_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.strapi_transfer_token_permissions_token_links (
    id integer NOT NULL,
    transfer_token_permission_id integer,
    transfer_token_id integer,
    transfer_token_permission_order double precision
);


ALTER TABLE public.strapi_transfer_token_permissions_token_links OWNER TO missha_user;

--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq OWNER TO missha_user;

--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.strapi_transfer_token_permissions_token_links_id_seq OWNED BY public.strapi_transfer_token_permissions_token_links.id;


--
-- Name: strapi_transfer_tokens; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.strapi_transfer_tokens (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    access_key character varying(255),
    last_used_at timestamp(6) without time zone,
    expires_at timestamp(6) without time zone,
    lifespan bigint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.strapi_transfer_tokens OWNER TO missha_user;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.strapi_transfer_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNER TO missha_user;

--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.strapi_transfer_tokens_id_seq OWNED BY public.strapi_transfer_tokens.id;


--
-- Name: strapi_webhooks; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.strapi_webhooks (
    id integer NOT NULL,
    name character varying(255),
    url text,
    headers jsonb,
    events jsonb,
    enabled boolean
);


ALTER TABLE public.strapi_webhooks OWNER TO missha_user;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.strapi_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.strapi_webhooks_id_seq OWNER TO missha_user;

--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.strapi_webhooks_id_seq OWNED BY public.strapi_webhooks.id;


--
-- Name: up_permissions; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.up_permissions (
    id integer NOT NULL,
    action character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_permissions OWNER TO missha_user;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.up_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_id_seq OWNER TO missha_user;

--
-- Name: up_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.up_permissions_id_seq OWNED BY public.up_permissions.id;


--
-- Name: up_permissions_role_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.up_permissions_role_links (
    id integer NOT NULL,
    permission_id integer,
    role_id integer,
    permission_order double precision
);


ALTER TABLE public.up_permissions_role_links OWNER TO missha_user;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.up_permissions_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNER TO missha_user;

--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.up_permissions_role_links_id_seq OWNED BY public.up_permissions_role_links.id;


--
-- Name: up_roles; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.up_roles (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.up_roles OWNER TO missha_user;

--
-- Name: up_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.up_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_roles_id_seq OWNER TO missha_user;

--
-- Name: up_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.up_roles_id_seq OWNED BY public.up_roles.id;


--
-- Name: up_users; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.up_users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    provider character varying(255),
    password character varying(255),
    reset_password_token character varying(255),
    confirmation_token character varying(255),
    confirmed boolean,
    blocked boolean,
    address text,
    full_name character varying(255),
    phone character varying(255),
    gender character varying(255),
    type character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    birthday date
);


ALTER TABLE public.up_users OWNER TO missha_user;

--
-- Name: up_users_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.up_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_id_seq OWNER TO missha_user;

--
-- Name: up_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.up_users_id_seq OWNED BY public.up_users.id;


--
-- Name: up_users_role_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.up_users_role_links (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    user_order double precision
);


ALTER TABLE public.up_users_role_links OWNER TO missha_user;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.up_users_role_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.up_users_role_links_id_seq OWNER TO missha_user;

--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.up_users_role_links_id_seq OWNED BY public.up_users_role_links.id;


--
-- Name: upload_folders; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.upload_folders (
    id integer NOT NULL,
    name character varying(255),
    path_id integer,
    path character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.upload_folders OWNER TO missha_user;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.upload_folders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_id_seq OWNER TO missha_user;

--
-- Name: upload_folders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.upload_folders_id_seq OWNED BY public.upload_folders.id;


--
-- Name: upload_folders_parent_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.upload_folders_parent_links (
    id integer NOT NULL,
    folder_id integer,
    inv_folder_id integer,
    folder_order double precision
);


ALTER TABLE public.upload_folders_parent_links OWNER TO missha_user;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.upload_folders_parent_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNER TO missha_user;

--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.upload_folders_parent_links_id_seq OWNED BY public.upload_folders_parent_links.id;


--
-- Name: user_vouchers; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.user_vouchers (
    id integer NOT NULL,
    status character varying(255),
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer
);


ALTER TABLE public.user_vouchers OWNER TO missha_user;

--
-- Name: user_vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.user_vouchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_vouchers_id_seq OWNER TO missha_user;

--
-- Name: user_vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.user_vouchers_id_seq OWNED BY public.user_vouchers.id;


--
-- Name: user_vouchers_user_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.user_vouchers_user_links (
    id integer NOT NULL,
    user_voucher_id integer,
    user_id integer
);


ALTER TABLE public.user_vouchers_user_links OWNER TO missha_user;

--
-- Name: user_vouchers_user_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.user_vouchers_user_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_vouchers_user_links_id_seq OWNER TO missha_user;

--
-- Name: user_vouchers_user_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.user_vouchers_user_links_id_seq OWNED BY public.user_vouchers_user_links.id;


--
-- Name: user_vouchers_voucher_links; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.user_vouchers_voucher_links (
    id integer NOT NULL,
    user_voucher_id integer,
    voucher_id integer
);


ALTER TABLE public.user_vouchers_voucher_links OWNER TO missha_user;

--
-- Name: user_vouchers_voucher_links_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.user_vouchers_voucher_links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_vouchers_voucher_links_id_seq OWNER TO missha_user;

--
-- Name: user_vouchers_voucher_links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.user_vouchers_voucher_links_id_seq OWNED BY public.user_vouchers_voucher_links.id;


--
-- Name: vouchers; Type: TABLE; Schema: public; Owner: missha_user
--

CREATE TABLE public.vouchers (
    id integer NOT NULL,
    code character varying(255),
    amount_decrease bigint,
    title text,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by_id integer,
    updated_by_id integer,
    public boolean
);


ALTER TABLE public.vouchers OWNER TO missha_user;

--
-- Name: vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: missha_user
--

CREATE SEQUENCE public.vouchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vouchers_id_seq OWNER TO missha_user;

--
-- Name: vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: missha_user
--

ALTER SEQUENCE public.vouchers_id_seq OWNED BY public.vouchers.id;


--
-- Name: admin_permissions id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_permissions ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_id_seq'::regclass);


--
-- Name: admin_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.admin_permissions_role_links_id_seq'::regclass);


--
-- Name: admin_roles id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_roles ALTER COLUMN id SET DEFAULT nextval('public.admin_roles_id_seq'::regclass);


--
-- Name: admin_users id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_users ALTER COLUMN id SET DEFAULT nextval('public.admin_users_id_seq'::regclass);


--
-- Name: admin_users_roles_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_users_roles_links ALTER COLUMN id SET DEFAULT nextval('public.admin_users_roles_links_id_seq'::regclass);


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: bookings_service_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.bookings_service_links ALTER COLUMN id SET DEFAULT nextval('public.bookings_service_links_id_seq'::regclass);


--
-- Name: bookings_user_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.bookings_user_links ALTER COLUMN id SET DEFAULT nextval('public.bookings_user_links_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: files_folder_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.files_folder_links ALTER COLUMN id SET DEFAULT nextval('public.files_folder_links_id_seq'::regclass);


--
-- Name: files_related_morphs id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.files_related_morphs ALTER COLUMN id SET DEFAULT nextval('public.files_related_morphs_id_seq'::regclass);


--
-- Name: i18n_locale id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.i18n_locale ALTER COLUMN id SET DEFAULT nextval('public.i18n_locale_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: messages_room_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.messages_room_links ALTER COLUMN id SET DEFAULT nextval('public.messages_room_links_id_seq'::regclass);


--
-- Name: messages_sender_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.messages_sender_links ALTER COLUMN id SET DEFAULT nextval('public.messages_sender_links_id_seq'::regclass);


--
-- Name: order_details id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.order_details ALTER COLUMN id SET DEFAULT nextval('public.order_details_id_seq'::regclass);


--
-- Name: order_details_order_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.order_details_order_links ALTER COLUMN id SET DEFAULT nextval('public.order_details_order_links_id_seq'::regclass);


--
-- Name: order_details_product_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.order_details_product_links ALTER COLUMN id SET DEFAULT nextval('public.order_details_product_links_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: orders_user_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.orders_user_links ALTER COLUMN id SET DEFAULT nextval('public.orders_user_links_id_seq'::regclass);


--
-- Name: orders_voucher_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.orders_voucher_links ALTER COLUMN id SET DEFAULT nextval('public.orders_voucher_links_id_seq'::regclass);


--
-- Name: product_lines id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.product_lines ALTER COLUMN id SET DEFAULT nextval('public.product_lines_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products_categories_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.products_categories_links ALTER COLUMN id SET DEFAULT nextval('public.products_categories_links_id_seq'::regclass);


--
-- Name: products_product_line_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.products_product_line_links ALTER COLUMN id SET DEFAULT nextval('public.products_product_line_links_id_seq'::regclass);


--
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- Name: rooms_user_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.rooms_user_links ALTER COLUMN id SET DEFAULT nextval('public.rooms_user_links_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: skin_properties id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.skin_properties ALTER COLUMN id SET DEFAULT nextval('public.skin_properties_id_seq'::regclass);


--
-- Name: skin_properties_products_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.skin_properties_products_links ALTER COLUMN id SET DEFAULT nextval('public.skin_properties_products_links_id_seq'::regclass);


--
-- Name: slugs id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.slugs ALTER COLUMN id SET DEFAULT nextval('public.slugs_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_id_seq'::regclass);


--
-- Name: strapi_api_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_api_tokens id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_api_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_api_tokens_id_seq'::regclass);


--
-- Name: strapi_core_store_settings id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_core_store_settings ALTER COLUMN id SET DEFAULT nextval('public.strapi_core_store_settings_id_seq'::regclass);


--
-- Name: strapi_database_schema id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_database_schema ALTER COLUMN id SET DEFAULT nextval('public.strapi_database_schema_id_seq'::regclass);


--
-- Name: strapi_migrations id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_migrations ALTER COLUMN id SET DEFAULT nextval('public.strapi_migrations_id_seq'::regclass);


--
-- Name: strapi_release_actions id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_release_actions ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_id_seq'::regclass);


--
-- Name: strapi_release_actions_release_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_release_actions_release_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_release_actions_release_links_id_seq'::regclass);


--
-- Name: strapi_releases id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_releases ALTER COLUMN id SET DEFAULT nextval('public.strapi_releases_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_id_seq'::regclass);


--
-- Name: strapi_transfer_token_permissions_token_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_token_permissions_token_links_id_seq'::regclass);


--
-- Name: strapi_transfer_tokens id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_transfer_tokens ALTER COLUMN id SET DEFAULT nextval('public.strapi_transfer_tokens_id_seq'::regclass);


--
-- Name: strapi_webhooks id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_webhooks ALTER COLUMN id SET DEFAULT nextval('public.strapi_webhooks_id_seq'::regclass);


--
-- Name: up_permissions id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_permissions ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_id_seq'::regclass);


--
-- Name: up_permissions_role_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_permissions_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_permissions_role_links_id_seq'::regclass);


--
-- Name: up_roles id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_roles ALTER COLUMN id SET DEFAULT nextval('public.up_roles_id_seq'::regclass);


--
-- Name: up_users id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_users ALTER COLUMN id SET DEFAULT nextval('public.up_users_id_seq'::regclass);


--
-- Name: up_users_role_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_users_role_links ALTER COLUMN id SET DEFAULT nextval('public.up_users_role_links_id_seq'::regclass);


--
-- Name: upload_folders id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.upload_folders ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_id_seq'::regclass);


--
-- Name: upload_folders_parent_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.upload_folders_parent_links ALTER COLUMN id SET DEFAULT nextval('public.upload_folders_parent_links_id_seq'::regclass);


--
-- Name: user_vouchers id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.user_vouchers ALTER COLUMN id SET DEFAULT nextval('public.user_vouchers_id_seq'::regclass);


--
-- Name: user_vouchers_user_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.user_vouchers_user_links ALTER COLUMN id SET DEFAULT nextval('public.user_vouchers_user_links_id_seq'::regclass);


--
-- Name: user_vouchers_voucher_links id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.user_vouchers_voucher_links ALTER COLUMN id SET DEFAULT nextval('public.user_vouchers_voucher_links_id_seq'::regclass);


--
-- Name: vouchers id; Type: DEFAULT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.vouchers ALTER COLUMN id SET DEFAULT nextval('public.vouchers_id_seq'::regclass);


--
-- Data for Name: admin_permissions; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.admin_permissions (id, action, action_parameters, subject, properties, conditions, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
2	plugin::content-manager.explorer.create	{}	api::category.category	{"fields": ["name", "slug", "banner", "products"]}	[]	2024-10-19 19:44:08.514	2024-10-19 19:44:08.514	\N	\N
3	plugin::content-manager.explorer.create	{}	api::message.message	{"fields": ["image", "sender", "content", "room"]}	[]	2024-10-19 19:44:08.534	2024-10-19 19:44:08.534	\N	\N
4	plugin::content-manager.explorer.create	{}	api::order.order	{"fields": ["customer_email", "customer_full_name", "customer_phone", "shipping_address", "shipping_method", "payment_method", "total", "status", "user", "voucher", "transport_fee", "order_code"]}	[]	2024-10-19 19:44:08.555	2024-10-19 19:44:08.555	\N	\N
5	plugin::content-manager.explorer.create	{}	api::order-detail.order-detail	{"fields": ["product", "order", "unit_price", "quantity"]}	[]	2024-10-19 19:44:08.573	2024-10-19 19:44:08.573	\N	\N
7	plugin::content-manager.explorer.create	{}	api::product-line.product-line	{"fields": ["name", "slug", "products"]}	[]	2024-10-19 19:44:08.612	2024-10-19 19:44:08.612	\N	\N
8	plugin::content-manager.explorer.create	{}	api::room.room	{"fields": ["room_id", "user", "seen_status"]}	[]	2024-10-19 19:44:08.63	2024-10-19 19:44:08.63	\N	\N
9	plugin::content-manager.explorer.create	{}	api::skin-property.skin-property	{"fields": ["name", "slug", "products"]}	[]	2024-10-19 19:44:08.658	2024-10-19 19:44:08.658	\N	\N
10	plugin::content-manager.explorer.create	{}	api::user-voucher.user-voucher	{"fields": ["user", "voucher", "status"]}	[]	2024-10-19 19:44:08.678	2024-10-19 19:44:08.678	\N	\N
11	plugin::content-manager.explorer.create	{}	api::voucher.voucher	{"fields": ["code", "amount_decrease", "image", "title"]}	[]	2024-10-19 19:44:08.698	2024-10-19 19:44:08.698	\N	\N
13	plugin::content-manager.explorer.read	{}	api::category.category	{"fields": ["name", "slug", "banner", "products"]}	[]	2024-10-19 19:44:08.735	2024-10-19 19:44:08.735	\N	\N
14	plugin::content-manager.explorer.read	{}	api::message.message	{"fields": ["image", "sender", "content", "room"]}	[]	2024-10-19 19:44:08.754	2024-10-19 19:44:08.754	\N	\N
15	plugin::content-manager.explorer.read	{}	api::order.order	{"fields": ["customer_email", "customer_full_name", "customer_phone", "shipping_address", "shipping_method", "payment_method", "total", "status", "user", "voucher", "transport_fee", "order_code"]}	[]	2024-10-19 19:44:08.786	2024-10-19 19:44:08.786	\N	\N
16	plugin::content-manager.explorer.read	{}	api::order-detail.order-detail	{"fields": ["product", "order", "unit_price", "quantity"]}	[]	2024-10-19 19:44:08.803	2024-10-19 19:44:08.803	\N	\N
18	plugin::content-manager.explorer.read	{}	api::product-line.product-line	{"fields": ["name", "slug", "products"]}	[]	2024-10-19 19:44:08.838	2024-10-19 19:44:08.838	\N	\N
19	plugin::content-manager.explorer.read	{}	api::room.room	{"fields": ["room_id", "user", "seen_status"]}	[]	2024-10-19 19:44:08.858	2024-10-19 19:44:08.858	\N	\N
20	plugin::content-manager.explorer.read	{}	api::skin-property.skin-property	{"fields": ["name", "slug", "products"]}	[]	2024-10-19 19:44:08.875	2024-10-19 19:44:08.875	\N	\N
21	plugin::content-manager.explorer.read	{}	api::user-voucher.user-voucher	{"fields": ["user", "voucher", "status"]}	[]	2024-10-19 19:44:08.894	2024-10-19 19:44:08.894	\N	\N
22	plugin::content-manager.explorer.read	{}	api::voucher.voucher	{"fields": ["code", "amount_decrease", "image", "title"]}	[]	2024-10-19 19:44:08.911	2024-10-19 19:44:08.911	\N	\N
24	plugin::content-manager.explorer.update	{}	api::category.category	{"fields": ["name", "slug", "banner", "products"]}	[]	2024-10-19 19:44:08.947	2024-10-19 19:44:08.947	\N	\N
25	plugin::content-manager.explorer.update	{}	api::message.message	{"fields": ["image", "sender", "content", "room"]}	[]	2024-10-19 19:44:08.966	2024-10-19 19:44:08.966	\N	\N
26	plugin::content-manager.explorer.update	{}	api::order.order	{"fields": ["customer_email", "customer_full_name", "customer_phone", "shipping_address", "shipping_method", "payment_method", "total", "status", "user", "voucher", "transport_fee", "order_code"]}	[]	2024-10-19 19:44:08.985	2024-10-19 19:44:08.985	\N	\N
27	plugin::content-manager.explorer.update	{}	api::order-detail.order-detail	{"fields": ["product", "order", "unit_price", "quantity"]}	[]	2024-10-19 19:44:09.002	2024-10-19 19:44:09.002	\N	\N
29	plugin::content-manager.explorer.update	{}	api::product-line.product-line	{"fields": ["name", "slug", "products"]}	[]	2024-10-19 19:44:09.05	2024-10-19 19:44:09.05	\N	\N
30	plugin::content-manager.explorer.update	{}	api::room.room	{"fields": ["room_id", "user", "seen_status"]}	[]	2024-10-19 19:44:09.066	2024-10-19 19:44:09.066	\N	\N
31	plugin::content-manager.explorer.update	{}	api::skin-property.skin-property	{"fields": ["name", "slug", "products"]}	[]	2024-10-19 19:44:09.085	2024-10-19 19:44:09.085	\N	\N
32	plugin::content-manager.explorer.update	{}	api::user-voucher.user-voucher	{"fields": ["user", "voucher", "status"]}	[]	2024-10-19 19:44:09.105	2024-10-19 19:44:09.105	\N	\N
33	plugin::content-manager.explorer.update	{}	api::voucher.voucher	{"fields": ["code", "amount_decrease", "image", "title"]}	[]	2024-10-19 19:44:09.125	2024-10-19 19:44:09.125	\N	\N
34	plugin::content-manager.explorer.delete	{}	api::booking.booking	{}	[]	2024-10-19 19:44:09.141	2024-10-19 19:44:09.141	\N	\N
35	plugin::content-manager.explorer.delete	{}	api::category.category	{}	[]	2024-10-19 19:44:09.16	2024-10-19 19:44:09.16	\N	\N
36	plugin::content-manager.explorer.delete	{}	api::message.message	{}	[]	2024-10-19 19:44:09.176	2024-10-19 19:44:09.176	\N	\N
37	plugin::content-manager.explorer.delete	{}	api::order.order	{}	[]	2024-10-19 19:44:09.195	2024-10-19 19:44:09.195	\N	\N
38	plugin::content-manager.explorer.delete	{}	api::order-detail.order-detail	{}	[]	2024-10-19 19:44:09.21	2024-10-19 19:44:09.21	\N	\N
12	plugin::content-manager.explorer.read	{}	api::booking.booking	{"fields": ["user", "customer_email", "customer_full_name", "customer_phone", "date", "status"]}	[]	2024-10-19 19:44:08.717	2024-10-20 10:35:41.48	\N	\N
6	plugin::content-manager.explorer.create	{}	api::product.product	{"fields": ["name", "slug", "categories", "gallery", "avatar", "price", "sale_price", "total_purchase", "product_line", "skin_properties"]}	[]	2024-10-19 19:44:08.594	2024-10-25 09:46:08.226	\N	\N
17	plugin::content-manager.explorer.read	{}	api::product.product	{"fields": ["name", "slug", "categories", "gallery", "avatar", "price", "sale_price", "total_purchase", "product_line", "skin_properties"]}	[]	2024-10-19 19:44:08.822	2024-10-25 09:46:08.226	\N	\N
28	plugin::content-manager.explorer.update	{}	api::product.product	{"fields": ["name", "slug", "categories", "gallery", "avatar", "price", "sale_price", "total_purchase", "product_line", "skin_properties"]}	[]	2024-10-19 19:44:09.024	2024-10-25 09:46:08.226	\N	\N
39	plugin::content-manager.explorer.delete	{}	api::product.product	{}	[]	2024-10-19 19:44:09.229	2024-10-19 19:44:09.229	\N	\N
40	plugin::content-manager.explorer.delete	{}	api::product-line.product-line	{}	[]	2024-10-19 19:44:09.248	2024-10-19 19:44:09.248	\N	\N
41	plugin::content-manager.explorer.delete	{}	api::room.room	{}	[]	2024-10-19 19:44:09.266	2024-10-19 19:44:09.266	\N	\N
42	plugin::content-manager.explorer.delete	{}	api::skin-property.skin-property	{}	[]	2024-10-19 19:44:09.284	2024-10-19 19:44:09.284	\N	\N
43	plugin::content-manager.explorer.delete	{}	api::user-voucher.user-voucher	{}	[]	2024-10-19 19:44:09.3	2024-10-19 19:44:09.3	\N	\N
44	plugin::content-manager.explorer.delete	{}	api::voucher.voucher	{}	[]	2024-10-19 19:44:09.318	2024-10-19 19:44:09.318	\N	\N
45	plugin::content-manager.explorer.publish	{}	api::booking.booking	{}	[]	2024-10-19 19:44:09.334	2024-10-19 19:44:09.334	\N	\N
46	plugin::content-manager.explorer.publish	{}	api::message.message	{}	[]	2024-10-19 19:44:09.354	2024-10-19 19:44:09.354	\N	\N
49	plugin::content-manager.explorer.publish	{}	api::room.room	{}	[]	2024-10-19 19:44:09.403	2024-10-19 19:44:09.403	\N	\N
50	plugin::content-manager.explorer.publish	{}	api::skin-property.skin-property	{}	[]	2024-10-19 19:44:09.422	2024-10-19 19:44:09.422	\N	\N
53	plugin::upload.read	{}	\N	{}	[]	2024-10-19 19:44:09.471	2024-10-19 19:44:09.471	\N	\N
54	plugin::upload.configure-view	{}	\N	{}	[]	2024-10-19 19:44:09.491	2024-10-19 19:44:09.491	\N	\N
55	plugin::upload.assets.create	{}	\N	{}	[]	2024-10-19 19:44:09.506	2024-10-19 19:44:09.506	\N	\N
56	plugin::upload.assets.update	{}	\N	{}	[]	2024-10-19 19:44:09.524	2024-10-19 19:44:09.524	\N	\N
57	plugin::upload.assets.download	{}	\N	{}	[]	2024-10-19 19:44:09.54	2024-10-19 19:44:09.54	\N	\N
58	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-10-19 19:44:09.559	2024-10-19 19:44:09.559	\N	\N
60	plugin::content-manager.explorer.create	{}	api::category.category	{"fields": ["name", "slug", "banner", "products"]}	["admin::is-creator"]	2024-10-19 19:44:09.608	2024-10-19 19:44:09.608	\N	\N
61	plugin::content-manager.explorer.create	{}	api::message.message	{"fields": ["image", "sender", "content", "room"]}	["admin::is-creator"]	2024-10-19 19:44:09.628	2024-10-19 19:44:09.628	\N	\N
62	plugin::content-manager.explorer.create	{}	api::order.order	{"fields": ["customer_email", "customer_full_name", "customer_phone", "shipping_address", "shipping_method", "payment_method", "total", "status", "user", "voucher", "transport_fee", "order_code"]}	["admin::is-creator"]	2024-10-19 19:44:09.645	2024-10-19 19:44:09.645	\N	\N
63	plugin::content-manager.explorer.create	{}	api::order-detail.order-detail	{"fields": ["product", "order", "unit_price", "quantity"]}	["admin::is-creator"]	2024-10-19 19:44:09.663	2024-10-19 19:44:09.663	\N	\N
65	plugin::content-manager.explorer.create	{}	api::product-line.product-line	{"fields": ["name", "slug", "products"]}	["admin::is-creator"]	2024-10-19 19:44:09.697	2024-10-19 19:44:09.697	\N	\N
66	plugin::content-manager.explorer.create	{}	api::room.room	{"fields": ["room_id", "user", "seen_status"]}	["admin::is-creator"]	2024-10-19 19:44:09.714	2024-10-19 19:44:09.714	\N	\N
67	plugin::content-manager.explorer.create	{}	api::skin-property.skin-property	{"fields": ["name", "slug", "products"]}	["admin::is-creator"]	2024-10-19 19:44:09.731	2024-10-19 19:44:09.731	\N	\N
68	plugin::content-manager.explorer.create	{}	api::user-voucher.user-voucher	{"fields": ["user", "voucher", "status"]}	["admin::is-creator"]	2024-10-19 19:44:09.749	2024-10-19 19:44:09.749	\N	\N
69	plugin::content-manager.explorer.create	{}	api::voucher.voucher	{"fields": ["code", "amount_decrease", "image", "title"]}	["admin::is-creator"]	2024-10-19 19:44:09.772	2024-10-19 19:44:09.772	\N	\N
71	plugin::content-manager.explorer.read	{}	api::category.category	{"fields": ["name", "slug", "banner", "products"]}	["admin::is-creator"]	2024-10-19 19:44:09.813	2024-10-19 19:44:09.813	\N	\N
72	plugin::content-manager.explorer.read	{}	api::message.message	{"fields": ["image", "sender", "content", "room"]}	["admin::is-creator"]	2024-10-19 19:44:09.833	2024-10-19 19:44:09.833	\N	\N
73	plugin::content-manager.explorer.read	{}	api::order.order	{"fields": ["customer_email", "customer_full_name", "customer_phone", "shipping_address", "shipping_method", "payment_method", "total", "status", "user", "voucher", "transport_fee", "order_code"]}	["admin::is-creator"]	2024-10-19 19:44:09.855	2024-10-19 19:44:09.855	\N	\N
74	plugin::content-manager.explorer.read	{}	api::order-detail.order-detail	{"fields": ["product", "order", "unit_price", "quantity"]}	["admin::is-creator"]	2024-10-19 19:44:09.875	2024-10-19 19:44:09.875	\N	\N
76	plugin::content-manager.explorer.read	{}	api::product-line.product-line	{"fields": ["name", "slug", "products"]}	["admin::is-creator"]	2024-10-19 19:44:09.917	2024-10-19 19:44:09.917	\N	\N
77	plugin::content-manager.explorer.read	{}	api::room.room	{"fields": ["room_id", "user", "seen_status"]}	["admin::is-creator"]	2024-10-19 19:44:09.937	2024-10-19 19:44:09.937	\N	\N
78	plugin::content-manager.explorer.read	{}	api::skin-property.skin-property	{"fields": ["name", "slug", "products"]}	["admin::is-creator"]	2024-10-19 19:44:09.956	2024-10-19 19:44:09.956	\N	\N
79	plugin::content-manager.explorer.read	{}	api::user-voucher.user-voucher	{"fields": ["user", "voucher", "status"]}	["admin::is-creator"]	2024-10-19 19:44:09.974	2024-10-19 19:44:09.974	\N	\N
80	plugin::content-manager.explorer.read	{}	api::voucher.voucher	{"fields": ["code", "amount_decrease", "image", "title"]}	["admin::is-creator"]	2024-10-19 19:44:09.993	2024-10-19 19:44:09.993	\N	\N
59	plugin::content-manager.explorer.create	{}	api::booking.booking	{"fields": ["user", "customer_email", "customer_full_name", "customer_phone", "date", "status"]}	["admin::is-creator"]	2024-10-19 19:44:09.589	2024-10-20 10:35:41.48	\N	\N
64	plugin::content-manager.explorer.create	{}	api::product.product	{"fields": ["name", "slug", "categories", "gallery", "avatar", "price", "sale_price", "total_purchase", "product_line", "skin_properties"]}	["admin::is-creator"]	2024-10-19 19:44:09.68	2024-10-25 09:46:08.226	\N	\N
82	plugin::content-manager.explorer.update	{}	api::category.category	{"fields": ["name", "slug", "banner", "products"]}	["admin::is-creator"]	2024-10-19 19:44:10.031	2024-10-19 19:44:10.031	\N	\N
83	plugin::content-manager.explorer.update	{}	api::message.message	{"fields": ["image", "sender", "content", "room"]}	["admin::is-creator"]	2024-10-19 19:44:10.049	2024-10-19 19:44:10.049	\N	\N
84	plugin::content-manager.explorer.update	{}	api::order.order	{"fields": ["customer_email", "customer_full_name", "customer_phone", "shipping_address", "shipping_method", "payment_method", "total", "status", "user", "voucher", "transport_fee", "order_code"]}	["admin::is-creator"]	2024-10-19 19:44:10.068	2024-10-19 19:44:10.068	\N	\N
85	plugin::content-manager.explorer.update	{}	api::order-detail.order-detail	{"fields": ["product", "order", "unit_price", "quantity"]}	["admin::is-creator"]	2024-10-19 19:44:10.087	2024-10-19 19:44:10.087	\N	\N
87	plugin::content-manager.explorer.update	{}	api::product-line.product-line	{"fields": ["name", "slug", "products"]}	["admin::is-creator"]	2024-10-19 19:44:10.128	2024-10-19 19:44:10.128	\N	\N
88	plugin::content-manager.explorer.update	{}	api::room.room	{"fields": ["room_id", "user", "seen_status"]}	["admin::is-creator"]	2024-10-19 19:44:10.149	2024-10-19 19:44:10.149	\N	\N
89	plugin::content-manager.explorer.update	{}	api::skin-property.skin-property	{"fields": ["name", "slug", "products"]}	["admin::is-creator"]	2024-10-19 19:44:10.166	2024-10-19 19:44:10.166	\N	\N
90	plugin::content-manager.explorer.update	{}	api::user-voucher.user-voucher	{"fields": ["user", "voucher", "status"]}	["admin::is-creator"]	2024-10-19 19:44:10.186	2024-10-19 19:44:10.186	\N	\N
91	plugin::content-manager.explorer.update	{}	api::voucher.voucher	{"fields": ["code", "amount_decrease", "image", "title"]}	["admin::is-creator"]	2024-10-19 19:44:10.204	2024-10-19 19:44:10.204	\N	\N
92	plugin::content-manager.explorer.delete	{}	api::booking.booking	{}	["admin::is-creator"]	2024-10-19 19:44:10.223	2024-10-19 19:44:10.223	\N	\N
93	plugin::content-manager.explorer.delete	{}	api::category.category	{}	["admin::is-creator"]	2024-10-19 19:44:10.242	2024-10-19 19:44:10.242	\N	\N
94	plugin::content-manager.explorer.delete	{}	api::message.message	{}	["admin::is-creator"]	2024-10-19 19:44:10.263	2024-10-19 19:44:10.263	\N	\N
95	plugin::content-manager.explorer.delete	{}	api::order.order	{}	["admin::is-creator"]	2024-10-19 19:44:10.282	2024-10-19 19:44:10.282	\N	\N
96	plugin::content-manager.explorer.delete	{}	api::order-detail.order-detail	{}	["admin::is-creator"]	2024-10-19 19:44:10.302	2024-10-19 19:44:10.302	\N	\N
97	plugin::content-manager.explorer.delete	{}	api::product.product	{}	["admin::is-creator"]	2024-10-19 19:44:10.321	2024-10-19 19:44:10.321	\N	\N
98	plugin::content-manager.explorer.delete	{}	api::product-line.product-line	{}	["admin::is-creator"]	2024-10-19 19:44:10.34	2024-10-19 19:44:10.34	\N	\N
99	plugin::content-manager.explorer.delete	{}	api::room.room	{}	["admin::is-creator"]	2024-10-19 19:44:10.359	2024-10-19 19:44:10.359	\N	\N
100	plugin::content-manager.explorer.delete	{}	api::skin-property.skin-property	{}	["admin::is-creator"]	2024-10-19 19:44:10.381	2024-10-19 19:44:10.381	\N	\N
101	plugin::content-manager.explorer.delete	{}	api::user-voucher.user-voucher	{}	["admin::is-creator"]	2024-10-19 19:44:10.401	2024-10-19 19:44:10.401	\N	\N
102	plugin::content-manager.explorer.delete	{}	api::voucher.voucher	{}	["admin::is-creator"]	2024-10-19 19:44:10.42	2024-10-19 19:44:10.42	\N	\N
103	plugin::upload.read	{}	\N	{}	["admin::is-creator"]	2024-10-19 19:44:10.44	2024-10-19 19:44:10.44	\N	\N
104	plugin::upload.configure-view	{}	\N	{}	[]	2024-10-19 19:44:10.462	2024-10-19 19:44:10.462	\N	\N
105	plugin::upload.assets.create	{}	\N	{}	[]	2024-10-19 19:44:10.481	2024-10-19 19:44:10.481	\N	\N
106	plugin::upload.assets.update	{}	\N	{}	["admin::is-creator"]	2024-10-19 19:44:10.503	2024-10-19 19:44:10.503	\N	\N
107	plugin::upload.assets.download	{}	\N	{}	[]	2024-10-19 19:44:10.522	2024-10-19 19:44:10.522	\N	\N
108	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-10-19 19:44:10.541	2024-10-19 19:44:10.541	\N	\N
111	plugin::content-manager.explorer.create	{}	api::category.category	{"fields": ["name", "slug", "banner", "products"]}	[]	2024-10-19 19:44:10.668	2024-10-19 19:44:10.668	\N	\N
112	plugin::content-manager.explorer.create	{}	api::message.message	{"fields": ["image", "sender", "content", "room"]}	[]	2024-10-19 19:44:10.687	2024-10-19 19:44:10.687	\N	\N
114	plugin::content-manager.explorer.create	{}	api::order-detail.order-detail	{"fields": ["product", "order", "unit_price", "quantity"]}	[]	2024-10-19 19:44:10.726	2024-10-19 19:44:10.726	\N	\N
116	plugin::content-manager.explorer.create	{}	api::product-line.product-line	{"fields": ["name", "slug", "products"]}	[]	2024-10-19 19:44:10.767	2024-10-19 19:44:10.767	\N	\N
117	plugin::content-manager.explorer.create	{}	api::room.room	{"fields": ["room_id", "user", "seen_status"]}	[]	2024-10-19 19:44:10.788	2024-10-19 19:44:10.788	\N	\N
118	plugin::content-manager.explorer.create	{}	api::skin-property.skin-property	{"fields": ["name", "slug", "products"]}	[]	2024-10-19 19:44:10.809	2024-10-19 19:44:10.809	\N	\N
119	plugin::content-manager.explorer.create	{}	api::user-voucher.user-voucher	{"fields": ["user", "voucher", "status"]}	[]	2024-10-19 19:44:10.829	2024-10-19 19:44:10.829	\N	\N
81	plugin::content-manager.explorer.update	{}	api::booking.booking	{"fields": ["user", "customer_email", "customer_full_name", "customer_phone", "date", "status"]}	["admin::is-creator"]	2024-10-19 19:44:10.013	2024-10-20 10:35:41.48	\N	\N
86	plugin::content-manager.explorer.update	{}	api::product.product	{"fields": ["name", "slug", "categories", "gallery", "avatar", "price", "sale_price", "total_purchase", "product_line", "skin_properties"]}	["admin::is-creator"]	2024-10-19 19:44:10.108	2024-10-25 09:46:08.226	\N	\N
123	plugin::content-manager.explorer.read	{}	api::category.category	{"fields": ["name", "slug", "banner", "products"]}	[]	2024-10-19 19:44:10.908	2024-10-19 19:44:10.908	\N	\N
124	plugin::content-manager.explorer.read	{}	api::message.message	{"fields": ["image", "sender", "content", "room"]}	[]	2024-10-19 19:44:10.93	2024-10-19 19:44:10.93	\N	\N
126	plugin::content-manager.explorer.read	{}	api::order-detail.order-detail	{"fields": ["product", "order", "unit_price", "quantity"]}	[]	2024-10-19 19:44:10.97	2024-10-19 19:44:10.97	\N	\N
128	plugin::content-manager.explorer.read	{}	api::product-line.product-line	{"fields": ["name", "slug", "products"]}	[]	2024-10-19 19:44:11.012	2024-10-19 19:44:11.012	\N	\N
129	plugin::content-manager.explorer.read	{}	api::room.room	{"fields": ["room_id", "user", "seen_status"]}	[]	2024-10-19 19:44:11.032	2024-10-19 19:44:11.032	\N	\N
130	plugin::content-manager.explorer.read	{}	api::skin-property.skin-property	{"fields": ["name", "slug", "products"]}	[]	2024-10-19 19:44:11.051	2024-10-19 19:44:11.051	\N	\N
131	plugin::content-manager.explorer.read	{}	api::user-voucher.user-voucher	{"fields": ["user", "voucher", "status"]}	[]	2024-10-19 19:44:11.071	2024-10-19 19:44:11.071	\N	\N
135	plugin::content-manager.explorer.update	{}	api::category.category	{"fields": ["name", "slug", "banner", "products"]}	[]	2024-10-19 19:44:11.158	2024-10-19 19:44:11.158	\N	\N
136	plugin::content-manager.explorer.update	{}	api::message.message	{"fields": ["image", "sender", "content", "room"]}	[]	2024-10-19 19:44:11.177	2024-10-19 19:44:11.177	\N	\N
138	plugin::content-manager.explorer.update	{}	api::order-detail.order-detail	{"fields": ["product", "order", "unit_price", "quantity"]}	[]	2024-10-19 19:44:11.22	2024-10-19 19:44:11.22	\N	\N
140	plugin::content-manager.explorer.update	{}	api::product-line.product-line	{"fields": ["name", "slug", "products"]}	[]	2024-10-19 19:44:11.262	2024-10-19 19:44:11.262	\N	\N
141	plugin::content-manager.explorer.update	{}	api::room.room	{"fields": ["room_id", "user", "seen_status"]}	[]	2024-10-19 19:44:11.283	2024-10-19 19:44:11.283	\N	\N
142	plugin::content-manager.explorer.update	{}	api::skin-property.skin-property	{"fields": ["name", "slug", "products"]}	[]	2024-10-19 19:44:11.306	2024-10-19 19:44:11.306	\N	\N
143	plugin::content-manager.explorer.update	{}	api::user-voucher.user-voucher	{"fields": ["user", "voucher", "status"]}	[]	2024-10-19 19:44:11.328	2024-10-19 19:44:11.328	\N	\N
145	plugin::content-manager.explorer.delete	{}	plugin::users-permissions.user	{}	[]	2024-10-19 19:44:11.371	2024-10-19 19:44:11.371	\N	\N
146	plugin::content-manager.explorer.delete	{}	api::booking.booking	{}	[]	2024-10-19 19:44:11.391	2024-10-19 19:44:11.391	\N	\N
147	plugin::content-manager.explorer.delete	{}	api::category.category	{}	[]	2024-10-19 19:44:11.412	2024-10-19 19:44:11.412	\N	\N
148	plugin::content-manager.explorer.delete	{}	api::message.message	{}	[]	2024-10-19 19:44:11.452	2024-10-19 19:44:11.452	\N	\N
149	plugin::content-manager.explorer.delete	{}	api::order.order	{}	[]	2024-10-19 19:44:11.587	2024-10-19 19:44:11.587	\N	\N
150	plugin::content-manager.explorer.delete	{}	api::order-detail.order-detail	{}	[]	2024-10-19 19:44:11.637	2024-10-19 19:44:11.637	\N	\N
151	plugin::content-manager.explorer.delete	{}	api::product.product	{}	[]	2024-10-19 19:44:11.659	2024-10-19 19:44:11.659	\N	\N
152	plugin::content-manager.explorer.delete	{}	api::product-line.product-line	{}	[]	2024-10-19 19:44:11.681	2024-10-19 19:44:11.681	\N	\N
153	plugin::content-manager.explorer.delete	{}	api::room.room	{}	[]	2024-10-19 19:44:11.704	2024-10-19 19:44:11.704	\N	\N
154	plugin::content-manager.explorer.delete	{}	api::skin-property.skin-property	{}	[]	2024-10-19 19:44:11.725	2024-10-19 19:44:11.725	\N	\N
155	plugin::content-manager.explorer.delete	{}	api::user-voucher.user-voucher	{}	[]	2024-10-19 19:44:11.747	2024-10-19 19:44:11.747	\N	\N
156	plugin::content-manager.explorer.delete	{}	api::voucher.voucher	{}	[]	2024-10-19 19:44:11.772	2024-10-19 19:44:11.772	\N	\N
157	plugin::content-manager.explorer.publish	{}	api::booking.booking	{}	[]	2024-10-19 19:44:11.798	2024-10-19 19:44:11.798	\N	\N
158	plugin::content-manager.explorer.publish	{}	api::message.message	{}	[]	2024-10-19 19:44:11.823	2024-10-19 19:44:11.823	\N	\N
161	plugin::content-manager.explorer.publish	{}	api::room.room	{}	[]	2024-10-19 19:44:11.897	2024-10-19 19:44:11.897	\N	\N
162	plugin::content-manager.explorer.publish	{}	api::skin-property.skin-property	{}	[]	2024-10-19 19:44:11.92	2024-10-19 19:44:11.92	\N	\N
165	plugin::content-manager.single-types.configure-view	{}	\N	{}	[]	2024-10-19 19:44:11.99	2024-10-19 19:44:11.99	\N	\N
166	plugin::content-manager.collection-types.configure-view	{}	\N	{}	[]	2024-10-19 19:44:12.02	2024-10-19 19:44:12.02	\N	\N
167	plugin::content-manager.components.configure-layout	{}	\N	{}	[]	2024-10-19 19:44:12.067	2024-10-19 19:44:12.067	\N	\N
168	plugin::content-type-builder.read	{}	\N	{}	[]	2024-10-19 19:44:12.106	2024-10-19 19:44:12.106	\N	\N
169	plugin::email.settings.read	{}	\N	{}	[]	2024-10-19 19:44:12.14	2024-10-19 19:44:12.14	\N	\N
170	plugin::upload.read	{}	\N	{}	[]	2024-10-19 19:44:12.169	2024-10-19 19:44:12.169	\N	\N
171	plugin::upload.assets.create	{}	\N	{}	[]	2024-10-19 19:44:12.197	2024-10-19 19:44:12.197	\N	\N
172	plugin::upload.assets.update	{}	\N	{}	[]	2024-10-19 19:44:12.23	2024-10-19 19:44:12.23	\N	\N
173	plugin::upload.assets.download	{}	\N	{}	[]	2024-10-19 19:44:12.258	2024-10-19 19:44:12.258	\N	\N
174	plugin::upload.assets.copy-link	{}	\N	{}	[]	2024-10-19 19:44:12.29	2024-10-19 19:44:12.29	\N	\N
175	plugin::upload.configure-view	{}	\N	{}	[]	2024-10-19 19:44:12.326	2024-10-19 19:44:12.326	\N	\N
176	plugin::upload.settings.read	{}	\N	{}	[]	2024-10-19 19:44:12.361	2024-10-19 19:44:12.361	\N	\N
177	plugin::meilisearch.read	{}	\N	{}	[]	2024-10-19 19:44:12.394	2024-10-19 19:44:12.394	\N	\N
178	plugin::meilisearch.collections.create	{}	\N	{}	[]	2024-10-19 19:44:12.419	2024-10-19 19:44:12.419	\N	\N
179	plugin::meilisearch.collections.update	{}	\N	{}	[]	2024-10-19 19:44:12.444	2024-10-19 19:44:12.444	\N	\N
180	plugin::meilisearch.collections.delete	{}	\N	{}	[]	2024-10-19 19:44:12.469	2024-10-19 19:44:12.469	\N	\N
181	plugin::meilisearch.settings.edit	{}	\N	{}	[]	2024-10-19 19:44:12.493	2024-10-19 19:44:12.493	\N	\N
182	plugin::documentation.read	{}	\N	{}	[]	2024-10-19 19:44:12.517	2024-10-19 19:44:12.517	\N	\N
183	plugin::documentation.settings.update	{}	\N	{}	[]	2024-10-19 19:44:12.54	2024-10-19 19:44:12.54	\N	\N
184	plugin::documentation.settings.regenerate	{}	\N	{}	[]	2024-10-19 19:44:12.562	2024-10-19 19:44:12.562	\N	\N
185	plugin::documentation.settings.read	{}	\N	{}	[]	2024-10-19 19:44:12.585	2024-10-19 19:44:12.585	\N	\N
186	plugin::i18n.locale.create	{}	\N	{}	[]	2024-10-19 19:44:12.608	2024-10-19 19:44:12.608	\N	\N
187	plugin::i18n.locale.read	{}	\N	{}	[]	2024-10-19 19:44:12.631	2024-10-19 19:44:12.631	\N	\N
188	plugin::i18n.locale.update	{}	\N	{}	[]	2024-10-19 19:44:12.651	2024-10-19 19:44:12.651	\N	\N
189	plugin::i18n.locale.delete	{}	\N	{}	[]	2024-10-19 19:44:12.672	2024-10-19 19:44:12.672	\N	\N
190	plugin::users-permissions.roles.create	{}	\N	{}	[]	2024-10-19 19:44:12.694	2024-10-19 19:44:12.694	\N	\N
191	plugin::users-permissions.roles.read	{}	\N	{}	[]	2024-10-19 19:44:12.713	2024-10-19 19:44:12.713	\N	\N
192	plugin::users-permissions.roles.update	{}	\N	{}	[]	2024-10-19 19:44:12.742	2024-10-19 19:44:12.742	\N	\N
193	plugin::users-permissions.roles.delete	{}	\N	{}	[]	2024-10-19 19:44:12.769	2024-10-19 19:44:12.769	\N	\N
194	plugin::users-permissions.providers.read	{}	\N	{}	[]	2024-10-19 19:44:12.792	2024-10-19 19:44:12.792	\N	\N
195	plugin::users-permissions.providers.update	{}	\N	{}	[]	2024-10-19 19:44:12.817	2024-10-19 19:44:12.817	\N	\N
196	plugin::users-permissions.email-templates.read	{}	\N	{}	[]	2024-10-19 19:44:12.84	2024-10-19 19:44:12.84	\N	\N
197	plugin::users-permissions.email-templates.update	{}	\N	{}	[]	2024-10-19 19:44:12.865	2024-10-19 19:44:12.865	\N	\N
198	plugin::users-permissions.advanced-settings.read	{}	\N	{}	[]	2024-10-19 19:44:12.891	2024-10-19 19:44:12.891	\N	\N
199	plugin::users-permissions.advanced-settings.update	{}	\N	{}	[]	2024-10-19 19:44:12.918	2024-10-19 19:44:12.918	\N	\N
200	admin::marketplace.read	{}	\N	{}	[]	2024-10-19 19:44:12.945	2024-10-19 19:44:12.945	\N	\N
201	admin::webhooks.create	{}	\N	{}	[]	2024-10-19 19:44:12.973	2024-10-19 19:44:12.973	\N	\N
202	admin::webhooks.read	{}	\N	{}	[]	2024-10-19 19:44:13.001	2024-10-19 19:44:13.001	\N	\N
203	admin::webhooks.update	{}	\N	{}	[]	2024-10-19 19:44:13.031	2024-10-19 19:44:13.031	\N	\N
204	admin::webhooks.delete	{}	\N	{}	[]	2024-10-19 19:44:13.071	2024-10-19 19:44:13.071	\N	\N
205	admin::users.create	{}	\N	{}	[]	2024-10-19 19:44:13.121	2024-10-19 19:44:13.121	\N	\N
206	admin::users.read	{}	\N	{}	[]	2024-10-19 19:44:13.162	2024-10-19 19:44:13.162	\N	\N
207	admin::users.update	{}	\N	{}	[]	2024-10-19 19:44:13.198	2024-10-19 19:44:13.198	\N	\N
208	admin::users.delete	{}	\N	{}	[]	2024-10-19 19:44:13.233	2024-10-19 19:44:13.233	\N	\N
209	admin::roles.create	{}	\N	{}	[]	2024-10-19 19:44:13.267	2024-10-19 19:44:13.267	\N	\N
210	admin::roles.read	{}	\N	{}	[]	2024-10-19 19:44:13.305	2024-10-19 19:44:13.305	\N	\N
211	admin::roles.update	{}	\N	{}	[]	2024-10-19 19:44:13.351	2024-10-19 19:44:13.351	\N	\N
212	admin::roles.delete	{}	\N	{}	[]	2024-10-19 19:44:13.396	2024-10-19 19:44:13.396	\N	\N
213	admin::api-tokens.access	{}	\N	{}	[]	2024-10-19 19:44:13.437	2024-10-19 19:44:13.437	\N	\N
214	admin::api-tokens.create	{}	\N	{}	[]	2024-10-19 19:44:13.471	2024-10-19 19:44:13.471	\N	\N
215	admin::api-tokens.read	{}	\N	{}	[]	2024-10-19 19:44:13.509	2024-10-19 19:44:13.509	\N	\N
216	admin::api-tokens.update	{}	\N	{}	[]	2024-10-19 19:44:13.554	2024-10-19 19:44:13.554	\N	\N
217	admin::api-tokens.regenerate	{}	\N	{}	[]	2024-10-19 19:44:13.594	2024-10-19 19:44:13.594	\N	\N
218	admin::api-tokens.delete	{}	\N	{}	[]	2024-10-19 19:44:13.629	2024-10-19 19:44:13.629	\N	\N
219	admin::project-settings.update	{}	\N	{}	[]	2024-10-19 19:44:13.667	2024-10-19 19:44:13.667	\N	\N
220	admin::project-settings.read	{}	\N	{}	[]	2024-10-19 19:44:13.7	2024-10-19 19:44:13.7	\N	\N
221	admin::transfer.tokens.access	{}	\N	{}	[]	2024-10-19 19:44:13.734	2024-10-19 19:44:13.734	\N	\N
222	admin::transfer.tokens.create	{}	\N	{}	[]	2024-10-19 19:44:13.773	2024-10-19 19:44:13.773	\N	\N
223	admin::transfer.tokens.read	{}	\N	{}	[]	2024-10-19 19:44:13.803	2024-10-19 19:44:13.803	\N	\N
224	admin::transfer.tokens.update	{}	\N	{}	[]	2024-10-19 19:44:13.832	2024-10-19 19:44:13.832	\N	\N
225	admin::transfer.tokens.regenerate	{}	\N	{}	[]	2024-10-19 19:44:13.86	2024-10-19 19:44:13.86	\N	\N
226	admin::transfer.tokens.delete	{}	\N	{}	[]	2024-10-19 19:44:13.887	2024-10-19 19:44:13.887	\N	\N
227	plugin::content-manager.explorer.create	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "address", "full_name", "phone", "gender", "type", "birthday"]}	[]	2024-10-20 10:35:41.027	2024-10-20 10:35:41.027	\N	\N
228	plugin::content-manager.explorer.create	{}	api::booking.booking	{"fields": ["user", "customer_email", "customer_full_name", "customer_phone", "date", "status", "service"]}	[]	2024-10-20 10:35:41.058	2024-10-20 10:35:41.058	\N	\N
230	plugin::content-manager.explorer.create	{}	api::service.service	{"fields": ["title", "banner", "short_description", "price", "slug"]}	[]	2024-10-20 10:35:41.102	2024-10-20 10:35:41.102	\N	\N
231	plugin::content-manager.explorer.read	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "address", "full_name", "phone", "gender", "type", "birthday"]}	[]	2024-10-20 10:35:41.124	2024-10-20 10:35:41.124	\N	\N
232	plugin::content-manager.explorer.read	{}	api::booking.booking	{"fields": ["user", "customer_email", "customer_full_name", "customer_phone", "date", "status", "service"]}	[]	2024-10-20 10:35:41.148	2024-10-20 10:35:41.148	\N	\N
234	plugin::content-manager.explorer.read	{}	api::service.service	{"fields": ["title", "banner", "short_description", "price", "slug"]}	[]	2024-10-20 10:35:41.199	2024-10-20 10:35:41.199	\N	\N
235	plugin::content-manager.explorer.update	{}	plugin::users-permissions.user	{"fields": ["username", "email", "provider", "password", "resetPasswordToken", "confirmationToken", "confirmed", "blocked", "role", "address", "full_name", "phone", "gender", "type", "birthday"]}	[]	2024-10-20 10:35:41.226	2024-10-20 10:35:41.226	\N	\N
236	plugin::content-manager.explorer.update	{}	api::booking.booking	{"fields": ["user", "customer_email", "customer_full_name", "customer_phone", "date", "status", "service"]}	[]	2024-10-20 10:35:41.25	2024-10-20 10:35:41.25	\N	\N
238	plugin::content-manager.explorer.update	{}	api::service.service	{"fields": ["title", "banner", "short_description", "price", "slug"]}	[]	2024-10-20 10:35:41.298	2024-10-20 10:35:41.298	\N	\N
239	plugin::content-manager.explorer.delete	{}	api::service.service	{}	[]	2024-10-20 10:35:41.318	2024-10-20 10:35:41.318	\N	\N
1	plugin::content-manager.explorer.create	{}	api::booking.booking	{"fields": ["user", "customer_email", "customer_full_name", "customer_phone", "date", "status"]}	[]	2024-10-19 19:44:08.487	2024-10-20 10:35:41.479	\N	\N
23	plugin::content-manager.explorer.update	{}	api::booking.booking	{"fields": ["user", "customer_email", "customer_full_name", "customer_phone", "date", "status"]}	[]	2024-10-19 19:44:08.929	2024-10-20 10:35:41.48	\N	\N
70	plugin::content-manager.explorer.read	{}	api::booking.booking	{"fields": ["user", "customer_email", "customer_full_name", "customer_phone", "date", "status"]}	["admin::is-creator"]	2024-10-19 19:44:09.793	2024-10-20 10:35:41.48	\N	\N
240	plugin::content-manager.explorer.create	{}	api::product.product	{"fields": ["name", "slug", "categories", "gallery", "avatar", "price", "sale_price", "total_purchase", "product_line", "skin_properties", "description", "quan", "quantity"]}	[]	2024-10-25 09:46:08.019	2024-10-25 09:46:08.019	\N	\N
241	plugin::content-manager.explorer.read	{}	api::product.product	{"fields": ["name", "slug", "categories", "gallery", "avatar", "price", "sale_price", "total_purchase", "product_line", "skin_properties", "description", "quan", "quantity"]}	[]	2024-10-25 09:46:08.05	2024-10-25 09:46:08.05	\N	\N
242	plugin::content-manager.explorer.update	{}	api::product.product	{"fields": ["name", "slug", "categories", "gallery", "avatar", "price", "sale_price", "total_purchase", "product_line", "skin_properties", "description", "quan", "quantity"]}	[]	2024-10-25 09:46:08.08	2024-10-25 09:46:08.08	\N	\N
75	plugin::content-manager.explorer.read	{}	api::product.product	{"fields": ["name", "slug", "categories", "gallery", "avatar", "price", "sale_price", "total_purchase", "product_line", "skin_properties"]}	["admin::is-creator"]	2024-10-19 19:44:09.895	2024-10-25 09:46:08.226	\N	\N
243	plugin::content-manager.explorer.create	{}	api::order.order	{"fields": ["customer_email", "customer_full_name", "customer_phone", "shipping_address", "shipping_method", "payment_method", "total", "status", "user", "voucher", "transport_fee", "order_code", "reason", "order_details"]}	[]	2024-10-25 15:33:38.161	2024-10-25 15:33:38.161	\N	\N
244	plugin::content-manager.explorer.read	{}	api::order.order	{"fields": ["customer_email", "customer_full_name", "customer_phone", "shipping_address", "shipping_method", "payment_method", "total", "status", "user", "voucher", "transport_fee", "order_code", "reason", "order_details"]}	[]	2024-10-25 15:33:38.182	2024-10-25 15:33:38.182	\N	\N
245	plugin::content-manager.explorer.update	{}	api::order.order	{"fields": ["customer_email", "customer_full_name", "customer_phone", "shipping_address", "shipping_method", "payment_method", "total", "status", "user", "voucher", "transport_fee", "order_code", "reason", "order_details"]}	[]	2024-10-25 15:33:38.196	2024-10-25 15:33:38.196	\N	\N
258	plugin::content-manager.explorer.create	{}	api::voucher.voucher	{"fields": ["code", "amount_decrease", "image", "title", "public"]}	[]	2024-10-30 11:14:46.53	2024-10-30 11:14:46.53	\N	\N
259	plugin::content-manager.explorer.read	{}	api::voucher.voucher	{"fields": ["code", "amount_decrease", "image", "title", "public"]}	[]	2024-10-30 11:14:46.555	2024-10-30 11:14:46.555	\N	\N
260	plugin::content-manager.explorer.update	{}	api::voucher.voucher	{"fields": ["code", "amount_decrease", "image", "title", "public"]}	[]	2024-10-30 11:14:46.573	2024-10-30 11:14:46.573	\N	\N
\.


--
-- Data for Name: admin_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.admin_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
1	1	2	1
2	2	2	2
3	3	2	3
4	4	2	4
5	5	2	5
6	6	2	6
7	7	2	7
8	8	2	8
9	9	2	9
10	10	2	10
11	11	2	11
12	12	2	12
13	13	2	13
14	14	2	14
15	15	2	15
16	16	2	16
17	17	2	17
18	18	2	18
19	19	2	19
20	20	2	20
21	21	2	21
22	22	2	22
23	23	2	23
24	24	2	24
25	25	2	25
26	26	2	26
27	27	2	27
28	28	2	28
29	29	2	29
30	30	2	30
31	31	2	31
32	32	2	32
33	33	2	33
34	34	2	34
35	35	2	35
36	36	2	36
37	37	2	37
38	38	2	38
39	39	2	39
40	40	2	40
41	41	2	41
42	42	2	42
43	43	2	43
44	44	2	44
45	45	2	45
46	46	2	46
49	49	2	49
50	50	2	50
53	53	2	53
54	54	2	54
55	55	2	55
56	56	2	56
57	57	2	57
58	58	2	58
59	59	3	1
60	60	3	2
61	61	3	3
62	62	3	4
63	63	3	5
64	64	3	6
65	65	3	7
66	66	3	8
67	67	3	9
68	68	3	10
69	69	3	11
70	70	3	12
71	71	3	13
72	72	3	14
73	73	3	15
74	74	3	16
75	75	3	17
76	76	3	18
77	77	3	19
78	78	3	20
79	79	3	21
80	80	3	22
81	81	3	23
82	82	3	24
83	83	3	25
84	84	3	26
85	85	3	27
86	86	3	28
87	87	3	29
88	88	3	30
89	89	3	31
90	90	3	32
91	91	3	33
92	92	3	34
93	93	3	35
94	94	3	36
95	95	3	37
96	96	3	38
97	97	3	39
98	98	3	40
99	99	3	41
100	100	3	42
101	101	3	43
102	102	3	44
103	103	3	45
104	104	3	46
105	105	3	47
106	106	3	48
107	107	3	49
108	108	3	50
111	111	1	3
112	112	1	4
114	114	1	6
116	116	1	8
117	117	1	9
118	118	1	10
119	119	1	11
123	123	1	15
124	124	1	16
126	126	1	18
128	128	1	20
129	129	1	21
130	130	1	22
131	131	1	23
135	135	1	27
136	136	1	28
138	138	1	30
140	140	1	32
141	141	1	33
142	142	1	34
143	143	1	35
145	145	1	37
146	146	1	38
147	147	1	39
148	148	1	40
149	149	1	41
150	150	1	42
151	151	1	43
152	152	1	44
153	153	1	45
154	154	1	46
155	155	1	47
156	156	1	48
157	157	1	49
158	158	1	50
161	161	1	53
162	162	1	54
165	165	1	57
166	166	1	58
167	167	1	59
168	168	1	60
169	169	1	61
170	170	1	62
171	171	1	63
172	172	1	64
173	173	1	65
174	174	1	66
175	175	1	67
176	176	1	68
177	177	1	69
178	178	1	70
179	179	1	71
180	180	1	72
181	181	1	73
182	182	1	74
183	183	1	75
184	184	1	76
185	185	1	77
186	186	1	78
187	187	1	79
188	188	1	80
189	189	1	81
190	190	1	82
191	191	1	83
192	192	1	84
193	193	1	85
194	194	1	86
195	195	1	87
196	196	1	88
197	197	1	89
198	198	1	90
199	199	1	91
200	200	1	92
201	201	1	93
202	202	1	94
203	203	1	95
204	204	1	96
205	205	1	97
206	206	1	98
207	207	1	99
208	208	1	100
209	209	1	101
210	210	1	102
211	211	1	103
212	212	1	104
213	213	1	105
214	214	1	106
215	215	1	107
216	216	1	108
217	217	1	109
218	218	1	110
219	219	1	111
220	220	1	112
221	221	1	113
222	222	1	114
223	223	1	115
224	224	1	116
225	225	1	117
226	226	1	118
227	227	1	119
228	228	1	120
230	230	1	122
231	231	1	123
232	232	1	124
234	234	1	126
235	235	1	127
236	236	1	128
238	238	1	130
239	239	1	131
240	240	1	132
241	241	1	133
242	242	1	134
243	243	1	135
244	244	1	136
245	245	1	137
258	258	1	138
259	259	1	139
260	260	1	140
\.


--
-- Data for Name: admin_roles; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.admin_roles (id, name, code, description, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	Super Admin	strapi-super-admin	Super Admins can access and manage all features and settings.	2024-10-19 19:44:08.399	2024-10-19 19:44:08.399	\N	\N
2	Editor	strapi-editor	Editors can manage and publish contents including those of other users.	2024-10-19 19:44:08.431	2024-10-19 19:44:08.431	\N	\N
3	Author	strapi-author	Authors can manage the content they have created.	2024-10-19 19:44:08.445	2024-10-19 19:44:08.445	\N	\N
\.


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.admin_users (id, firstname, lastname, username, email, password, reset_password_token, registration_token, is_active, blocked, prefered_language, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	trinh	hau	\N	hautv1408@gmail.com	$2a$10$v9cg9EuiOR4ifW92FLpDLucL/YodmHya/.dcoejesU1t8aoGgDEwC	\N	\N	t	f	\N	2024-10-19 19:45:44.414	2024-10-24 22:34:58.481	\N	\N
\.


--
-- Data for Name: admin_users_roles_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.admin_users_roles_links (id, user_id, role_id, role_order, user_order) FROM stdin;
1	1	1	1	1
\.


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.bookings (id, customer_email, customer_full_name, customer_phone, date, status, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
9	hautrinh@gmail.com	Trß╗ïnh V─ân Hß║¡u	0981234567	2024-12-12 00:00:00	Ho├án th├ánh	2024-10-28 17:42:45.063	2024-10-31 09:34:32.558	2024-10-28 17:42:45.056	\N	\N
\.


--
-- Data for Name: bookings_service_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.bookings_service_links (id, booking_id, service_id) FROM stdin;
11	9	10
\.


--
-- Data for Name: bookings_user_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.bookings_user_links (id, booking_id, user_id) FROM stdin;
7	9	6
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.categories (id, name, slug, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	D╞░ß╗íng ß║⌐m da tß╗▒ nhi├¬n	duong-am-da-tu-nhien	2024-10-22 15:21:53.672	2024-10-22 15:21:53.672	1	1
2	N├óng tone trß║»ng da	nang-tone-trang-da	2024-10-22 15:40:37.894	2024-10-22 15:40:37.894	1	1
3	Ng─ân ngß╗½a dß╗ï ß╗⌐ng	ngan-ngua-di-ung	2024-10-22 15:41:02.944	2024-10-22 15:41:02.944	1	1
4	Giß║úm t├¼nh trß║íng kh├┤ da	giam-tinh-trang-kho-da	2024-10-22 15:41:41.191	2024-10-22 15:41:41.191	1	1
5	Trß╗ï th├óm	tri-tham	2024-10-22 15:43:42.868	2024-10-22 15:43:42.868	1	1
6	L├án da tho├íng m├ít	lan-da-thoang-mat	2024-10-22 15:44:22.509	2024-10-22 15:44:22.509	1	1
7	─Éiß╗üu hoa sß║»c tß╗æ da	dieu-hoa-sac-to-da	2024-10-22 15:46:27.633	2024-10-22 15:46:27.633	1	1
8	Sß╗»a rß╗¡a mß║╖t	sua-rua-mat	2024-10-22 21:59:51.145	2024-10-22 21:59:51.145	1	1
9	Phß╗Ñc hß╗ôi l├án da	phuc-hoi-lan-da	2024-10-22 22:03:49.518	2024-10-22 22:03:49.518	1	1
10	Serum d╞░ß╗íng da	serum-duong-da	2024-10-22 22:05:57.678	2024-10-22 22:05:57.678	1	1
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.files (id, name, alternative_text, caption, width, height, formats, hash, ext, mime, size, url, preview_url, provider, provider_metadata, folder_path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	quickSort_2.jpg	\N	\N	800	600	{"small": {"ext": ".jpg", "url": "/uploads/small_quick_Sort_2_9b7f89f21f.jpg", "hash": "small_quick_Sort_2_9b7f89f21f", "mime": "image/jpeg", "name": "small_quickSort_2.jpg", "path": null, "size": 24.66, "width": 500, "height": 375, "sizeInBytes": 24656}, "medium": {"ext": ".jpg", "url": "/uploads/medium_quick_Sort_2_9b7f89f21f.jpg", "hash": "medium_quick_Sort_2_9b7f89f21f", "mime": "image/jpeg", "name": "medium_quickSort_2.jpg", "path": null, "size": 49.3, "width": 750, "height": 563, "sizeInBytes": 49302}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_quick_Sort_2_9b7f89f21f.jpg", "hash": "thumbnail_quick_Sort_2_9b7f89f21f", "mime": "image/jpeg", "name": "thumbnail_quickSort_2.jpg", "path": null, "size": 5.86, "width": 208, "height": 156, "sizeInBytes": 5860}}	quick_Sort_2_9b7f89f21f	.jpg	image/jpeg	54.28	/uploads/quick_Sort_2_9b7f89f21f.jpg	\N	local	\N	/	2024-10-22 15:21:50.119	2024-10-22 15:21:50.119	1	1
2	quickSort_3.png	\N	\N	1200	900	{"large": {"ext": ".png", "url": "/uploads/large_quick_Sort_3_9d92e9c490.png", "hash": "large_quick_Sort_3_9d92e9c490", "mime": "image/png", "name": "large_quickSort_3.png", "path": null, "size": 927.05, "width": 1000, "height": 750, "sizeInBytes": 927046}, "small": {"ext": ".png", "url": "/uploads/small_quick_Sort_3_9d92e9c490.png", "hash": "small_quick_Sort_3_9d92e9c490", "mime": "image/png", "name": "small_quickSort_3.png", "path": null, "size": 259.12, "width": 500, "height": 375, "sizeInBytes": 259117}, "medium": {"ext": ".png", "url": "/uploads/medium_quick_Sort_3_9d92e9c490.png", "hash": "medium_quick_Sort_3_9d92e9c490", "mime": "image/png", "name": "medium_quickSort_3.png", "path": null, "size": 543.6, "width": 750, "height": 563, "sizeInBytes": 543601}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_quick_Sort_3_9d92e9c490.png", "hash": "thumbnail_quick_Sort_3_9d92e9c490", "mime": "image/png", "name": "thumbnail_quickSort_3.png", "path": null, "size": 57.07, "width": 208, "height": 156, "sizeInBytes": 57069}}	quick_Sort_3_9d92e9c490	.png	image/png	289.83	/uploads/quick_Sort_3_9d92e9c490.png	\N	local	\N	/	2024-10-22 15:40:32.479	2024-10-22 15:40:32.479	1	1
3	quickSort_5.jpg	\N	\N	1200	1197	{"large": {"ext": ".jpg", "url": "/uploads/large_quick_Sort_5_cf752e07f6.jpg", "hash": "large_quick_Sort_5_cf752e07f6", "mime": "image/jpeg", "name": "large_quickSort_5.jpg", "path": null, "size": 87.49, "width": 1000, "height": 998, "sizeInBytes": 87494}, "small": {"ext": ".jpg", "url": "/uploads/small_quick_Sort_5_cf752e07f6.jpg", "hash": "small_quick_Sort_5_cf752e07f6", "mime": "image/jpeg", "name": "small_quickSort_5.jpg", "path": null, "size": 31.57, "width": 500, "height": 499, "sizeInBytes": 31574}, "medium": {"ext": ".jpg", "url": "/uploads/medium_quick_Sort_5_cf752e07f6.jpg", "hash": "medium_quick_Sort_5_cf752e07f6", "mime": "image/jpeg", "name": "medium_quickSort_5.jpg", "path": null, "size": 57.88, "width": 750, "height": 748, "sizeInBytes": 57883}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_quick_Sort_5_cf752e07f6.jpg", "hash": "thumbnail_quick_Sort_5_cf752e07f6", "mime": "image/jpeg", "name": "thumbnail_quickSort_5.jpg", "path": null, "size": 5.23, "width": 157, "height": 156, "sizeInBytes": 5228}}	quick_Sort_5_cf752e07f6	.jpg	image/jpeg	111.75	/uploads/quick_Sort_5_cf752e07f6.jpg	\N	local	\N	/	2024-10-22 15:40:59.075	2024-10-22 15:40:59.075	1	1
4	quickSort_4.png	\N	\N	512	505	{"small": {"ext": ".png", "url": "/uploads/small_quick_Sort_4_bd95c07bda.png", "hash": "small_quick_Sort_4_bd95c07bda", "mime": "image/png", "name": "small_quickSort_4.png", "path": null, "size": 365.14, "width": 500, "height": 493, "sizeInBytes": 365135}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_quick_Sort_4_bd95c07bda.png", "hash": "thumbnail_quick_Sort_4_bd95c07bda", "mime": "image/png", "name": "thumbnail_quickSort_4.png", "path": null, "size": 49.34, "width": 158, "height": 156, "sizeInBytes": 49339}}	quick_Sort_4_bd95c07bda	.png	image/png	98.84	/uploads/quick_Sort_4_bd95c07bda.png	\N	local	\N	/	2024-10-22 15:41:36.374	2024-10-22 15:41:36.374	1	1
5	quickSort_1.jpg	\N	\N	1200	886	{"large": {"ext": ".jpg", "url": "/uploads/large_quick_Sort_1_4f13c061a2.jpg", "hash": "large_quick_Sort_1_4f13c061a2", "mime": "image/jpeg", "name": "large_quickSort_1.jpg", "path": null, "size": 55.91, "width": 1000, "height": 738, "sizeInBytes": 55911}, "small": {"ext": ".jpg", "url": "/uploads/small_quick_Sort_1_4f13c061a2.jpg", "hash": "small_quick_Sort_1_4f13c061a2", "mime": "image/jpeg", "name": "small_quickSort_1.jpg", "path": null, "size": 18.8, "width": 500, "height": 369, "sizeInBytes": 18796}, "medium": {"ext": ".jpg", "url": "/uploads/medium_quick_Sort_1_4f13c061a2.jpg", "hash": "medium_quick_Sort_1_4f13c061a2", "mime": "image/jpeg", "name": "medium_quickSort_1.jpg", "path": null, "size": 36.03, "width": 750, "height": 554, "sizeInBytes": 36027}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_quick_Sort_1_4f13c061a2.jpg", "hash": "thumbnail_quick_Sort_1_4f13c061a2", "mime": "image/jpeg", "name": "thumbnail_quickSort_1.jpg", "path": null, "size": 5.01, "width": 212, "height": 156, "sizeInBytes": 5015}}	quick_Sort_1_4f13c061a2	.jpg	image/jpeg	70.17	/uploads/quick_Sort_1_4f13c061a2.jpg	\N	local	\N	/	2024-10-22 15:43:40.609	2024-10-22 15:43:40.609	1	1
6	treatment_1.jpg	\N	\N	1024	768	{"large": {"ext": ".jpg", "url": "/uploads/large_treatment_1_cbb092a45e.jpg", "hash": "large_treatment_1_cbb092a45e", "mime": "image/jpeg", "name": "large_treatment_1.jpg", "path": null, "size": 47.63, "width": 1000, "height": 750, "sizeInBytes": 47625}, "small": {"ext": ".jpg", "url": "/uploads/small_treatment_1_cbb092a45e.jpg", "hash": "small_treatment_1_cbb092a45e", "mime": "image/jpeg", "name": "small_treatment_1.jpg", "path": null, "size": 15.93, "width": 500, "height": 375, "sizeInBytes": 15933}, "medium": {"ext": ".jpg", "url": "/uploads/medium_treatment_1_cbb092a45e.jpg", "hash": "medium_treatment_1_cbb092a45e", "mime": "image/jpeg", "name": "medium_treatment_1.jpg", "path": null, "size": 30.58, "width": 750, "height": 563, "sizeInBytes": 30582}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_treatment_1_cbb092a45e.jpg", "hash": "thumbnail_treatment_1_cbb092a45e", "mime": "image/jpeg", "name": "thumbnail_treatment_1.jpg", "path": null, "size": 4.33, "width": 208, "height": 156, "sizeInBytes": 4329}}	treatment_1_cbb092a45e	.jpg	image/jpeg	49.34	/uploads/treatment_1_cbb092a45e.jpg	\N	local	\N	/	2024-10-22 15:44:19.305	2024-10-22 15:44:19.305	1	1
7	quickSort_5.jpg	\N	\N	1200	1197	{"large": {"ext": ".jpg", "url": "/uploads/large_quick_Sort_5_db6a1f8f3a.jpg", "hash": "large_quick_Sort_5_db6a1f8f3a", "mime": "image/jpeg", "name": "large_quickSort_5.jpg", "path": null, "size": 87.49, "width": 1000, "height": 998, "sizeInBytes": 87494}, "small": {"ext": ".jpg", "url": "/uploads/small_quick_Sort_5_db6a1f8f3a.jpg", "hash": "small_quick_Sort_5_db6a1f8f3a", "mime": "image/jpeg", "name": "small_quickSort_5.jpg", "path": null, "size": 31.57, "width": 500, "height": 499, "sizeInBytes": 31574}, "medium": {"ext": ".jpg", "url": "/uploads/medium_quick_Sort_5_db6a1f8f3a.jpg", "hash": "medium_quick_Sort_5_db6a1f8f3a", "mime": "image/jpeg", "name": "medium_quickSort_5.jpg", "path": null, "size": 57.88, "width": 750, "height": 748, "sizeInBytes": 57883}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_quick_Sort_5_db6a1f8f3a.jpg", "hash": "thumbnail_quick_Sort_5_db6a1f8f3a", "mime": "image/jpeg", "name": "thumbnail_quickSort_5.jpg", "path": null, "size": 5.23, "width": 157, "height": 156, "sizeInBytes": 5228}}	quick_Sort_5_db6a1f8f3a	.jpg	image/jpeg	111.75	/uploads/quick_Sort_5_db6a1f8f3a.jpg	\N	local	\N	/	2024-10-22 15:46:25.052	2024-10-22 15:46:25.052	1	1
8	DSC_09993_c4b3035f37.webp	\N	\N	375	375	{"thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_DSC_09993_c4b3035f37_13effa9768.webp", "hash": "thumbnail_DSC_09993_c4b3035f37_13effa9768", "mime": "image/webp", "name": "thumbnail_DSC_09993_c4b3035f37.webp", "path": null, "size": 1.85, "width": 156, "height": 156, "sizeInBytes": 1850}}	DSC_09993_c4b3035f37_13effa9768	.webp	image/webp	7.36	/uploads/DSC_09993_c4b3035f37_13effa9768.webp	\N	local	\N	/	2024-10-22 21:49:52.603	2024-10-22 21:49:52.603	1	1
9	00028945_kem_chong_muoi_cho_be_tu_6_thang_tuoi_remos_khuynh_diep_rohto_70g_7755_62ae_large_164d89a439.webp	\N	\N	636	636	{"small": {"ext": ".webp", "url": "/uploads/small_00028945_kem_chong_muoi_cho_be_tu_6_thang_tuoi_remos_khuynh_diep_rohto_70g_7755_62ae_large_164d89a439_39078e00ab.webp", "hash": "small_00028945_kem_chong_muoi_cho_be_tu_6_thang_tuoi_remos_khuynh_diep_rohto_70g_7755_62ae_large_164d89a439_39078e00ab", "mime": "image/webp", "name": "small_00028945_kem_chong_muoi_cho_be_tu_6_thang_tuoi_remos_khuynh_diep_rohto_70g_7755_62ae_large_164d89a439.webp", "path": null, "size": 11.21, "width": 500, "height": 500, "sizeInBytes": 11214}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_00028945_kem_chong_muoi_cho_be_tu_6_thang_tuoi_remos_khuynh_diep_rohto_70g_7755_62ae_large_164d89a439_39078e00ab.webp", "hash": "thumbnail_00028945_kem_chong_muoi_cho_be_tu_6_thang_tuoi_remos_khuynh_diep_rohto_70g_7755_62ae_large_164d89a439_39078e00ab", "mime": "image/webp", "name": "thumbnail_00028945_kem_chong_muoi_cho_be_tu_6_thang_tuoi_remos_khuynh_diep_rohto_70g_7755_62ae_large_164d89a439.webp", "path": null, "size": 2.12, "width": 156, "height": 156, "sizeInBytes": 2122}}	00028945_kem_chong_muoi_cho_be_tu_6_thang_tuoi_remos_khuynh_diep_rohto_70g_7755_62ae_large_164d89a439_39078e00ab	.webp	image/webp	17.69	/uploads/00028945_kem_chong_muoi_cho_be_tu_6_thang_tuoi_remos_khuynh_diep_rohto_70g_7755_62ae_large_164d89a439_39078e00ab.webp	\N	local	\N	/	2024-10-22 21:50:49.085	2024-10-22 21:50:49.085	1	1
10	DSC_09993_c4b3035f37.webp	\N	\N	375	375	{"thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_DSC_09993_c4b3035f37_ae740ae328.webp", "hash": "thumbnail_DSC_09993_c4b3035f37_ae740ae328", "mime": "image/webp", "name": "thumbnail_DSC_09993_c4b3035f37.webp", "path": null, "size": 1.85, "width": 156, "height": 156, "sizeInBytes": 1850}}	DSC_09993_c4b3035f37_ae740ae328	.webp	image/webp	7.36	/uploads/DSC_09993_c4b3035f37_ae740ae328.webp	\N	local	\N	/	2024-10-22 21:50:49.524	2024-10-22 21:50:49.524	1	1
11	DSC_09995_e6ab8e7b6c.webp	\N	\N	375	375	{"thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_DSC_09995_e6ab8e7b6c_dd96627bf7.webp", "hash": "thumbnail_DSC_09995_e6ab8e7b6c_dd96627bf7", "mime": "image/webp", "name": "thumbnail_DSC_09995_e6ab8e7b6c.webp", "path": null, "size": 2.25, "width": 156, "height": 156, "sizeInBytes": 2246}}	DSC_09995_e6ab8e7b6c_dd96627bf7	.webp	image/webp	11.56	/uploads/DSC_09995_e6ab8e7b6c_dd96627bf7.webp	\N	local	\N	/	2024-10-22 21:50:49.528	2024-10-22 21:50:49.528	1	1
12	DSC_09996_8e4287eb78.webp	\N	\N	375	375	{"thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_DSC_09996_8e4287eb78_c248572ab9.webp", "hash": "thumbnail_DSC_09996_8e4287eb78_c248572ab9", "mime": "image/webp", "name": "thumbnail_DSC_09996_8e4287eb78.webp", "path": null, "size": 6.18, "width": 156, "height": 156, "sizeInBytes": 6178}}	DSC_09996_8e4287eb78_c248572ab9	.webp	image/webp	31.84	/uploads/DSC_09996_8e4287eb78_c248572ab9.webp	\N	local	\N	/	2024-10-22 21:50:49.545	2024-10-22 21:50:49.545	1	1
13	12_ff457231b8.webp	\N	\N	636	636	{"small": {"ext": ".webp", "url": "/uploads/small_12_ff457231b8_21306f471c.webp", "hash": "small_12_ff457231b8_21306f471c", "mime": "image/webp", "name": "small_12_ff457231b8.webp", "path": null, "size": 12.51, "width": 500, "height": 500, "sizeInBytes": 12510}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_12_ff457231b8_21306f471c.webp", "hash": "thumbnail_12_ff457231b8_21306f471c", "mime": "image/webp", "name": "thumbnail_12_ff457231b8.webp", "path": null, "size": 2.24, "width": 156, "height": 156, "sizeInBytes": 2244}}	12_ff457231b8_21306f471c	.webp	image/webp	20.12	/uploads/12_ff457231b8_21306f471c.webp	\N	local	\N	/	2024-10-22 21:50:49.588	2024-10-22 21:50:49.588	1	1
14	tinh-chat-phuc-hoi-da-ban-dem-estee-lauder-advanced-night-repair-50ml-620b212a80ffd-15022022104234.webp	\N	\N	500	500	{"thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_tinh_chat_phuc_hoi_da_ban_dem_estee_lauder_advanced_night_repair_50ml_620b212a80ffd_15022022104234_d318b0a538.webp", "hash": "thumbnail_tinh_chat_phuc_hoi_da_ban_dem_estee_lauder_advanced_night_repair_50ml_620b212a80ffd_15022022104234_d318b0a538", "mime": "image/webp", "name": "thumbnail_tinh-chat-phuc-hoi-da-ban-dem-estee-lauder-advanced-night-repair-50ml-620b212a80ffd-15022022104234.webp", "path": null, "size": 2.15, "width": 156, "height": 156, "sizeInBytes": 2150}}	tinh_chat_phuc_hoi_da_ban_dem_estee_lauder_advanced_night_repair_50ml_620b212a80ffd_15022022104234_d318b0a538	.webp	image/webp	13.08	/uploads/tinh_chat_phuc_hoi_da_ban_dem_estee_lauder_advanced_night_repair_50ml_620b212a80ffd_15022022104234_d318b0a538.webp	\N	local	\N	/	2024-10-22 21:54:53.505	2024-10-22 21:54:53.505	1	1
15	tinh-chat-phuc-hoi-da-ban-dem-estee-lauder-advanced-night-repair-50ml-620b212a80ffd-15022022104234.webp	\N	\N	500	500	{"thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_tinh_chat_phuc_hoi_da_ban_dem_estee_lauder_advanced_night_repair_50ml_620b212a80ffd_15022022104234_e53a46650c.webp", "hash": "thumbnail_tinh_chat_phuc_hoi_da_ban_dem_estee_lauder_advanced_night_repair_50ml_620b212a80ffd_15022022104234_e53a46650c", "mime": "image/webp", "name": "thumbnail_tinh-chat-phuc-hoi-da-ban-dem-estee-lauder-advanced-night-repair-50ml-620b212a80ffd-15022022104234.webp", "path": null, "size": 2.15, "width": 156, "height": 156, "sizeInBytes": 2150}}	tinh_chat_phuc_hoi_da_ban_dem_estee_lauder_advanced_night_repair_50ml_620b212a80ffd_15022022104234_e53a46650c	.webp	image/webp	13.08	/uploads/tinh_chat_phuc_hoi_da_ban_dem_estee_lauder_advanced_night_repair_50ml_620b212a80ffd_15022022104234_e53a46650c.webp	\N	local	\N	/	2024-10-22 21:55:00.252	2024-10-22 21:55:00.252	1	1
16	tinh-chat-phuc-hoi-da-ban-dem-estee-lauder-advanced-night-repair-50ml-620b212a8d1ee-15022022104234.webp	\N	\N	900	900	{"small": {"ext": ".webp", "url": "/uploads/small_tinh_chat_phuc_hoi_da_ban_dem_estee_lauder_advanced_night_repair_50ml_620b212a8d1ee_15022022104234_1eb35b8b4a.webp", "hash": "small_tinh_chat_phuc_hoi_da_ban_dem_estee_lauder_advanced_night_repair_50ml_620b212a8d1ee_15022022104234_1eb35b8b4a", "mime": "image/webp", "name": "small_tinh-chat-phuc-hoi-da-ban-dem-estee-lauder-advanced-night-repair-50ml-620b212a8d1ee-15022022104234.webp", "path": null, "size": 7.1, "width": 500, "height": 500, "sizeInBytes": 7100}, "medium": {"ext": ".webp", "url": "/uploads/medium_tinh_chat_phuc_hoi_da_ban_dem_estee_lauder_advanced_night_repair_50ml_620b212a8d1ee_15022022104234_1eb35b8b4a.webp", "hash": "medium_tinh_chat_phuc_hoi_da_ban_dem_estee_lauder_advanced_night_repair_50ml_620b212a8d1ee_15022022104234_1eb35b8b4a", "mime": "image/webp", "name": "medium_tinh-chat-phuc-hoi-da-ban-dem-estee-lauder-advanced-night-repair-50ml-620b212a8d1ee-15022022104234.webp", "path": null, "size": 11.62, "width": 750, "height": 750, "sizeInBytes": 11616}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_tinh_chat_phuc_hoi_da_ban_dem_estee_lauder_advanced_night_repair_50ml_620b212a8d1ee_15022022104234_1eb35b8b4a.webp", "hash": "thumbnail_tinh_chat_phuc_hoi_da_ban_dem_estee_lauder_advanced_night_repair_50ml_620b212a8d1ee_15022022104234_1eb35b8b4a", "mime": "image/webp", "name": "thumbnail_tinh-chat-phuc-hoi-da-ban-dem-estee-lauder-advanced-night-repair-50ml-620b212a8d1ee-15022022104234.webp", "path": null, "size": 1.37, "width": 156, "height": 156, "sizeInBytes": 1368}}	tinh_chat_phuc_hoi_da_ban_dem_estee_lauder_advanced_night_repair_50ml_620b212a8d1ee_15022022104234_1eb35b8b4a	.webp	image/webp	15.20	/uploads/tinh_chat_phuc_hoi_da_ban_dem_estee_lauder_advanced_night_repair_50ml_620b212a8d1ee_15022022104234_1eb35b8b4a.webp	\N	local	\N	/	2024-10-22 21:55:00.439	2024-10-22 21:55:00.439	1	1
17	sua-rua-mat-han-quoc-jpg-1651895114-07052022104514.webp	\N	\N	457	480	{"thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_sua_rua_mat_han_quoc_jpg_1651895114_07052022104514_bd2c42f9ee.webp", "hash": "thumbnail_sua_rua_mat_han_quoc_jpg_1651895114_07052022104514_bd2c42f9ee", "mime": "image/webp", "name": "thumbnail_sua-rua-mat-han-quoc-jpg-1651895114-07052022104514.webp", "path": null, "size": 2.63, "width": 149, "height": 156, "sizeInBytes": 2634}}	sua_rua_mat_han_quoc_jpg_1651895114_07052022104514_bd2c42f9ee	.webp	image/webp	12.35	/uploads/sua_rua_mat_han_quoc_jpg_1651895114_07052022104514_bd2c42f9ee.webp	\N	local	\N	/	2024-10-22 21:59:44.288	2024-10-22 21:59:44.288	1	1
18	sg-11134301-7rdwn-lzloernd6w8na7.webp	\N	\N	651	588	{"small": {"ext": ".webp", "url": "/uploads/small_sg_11134301_7rdwn_lzloernd6w8na7_067ce35b81.webp", "hash": "small_sg_11134301_7rdwn_lzloernd6w8na7_067ce35b81", "mime": "image/webp", "name": "small_sg-11134301-7rdwn-lzloernd6w8na7.webp", "path": null, "size": 8.77, "width": 500, "height": 452, "sizeInBytes": 8766}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_sg_11134301_7rdwn_lzloernd6w8na7_067ce35b81.webp", "hash": "thumbnail_sg_11134301_7rdwn_lzloernd6w8na7_067ce35b81", "mime": "image/webp", "name": "thumbnail_sg-11134301-7rdwn-lzloernd6w8na7.webp", "path": null, "size": 2.06, "width": 173, "height": 156, "sizeInBytes": 2056}}	sg_11134301_7rdwn_lzloernd6w8na7_067ce35b81	.webp	image/webp	13.26	/uploads/sg_11134301_7rdwn_lzloernd6w8na7_067ce35b81.webp	\N	local	\N	/	2024-10-22 22:01:18.481	2024-10-22 22:01:18.481	1	1
19	sg-11134201-22110-zka1gpsa88jv43.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_sg_11134201_22110_zka1gpsa88jv43_86f8db0079.webp", "hash": "large_sg_11134201_22110_zka1gpsa88jv43_86f8db0079", "mime": "image/webp", "name": "large_sg-11134201-22110-zka1gpsa88jv43.webp", "path": null, "size": 48.72, "width": 1000, "height": 1000, "sizeInBytes": 48720}, "small": {"ext": ".webp", "url": "/uploads/small_sg_11134201_22110_zka1gpsa88jv43_86f8db0079.webp", "hash": "small_sg_11134201_22110_zka1gpsa88jv43_86f8db0079", "mime": "image/webp", "name": "small_sg-11134201-22110-zka1gpsa88jv43.webp", "path": null, "size": 21.28, "width": 500, "height": 500, "sizeInBytes": 21276}, "medium": {"ext": ".webp", "url": "/uploads/medium_sg_11134201_22110_zka1gpsa88jv43_86f8db0079.webp", "hash": "medium_sg_11134201_22110_zka1gpsa88jv43_86f8db0079", "mime": "image/webp", "name": "medium_sg-11134201-22110-zka1gpsa88jv43.webp", "path": null, "size": 35.32, "width": 750, "height": 750, "sizeInBytes": 35324}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_sg_11134201_22110_zka1gpsa88jv43_86f8db0079.webp", "hash": "thumbnail_sg_11134201_22110_zka1gpsa88jv43_86f8db0079", "mime": "image/webp", "name": "thumbnail_sg-11134201-22110-zka1gpsa88jv43.webp", "path": null, "size": 3.99, "width": 156, "height": 156, "sizeInBytes": 3994}}	sg_11134201_22110_zka1gpsa88jv43_86f8db0079	.webp	image/webp	58.30	/uploads/sg_11134201_22110_zka1gpsa88jv43_86f8db0079.webp	\N	local	\N	/	2024-10-22 22:01:18.916	2024-10-22 22:01:18.916	1	1
20	sg-11134201-22110-mnobhaka88jv3d.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_sg_11134201_22110_mnobhaka88jv3d_36ffc928d4.webp", "hash": "large_sg_11134201_22110_mnobhaka88jv3d_36ffc928d4", "mime": "image/webp", "name": "large_sg-11134201-22110-mnobhaka88jv3d.webp", "path": null, "size": 54.8, "width": 1000, "height": 1000, "sizeInBytes": 54798}, "small": {"ext": ".webp", "url": "/uploads/small_sg_11134201_22110_mnobhaka88jv3d_36ffc928d4.webp", "hash": "small_sg_11134201_22110_mnobhaka88jv3d_36ffc928d4", "mime": "image/webp", "name": "small_sg-11134201-22110-mnobhaka88jv3d.webp", "path": null, "size": 24.77, "width": 500, "height": 500, "sizeInBytes": 24770}, "medium": {"ext": ".webp", "url": "/uploads/medium_sg_11134201_22110_mnobhaka88jv3d_36ffc928d4.webp", "hash": "medium_sg_11134201_22110_mnobhaka88jv3d_36ffc928d4", "mime": "image/webp", "name": "medium_sg-11134201-22110-mnobhaka88jv3d.webp", "path": null, "size": 40.41, "width": 750, "height": 750, "sizeInBytes": 40414}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_sg_11134201_22110_mnobhaka88jv3d_36ffc928d4.webp", "hash": "thumbnail_sg_11134201_22110_mnobhaka88jv3d_36ffc928d4", "mime": "image/webp", "name": "thumbnail_sg-11134201-22110-mnobhaka88jv3d.webp", "path": null, "size": 4.68, "width": 156, "height": 156, "sizeInBytes": 4678}}	sg_11134201_22110_mnobhaka88jv3d_36ffc928d4	.webp	image/webp	64.54	/uploads/sg_11134201_22110_mnobhaka88jv3d_36ffc928d4.webp	\N	local	\N	/	2024-10-22 22:01:18.922	2024-10-22 22:01:18.922	1	1
21	sg-11134201-22110-odj77qla88jvc7.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_sg_11134201_22110_odj77qla88jvc7_1692302e6f.webp", "hash": "large_sg_11134201_22110_odj77qla88jvc7_1692302e6f", "mime": "image/webp", "name": "large_sg-11134201-22110-odj77qla88jvc7.webp", "path": null, "size": 52.94, "width": 1000, "height": 1000, "sizeInBytes": 52936}, "small": {"ext": ".webp", "url": "/uploads/small_sg_11134201_22110_odj77qla88jvc7_1692302e6f.webp", "hash": "small_sg_11134201_22110_odj77qla88jvc7_1692302e6f", "mime": "image/webp", "name": "small_sg-11134201-22110-odj77qla88jvc7.webp", "path": null, "size": 23.85, "width": 500, "height": 500, "sizeInBytes": 23850}, "medium": {"ext": ".webp", "url": "/uploads/medium_sg_11134201_22110_odj77qla88jvc7_1692302e6f.webp", "hash": "medium_sg_11134201_22110_odj77qla88jvc7_1692302e6f", "mime": "image/webp", "name": "medium_sg-11134201-22110-odj77qla88jvc7.webp", "path": null, "size": 39.16, "width": 750, "height": 750, "sizeInBytes": 39162}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_sg_11134201_22110_odj77qla88jvc7_1692302e6f.webp", "hash": "thumbnail_sg_11134201_22110_odj77qla88jvc7_1692302e6f", "mime": "image/webp", "name": "thumbnail_sg-11134201-22110-odj77qla88jvc7.webp", "path": null, "size": 4.56, "width": 156, "height": 156, "sizeInBytes": 4560}}	sg_11134201_22110_odj77qla88jvc7_1692302e6f	.webp	image/webp	62.42	/uploads/sg_11134201_22110_odj77qla88jvc7_1692302e6f.webp	\N	local	\N	/	2024-10-22 22:01:18.928	2024-10-22 22:01:18.928	1	1
22	sg-11134201-22110-5byzu0ma88jve7.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_sg_11134201_22110_5byzu0ma88jve7_8385649fd5.webp", "hash": "large_sg_11134201_22110_5byzu0ma88jve7_8385649fd5", "mime": "image/webp", "name": "large_sg-11134201-22110-5byzu0ma88jve7.webp", "path": null, "size": 55.59, "width": 1000, "height": 1000, "sizeInBytes": 55594}, "small": {"ext": ".webp", "url": "/uploads/small_sg_11134201_22110_5byzu0ma88jve7_8385649fd5.webp", "hash": "small_sg_11134201_22110_5byzu0ma88jve7_8385649fd5", "mime": "image/webp", "name": "small_sg-11134201-22110-5byzu0ma88jve7.webp", "path": null, "size": 25, "width": 500, "height": 500, "sizeInBytes": 25000}, "medium": {"ext": ".webp", "url": "/uploads/medium_sg_11134201_22110_5byzu0ma88jve7_8385649fd5.webp", "hash": "medium_sg_11134201_22110_5byzu0ma88jve7_8385649fd5", "mime": "image/webp", "name": "medium_sg-11134201-22110-5byzu0ma88jve7.webp", "path": null, "size": 40.72, "width": 750, "height": 750, "sizeInBytes": 40716}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_sg_11134201_22110_5byzu0ma88jve7_8385649fd5.webp", "hash": "thumbnail_sg_11134201_22110_5byzu0ma88jve7_8385649fd5", "mime": "image/webp", "name": "thumbnail_sg-11134201-22110-5byzu0ma88jve7.webp", "path": null, "size": 4.9, "width": 156, "height": 156, "sizeInBytes": 4896}}	sg_11134201_22110_5byzu0ma88jve7_8385649fd5	.webp	image/webp	68.05	/uploads/sg_11134201_22110_5byzu0ma88jve7_8385649fd5.webp	\N	local	\N	/	2024-10-22 22:01:18.946	2024-10-22 22:01:18.946	1	1
23	sg-11134201-22110-1cw8uzia88jv0f.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_sg_11134201_22110_1cw8uzia88jv0f_e859ace105.webp", "hash": "large_sg_11134201_22110_1cw8uzia88jv0f_e859ace105", "mime": "image/webp", "name": "large_sg-11134201-22110-1cw8uzia88jv0f.webp", "path": null, "size": 63.17, "width": 1000, "height": 1000, "sizeInBytes": 63170}, "small": {"ext": ".webp", "url": "/uploads/small_sg_11134201_22110_1cw8uzia88jv0f_e859ace105.webp", "hash": "small_sg_11134201_22110_1cw8uzia88jv0f_e859ace105", "mime": "image/webp", "name": "small_sg-11134201-22110-1cw8uzia88jv0f.webp", "path": null, "size": 27.82, "width": 500, "height": 500, "sizeInBytes": 27820}, "medium": {"ext": ".webp", "url": "/uploads/medium_sg_11134201_22110_1cw8uzia88jv0f_e859ace105.webp", "hash": "medium_sg_11134201_22110_1cw8uzia88jv0f_e859ace105", "mime": "image/webp", "name": "medium_sg-11134201-22110-1cw8uzia88jv0f.webp", "path": null, "size": 45.59, "width": 750, "height": 750, "sizeInBytes": 45592}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_sg_11134201_22110_1cw8uzia88jv0f_e859ace105.webp", "hash": "thumbnail_sg_11134201_22110_1cw8uzia88jv0f_e859ace105", "mime": "image/webp", "name": "thumbnail_sg-11134201-22110-1cw8uzia88jv0f.webp", "path": null, "size": 5.19, "width": 156, "height": 156, "sizeInBytes": 5188}}	sg_11134201_22110_1cw8uzia88jv0f_e859ace105	.webp	image/webp	74.43	/uploads/sg_11134201_22110_1cw8uzia88jv0f_e859ace105.webp	\N	local	\N	/	2024-10-22 22:01:19.063	2024-10-22 22:01:19.063	1	1
24	sg-11134201-22110-co8e3sga88jv54.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_sg_11134201_22110_co8e3sga88jv54_5d96045c84.webp", "hash": "large_sg_11134201_22110_co8e3sga88jv54_5d96045c84", "mime": "image/webp", "name": "large_sg-11134201-22110-co8e3sga88jv54.webp", "path": null, "size": 29.72, "width": 1000, "height": 1000, "sizeInBytes": 29718}, "small": {"ext": ".webp", "url": "/uploads/small_sg_11134201_22110_co8e3sga88jv54_5d96045c84.webp", "hash": "small_sg_11134201_22110_co8e3sga88jv54_5d96045c84", "mime": "image/webp", "name": "small_sg-11134201-22110-co8e3sga88jv54.webp", "path": null, "size": 14.04, "width": 500, "height": 500, "sizeInBytes": 14040}, "medium": {"ext": ".webp", "url": "/uploads/medium_sg_11134201_22110_co8e3sga88jv54_5d96045c84.webp", "hash": "medium_sg_11134201_22110_co8e3sga88jv54_5d96045c84", "mime": "image/webp", "name": "medium_sg-11134201-22110-co8e3sga88jv54.webp", "path": null, "size": 22.25, "width": 750, "height": 750, "sizeInBytes": 22252}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_sg_11134201_22110_co8e3sga88jv54_5d96045c84.webp", "hash": "thumbnail_sg_11134201_22110_co8e3sga88jv54_5d96045c84", "mime": "image/webp", "name": "thumbnail_sg-11134201-22110-co8e3sga88jv54.webp", "path": null, "size": 3.05, "width": 156, "height": 156, "sizeInBytes": 3054}}	sg_11134201_22110_co8e3sga88jv54_5d96045c84	.webp	image/webp	33.64	/uploads/sg_11134201_22110_co8e3sga88jv54_5d96045c84.webp	\N	local	\N	/	2024-10-22 22:01:19.499	2024-10-22 22:01:19.499	1	1
25	sg-11134301-7rdwn-lzloernd6w8na7.webp	\N	\N	651	588	{"small": {"ext": ".webp", "url": "/uploads/small_sg_11134301_7rdwn_lzloernd6w8na7_e2e3114c76.webp", "hash": "small_sg_11134301_7rdwn_lzloernd6w8na7_e2e3114c76", "mime": "image/webp", "name": "small_sg-11134301-7rdwn-lzloernd6w8na7.webp", "path": null, "size": 8.77, "width": 500, "height": 452, "sizeInBytes": 8766}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_sg_11134301_7rdwn_lzloernd6w8na7_e2e3114c76.webp", "hash": "thumbnail_sg_11134301_7rdwn_lzloernd6w8na7_e2e3114c76", "mime": "image/webp", "name": "thumbnail_sg-11134301-7rdwn-lzloernd6w8na7.webp", "path": null, "size": 2.06, "width": 173, "height": 156, "sizeInBytes": 2056}}	sg_11134301_7rdwn_lzloernd6w8na7_e2e3114c76	.webp	image/webp	13.26	/uploads/sg_11134301_7rdwn_lzloernd6w8na7_e2e3114c76.webp	\N	local	\N	/	2024-10-22 22:01:39.262	2024-10-22 22:01:39.262	1	1
27	sg-11134201-22110-1cw8uzia88jv0f.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_sg_11134201_22110_1cw8uzia88jv0f_3f390aaf34.webp", "hash": "large_sg_11134201_22110_1cw8uzia88jv0f_3f390aaf34", "mime": "image/webp", "name": "large_sg-11134201-22110-1cw8uzia88jv0f.webp", "path": null, "size": 63.17, "width": 1000, "height": 1000, "sizeInBytes": 63170}, "small": {"ext": ".webp", "url": "/uploads/small_sg_11134201_22110_1cw8uzia88jv0f_3f390aaf34.webp", "hash": "small_sg_11134201_22110_1cw8uzia88jv0f_3f390aaf34", "mime": "image/webp", "name": "small_sg-11134201-22110-1cw8uzia88jv0f.webp", "path": null, "size": 27.82, "width": 500, "height": 500, "sizeInBytes": 27820}, "medium": {"ext": ".webp", "url": "/uploads/medium_sg_11134201_22110_1cw8uzia88jv0f_3f390aaf34.webp", "hash": "medium_sg_11134201_22110_1cw8uzia88jv0f_3f390aaf34", "mime": "image/webp", "name": "medium_sg-11134201-22110-1cw8uzia88jv0f.webp", "path": null, "size": 45.59, "width": 750, "height": 750, "sizeInBytes": 45592}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_sg_11134201_22110_1cw8uzia88jv0f_3f390aaf34.webp", "hash": "thumbnail_sg_11134201_22110_1cw8uzia88jv0f_3f390aaf34", "mime": "image/webp", "name": "thumbnail_sg-11134201-22110-1cw8uzia88jv0f.webp", "path": null, "size": 5.19, "width": 156, "height": 156, "sizeInBytes": 5188}}	sg_11134201_22110_1cw8uzia88jv0f_3f390aaf34	.webp	image/webp	74.43	/uploads/sg_11134201_22110_1cw8uzia88jv0f_3f390aaf34.webp	\N	local	\N	/	2024-10-22 22:01:39.416	2024-10-22 22:01:39.416	1	1
26	sg-11134201-22110-zka1gpsa88jv43.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_sg_11134201_22110_zka1gpsa88jv43_6218809ca2.webp", "hash": "large_sg_11134201_22110_zka1gpsa88jv43_6218809ca2", "mime": "image/webp", "name": "large_sg-11134201-22110-zka1gpsa88jv43.webp", "path": null, "size": 48.72, "width": 1000, "height": 1000, "sizeInBytes": 48720}, "small": {"ext": ".webp", "url": "/uploads/small_sg_11134201_22110_zka1gpsa88jv43_6218809ca2.webp", "hash": "small_sg_11134201_22110_zka1gpsa88jv43_6218809ca2", "mime": "image/webp", "name": "small_sg-11134201-22110-zka1gpsa88jv43.webp", "path": null, "size": 21.28, "width": 500, "height": 500, "sizeInBytes": 21276}, "medium": {"ext": ".webp", "url": "/uploads/medium_sg_11134201_22110_zka1gpsa88jv43_6218809ca2.webp", "hash": "medium_sg_11134201_22110_zka1gpsa88jv43_6218809ca2", "mime": "image/webp", "name": "medium_sg-11134201-22110-zka1gpsa88jv43.webp", "path": null, "size": 35.32, "width": 750, "height": 750, "sizeInBytes": 35324}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_sg_11134201_22110_zka1gpsa88jv43_6218809ca2.webp", "hash": "thumbnail_sg_11134201_22110_zka1gpsa88jv43_6218809ca2", "mime": "image/webp", "name": "thumbnail_sg-11134201-22110-zka1gpsa88jv43.webp", "path": null, "size": 3.99, "width": 156, "height": 156, "sizeInBytes": 3994}}	sg_11134201_22110_zka1gpsa88jv43_6218809ca2	.webp	image/webp	58.30	/uploads/sg_11134201_22110_zka1gpsa88jv43_6218809ca2.webp	\N	local	\N	/	2024-10-22 22:01:39.407	2024-10-22 22:01:39.407	1	1
28	sg-11134201-22110-5byzu0ma88jve7.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_sg_11134201_22110_5byzu0ma88jve7_8e06037726.webp", "hash": "large_sg_11134201_22110_5byzu0ma88jve7_8e06037726", "mime": "image/webp", "name": "large_sg-11134201-22110-5byzu0ma88jve7.webp", "path": null, "size": 55.59, "width": 1000, "height": 1000, "sizeInBytes": 55594}, "small": {"ext": ".webp", "url": "/uploads/small_sg_11134201_22110_5byzu0ma88jve7_8e06037726.webp", "hash": "small_sg_11134201_22110_5byzu0ma88jve7_8e06037726", "mime": "image/webp", "name": "small_sg-11134201-22110-5byzu0ma88jve7.webp", "path": null, "size": 25, "width": 500, "height": 500, "sizeInBytes": 25000}, "medium": {"ext": ".webp", "url": "/uploads/medium_sg_11134201_22110_5byzu0ma88jve7_8e06037726.webp", "hash": "medium_sg_11134201_22110_5byzu0ma88jve7_8e06037726", "mime": "image/webp", "name": "medium_sg-11134201-22110-5byzu0ma88jve7.webp", "path": null, "size": 40.72, "width": 750, "height": 750, "sizeInBytes": 40716}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_sg_11134201_22110_5byzu0ma88jve7_8e06037726.webp", "hash": "thumbnail_sg_11134201_22110_5byzu0ma88jve7_8e06037726", "mime": "image/webp", "name": "thumbnail_sg-11134201-22110-5byzu0ma88jve7.webp", "path": null, "size": 4.9, "width": 156, "height": 156, "sizeInBytes": 4896}}	sg_11134201_22110_5byzu0ma88jve7_8e06037726	.webp	image/webp	68.05	/uploads/sg_11134201_22110_5byzu0ma88jve7_8e06037726.webp	\N	local	\N	/	2024-10-22 22:01:39.586	2024-10-22 22:01:39.586	1	1
29	sg-11134201-22110-odj77qla88jvc7.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_sg_11134201_22110_odj77qla88jvc7_42dd5f2aff.webp", "hash": "large_sg_11134201_22110_odj77qla88jvc7_42dd5f2aff", "mime": "image/webp", "name": "large_sg-11134201-22110-odj77qla88jvc7.webp", "path": null, "size": 52.94, "width": 1000, "height": 1000, "sizeInBytes": 52936}, "small": {"ext": ".webp", "url": "/uploads/small_sg_11134201_22110_odj77qla88jvc7_42dd5f2aff.webp", "hash": "small_sg_11134201_22110_odj77qla88jvc7_42dd5f2aff", "mime": "image/webp", "name": "small_sg-11134201-22110-odj77qla88jvc7.webp", "path": null, "size": 23.85, "width": 500, "height": 500, "sizeInBytes": 23850}, "medium": {"ext": ".webp", "url": "/uploads/medium_sg_11134201_22110_odj77qla88jvc7_42dd5f2aff.webp", "hash": "medium_sg_11134201_22110_odj77qla88jvc7_42dd5f2aff", "mime": "image/webp", "name": "medium_sg-11134201-22110-odj77qla88jvc7.webp", "path": null, "size": 39.16, "width": 750, "height": 750, "sizeInBytes": 39162}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_sg_11134201_22110_odj77qla88jvc7_42dd5f2aff.webp", "hash": "thumbnail_sg_11134201_22110_odj77qla88jvc7_42dd5f2aff", "mime": "image/webp", "name": "thumbnail_sg-11134201-22110-odj77qla88jvc7.webp", "path": null, "size": 4.56, "width": 156, "height": 156, "sizeInBytes": 4560}}	sg_11134201_22110_odj77qla88jvc7_42dd5f2aff	.webp	image/webp	62.42	/uploads/sg_11134201_22110_odj77qla88jvc7_42dd5f2aff.webp	\N	local	\N	/	2024-10-22 22:01:39.59	2024-10-22 22:01:39.59	1	1
30	sg-11134201-22110-mnobhaka88jv3d.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_sg_11134201_22110_mnobhaka88jv3d_f003bc015e.webp", "hash": "large_sg_11134201_22110_mnobhaka88jv3d_f003bc015e", "mime": "image/webp", "name": "large_sg-11134201-22110-mnobhaka88jv3d.webp", "path": null, "size": 54.8, "width": 1000, "height": 1000, "sizeInBytes": 54798}, "small": {"ext": ".webp", "url": "/uploads/small_sg_11134201_22110_mnobhaka88jv3d_f003bc015e.webp", "hash": "small_sg_11134201_22110_mnobhaka88jv3d_f003bc015e", "mime": "image/webp", "name": "small_sg-11134201-22110-mnobhaka88jv3d.webp", "path": null, "size": 24.77, "width": 500, "height": 500, "sizeInBytes": 24770}, "medium": {"ext": ".webp", "url": "/uploads/medium_sg_11134201_22110_mnobhaka88jv3d_f003bc015e.webp", "hash": "medium_sg_11134201_22110_mnobhaka88jv3d_f003bc015e", "mime": "image/webp", "name": "medium_sg-11134201-22110-mnobhaka88jv3d.webp", "path": null, "size": 40.41, "width": 750, "height": 750, "sizeInBytes": 40414}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_sg_11134201_22110_mnobhaka88jv3d_f003bc015e.webp", "hash": "thumbnail_sg_11134201_22110_mnobhaka88jv3d_f003bc015e", "mime": "image/webp", "name": "thumbnail_sg-11134201-22110-mnobhaka88jv3d.webp", "path": null, "size": 4.68, "width": 156, "height": 156, "sizeInBytes": 4678}}	sg_11134201_22110_mnobhaka88jv3d_f003bc015e	.webp	image/webp	64.54	/uploads/sg_11134201_22110_mnobhaka88jv3d_f003bc015e.webp	\N	local	\N	/	2024-10-22 22:01:39.648	2024-10-22 22:01:39.648	1	1
31	sg-11134201-22110-co8e3sga88jv54.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_sg_11134201_22110_co8e3sga88jv54_137544e79c.webp", "hash": "large_sg_11134201_22110_co8e3sga88jv54_137544e79c", "mime": "image/webp", "name": "large_sg-11134201-22110-co8e3sga88jv54.webp", "path": null, "size": 29.72, "width": 1000, "height": 1000, "sizeInBytes": 29718}, "small": {"ext": ".webp", "url": "/uploads/small_sg_11134201_22110_co8e3sga88jv54_137544e79c.webp", "hash": "small_sg_11134201_22110_co8e3sga88jv54_137544e79c", "mime": "image/webp", "name": "small_sg-11134201-22110-co8e3sga88jv54.webp", "path": null, "size": 14.04, "width": 500, "height": 500, "sizeInBytes": 14040}, "medium": {"ext": ".webp", "url": "/uploads/medium_sg_11134201_22110_co8e3sga88jv54_137544e79c.webp", "hash": "medium_sg_11134201_22110_co8e3sga88jv54_137544e79c", "mime": "image/webp", "name": "medium_sg-11134201-22110-co8e3sga88jv54.webp", "path": null, "size": 22.25, "width": 750, "height": 750, "sizeInBytes": 22252}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_sg_11134201_22110_co8e3sga88jv54_137544e79c.webp", "hash": "thumbnail_sg_11134201_22110_co8e3sga88jv54_137544e79c", "mime": "image/webp", "name": "thumbnail_sg-11134201-22110-co8e3sga88jv54.webp", "path": null, "size": 3.05, "width": 156, "height": 156, "sizeInBytes": 3054}}	sg_11134201_22110_co8e3sga88jv54_137544e79c	.webp	image/webp	33.64	/uploads/sg_11134201_22110_co8e3sga88jv54_137544e79c.webp	\N	local	\N	/	2024-10-22 22:01:40.129	2024-10-22 22:01:40.129	1	1
32	tai-tao-da-phuc-hoi-da-ton-thuong-3.jpg	\N	\N	660	480	{"small": {"ext": ".jpg", "url": "/uploads/small_tai_tao_da_phuc_hoi_da_ton_thuong_3_476f318146.jpg", "hash": "small_tai_tao_da_phuc_hoi_da_ton_thuong_3_476f318146", "mime": "image/jpeg", "name": "small_tai-tao-da-phuc-hoi-da-ton-thuong-3.jpg", "path": null, "size": 19.86, "width": 500, "height": 364, "sizeInBytes": 19864}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_tai_tao_da_phuc_hoi_da_ton_thuong_3_476f318146.jpg", "hash": "thumbnail_tai_tao_da_phuc_hoi_da_ton_thuong_3_476f318146", "mime": "image/jpeg", "name": "thumbnail_tai-tao-da-phuc-hoi-da-ton-thuong-3.jpg", "path": null, "size": 4.73, "width": 214, "height": 156, "sizeInBytes": 4732}}	tai_tao_da_phuc_hoi_da_ton_thuong_3_476f318146	.jpg	image/jpeg	33.07	/uploads/tai_tao_da_phuc_hoi_da_ton_thuong_3_476f318146.jpg	\N	local	\N	/	2024-10-22 22:03:44.95	2024-10-22 22:03:44.95	1	1
73	mat-na-duong-am-da.webp	\N	\N	640	353	{"small": {"ext": ".webp", "url": "/uploads/small_mat_na_duong_am_da_d41896677c.webp", "hash": "small_mat_na_duong_am_da_d41896677c", "mime": "image/webp", "name": "small_mat-na-duong-am-da.webp", "path": null, "size": 10.94, "width": 500, "height": 276, "sizeInBytes": 10938}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_mat_na_duong_am_da_d41896677c.webp", "hash": "thumbnail_mat_na_duong_am_da_d41896677c", "mime": "image/webp", "name": "thumbnail_mat-na-duong-am-da.webp", "path": null, "size": 4.6, "width": 245, "height": 135, "sizeInBytes": 4596}}	mat_na_duong_am_da_d41896677c	.webp	image/webp	17.47	/uploads/mat_na_duong_am_da_d41896677c.webp	\N	local	\N	/	2024-10-31 08:59:00.934	2024-10-31 08:59:00.934	1	1
74	mat-na-duong-am-da.jpg	\N	\N	640	353	{"small": {"ext": ".jpg", "url": "/uploads/small_mat_na_duong_am_da_e0ab5f334c.jpg", "hash": "small_mat_na_duong_am_da_e0ab5f334c", "mime": "image/jpeg", "name": "small_mat-na-duong-am-da.jpg", "path": null, "size": 257.55, "width": 500, "height": 276, "sizeInBytes": 257552}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_mat_na_duong_am_da_e0ab5f334c.jpg", "hash": "thumbnail_mat_na_duong_am_da_e0ab5f334c", "mime": "image/jpeg", "name": "thumbnail_mat-na-duong-am-da.jpg", "path": null, "size": 70.53, "width": 245, "height": 135, "sizeInBytes": 70525}}	mat_na_duong_am_da_e0ab5f334c	.jpg	image/jpeg	111.69	/uploads/mat_na_duong_am_da_e0ab5f334c.jpg	\N	local	\N	/	2024-10-31 08:59:42.015	2024-10-31 08:59:42.015	1	1
34	serum-phuc-hoi-da-sau-mun-3.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_serum_phuc_hoi_da_sau_mun_3_214836456a.webp", "hash": "large_serum_phuc_hoi_da_sau_mun_3_214836456a", "mime": "image/webp", "name": "large_serum-phuc-hoi-da-sau-mun-3.webp", "path": null, "size": 43.7, "width": 1000, "height": 1000, "sizeInBytes": 43698}, "small": {"ext": ".webp", "url": "/uploads/small_serum_phuc_hoi_da_sau_mun_3_214836456a.webp", "hash": "small_serum_phuc_hoi_da_sau_mun_3_214836456a", "mime": "image/webp", "name": "small_serum-phuc-hoi-da-sau-mun-3.webp", "path": null, "size": 17.93, "width": 500, "height": 500, "sizeInBytes": 17928}, "medium": {"ext": ".webp", "url": "/uploads/medium_serum_phuc_hoi_da_sau_mun_3_214836456a.webp", "hash": "medium_serum_phuc_hoi_da_sau_mun_3_214836456a", "mime": "image/webp", "name": "medium_serum-phuc-hoi-da-sau-mun-3.webp", "path": null, "size": 31.29, "width": 750, "height": 750, "sizeInBytes": 31294}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_serum_phuc_hoi_da_sau_mun_3_214836456a.webp", "hash": "thumbnail_serum_phuc_hoi_da_sau_mun_3_214836456a", "mime": "image/webp", "name": "thumbnail_serum-phuc-hoi-da-sau-mun-3.webp", "path": null, "size": 3.38, "width": 156, "height": 156, "sizeInBytes": 3380}}	serum_phuc_hoi_da_sau_mun_3_214836456a	.webp	image/webp	52.64	/uploads/serum_phuc_hoi_da_sau_mun_3_214836456a.webp	\N	local	\N	/	2024-10-22 22:05:52.306	2024-10-22 22:05:52.306	1	1
35	vn-11134207-7r98o-lsaw5h2mj2dg10.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_vn_11134207_7r98o_lsaw5h2mj2dg10_a79258199e.webp", "hash": "large_vn_11134207_7r98o_lsaw5h2mj2dg10_a79258199e", "mime": "image/webp", "name": "large_vn-11134207-7r98o-lsaw5h2mj2dg10.webp", "path": null, "size": 40.61, "width": 1000, "height": 1000, "sizeInBytes": 40614}, "small": {"ext": ".webp", "url": "/uploads/small_vn_11134207_7r98o_lsaw5h2mj2dg10_a79258199e.webp", "hash": "small_vn_11134207_7r98o_lsaw5h2mj2dg10_a79258199e", "mime": "image/webp", "name": "small_vn-11134207-7r98o-lsaw5h2mj2dg10.webp", "path": null, "size": 16.83, "width": 500, "height": 500, "sizeInBytes": 16830}, "medium": {"ext": ".webp", "url": "/uploads/medium_vn_11134207_7r98o_lsaw5h2mj2dg10_a79258199e.webp", "hash": "medium_vn_11134207_7r98o_lsaw5h2mj2dg10_a79258199e", "mime": "image/webp", "name": "medium_vn-11134207-7r98o-lsaw5h2mj2dg10.webp", "path": null, "size": 28.67, "width": 750, "height": 750, "sizeInBytes": 28670}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_vn_11134207_7r98o_lsaw5h2mj2dg10_a79258199e.webp", "hash": "thumbnail_vn_11134207_7r98o_lsaw5h2mj2dg10_a79258199e", "mime": "image/webp", "name": "thumbnail_vn-11134207-7r98o-lsaw5h2mj2dg10.webp", "path": null, "size": 3.32, "width": 156, "height": 156, "sizeInBytes": 3324}}	vn_11134207_7r98o_lsaw5h2mj2dg10_a79258199e	.webp	image/webp	50.61	/uploads/vn_11134207_7r98o_lsaw5h2mj2dg10_a79258199e.webp	\N	local	\N	/	2024-10-22 22:07:02.323	2024-10-22 22:07:02.323	1	1
36	vn-11134207-7r98o-lsl2zw52ozpg42.webp	\N	\N	1000	1000	{"small": {"ext": ".webp", "url": "/uploads/small_vn_11134207_7r98o_lsl2zw52ozpg42_e7f46c5ca7.webp", "hash": "small_vn_11134207_7r98o_lsl2zw52ozpg42_e7f46c5ca7", "mime": "image/webp", "name": "small_vn-11134207-7r98o-lsl2zw52ozpg42.webp", "path": null, "size": 26.11, "width": 500, "height": 500, "sizeInBytes": 26114}, "medium": {"ext": ".webp", "url": "/uploads/medium_vn_11134207_7r98o_lsl2zw52ozpg42_e7f46c5ca7.webp", "hash": "medium_vn_11134207_7r98o_lsl2zw52ozpg42_e7f46c5ca7", "mime": "image/webp", "name": "medium_vn-11134207-7r98o-lsl2zw52ozpg42.webp", "path": null, "size": 42.83, "width": 750, "height": 750, "sizeInBytes": 42830}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_vn_11134207_7r98o_lsl2zw52ozpg42_e7f46c5ca7.webp", "hash": "thumbnail_vn_11134207_7r98o_lsl2zw52ozpg42_e7f46c5ca7", "mime": "image/webp", "name": "thumbnail_vn-11134207-7r98o-lsl2zw52ozpg42.webp", "path": null, "size": 4.78, "width": 156, "height": 156, "sizeInBytes": 4784}}	vn_11134207_7r98o_lsl2zw52ozpg42_e7f46c5ca7	.webp	image/webp	68.65	/uploads/vn_11134207_7r98o_lsl2zw52ozpg42_e7f46c5ca7.webp	\N	local	\N	/	2024-10-22 22:07:02.338	2024-10-22 22:07:02.338	1	1
37	vn-11134207-7r98o-ls6te3qr3rgk3e.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_vn_11134207_7r98o_ls6te3qr3rgk3e_1a4ffd1ff9.webp", "hash": "large_vn_11134207_7r98o_ls6te3qr3rgk3e_1a4ffd1ff9", "mime": "image/webp", "name": "large_vn-11134207-7r98o-ls6te3qr3rgk3e.webp", "path": null, "size": 65.75, "width": 1000, "height": 1000, "sizeInBytes": 65746}, "small": {"ext": ".webp", "url": "/uploads/small_vn_11134207_7r98o_ls6te3qr3rgk3e_1a4ffd1ff9.webp", "hash": "small_vn_11134207_7r98o_ls6te3qr3rgk3e_1a4ffd1ff9", "mime": "image/webp", "name": "small_vn-11134207-7r98o-ls6te3qr3rgk3e.webp", "path": null, "size": 28.43, "width": 500, "height": 500, "sizeInBytes": 28428}, "medium": {"ext": ".webp", "url": "/uploads/medium_vn_11134207_7r98o_ls6te3qr3rgk3e_1a4ffd1ff9.webp", "hash": "medium_vn_11134207_7r98o_ls6te3qr3rgk3e_1a4ffd1ff9", "mime": "image/webp", "name": "medium_vn-11134207-7r98o-ls6te3qr3rgk3e.webp", "path": null, "size": 47.75, "width": 750, "height": 750, "sizeInBytes": 47754}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_vn_11134207_7r98o_ls6te3qr3rgk3e_1a4ffd1ff9.webp", "hash": "thumbnail_vn_11134207_7r98o_ls6te3qr3rgk3e_1a4ffd1ff9", "mime": "image/webp", "name": "thumbnail_vn-11134207-7r98o-ls6te3qr3rgk3e.webp", "path": null, "size": 4.97, "width": 156, "height": 156, "sizeInBytes": 4968}}	vn_11134207_7r98o_ls6te3qr3rgk3e_1a4ffd1ff9	.webp	image/webp	83.32	/uploads/vn_11134207_7r98o_ls6te3qr3rgk3e_1a4ffd1ff9.webp	\N	local	\N	/	2024-10-22 22:07:02.574	2024-10-22 22:07:02.574	1	1
39	vn-11134207-7r98o-lsl2zw52ulz831.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_vn_11134207_7r98o_lsl2zw52ulz831_9eb6bfcd8d.webp", "hash": "large_vn_11134207_7r98o_lsl2zw52ulz831_9eb6bfcd8d", "mime": "image/webp", "name": "large_vn-11134207-7r98o-lsl2zw52ulz831.webp", "path": null, "size": 47.79, "width": 1000, "height": 1000, "sizeInBytes": 47792}, "small": {"ext": ".webp", "url": "/uploads/small_vn_11134207_7r98o_lsl2zw52ulz831_9eb6bfcd8d.webp", "hash": "small_vn_11134207_7r98o_lsl2zw52ulz831_9eb6bfcd8d", "mime": "image/webp", "name": "small_vn-11134207-7r98o-lsl2zw52ulz831.webp", "path": null, "size": 22.91, "width": 500, "height": 500, "sizeInBytes": 22906}, "medium": {"ext": ".webp", "url": "/uploads/medium_vn_11134207_7r98o_lsl2zw52ulz831_9eb6bfcd8d.webp", "hash": "medium_vn_11134207_7r98o_lsl2zw52ulz831_9eb6bfcd8d", "mime": "image/webp", "name": "medium_vn-11134207-7r98o-lsl2zw52ulz831.webp", "path": null, "size": 35.79, "width": 750, "height": 750, "sizeInBytes": 35794}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_vn_11134207_7r98o_lsl2zw52ulz831_9eb6bfcd8d.webp", "hash": "thumbnail_vn_11134207_7r98o_lsl2zw52ulz831_9eb6bfcd8d", "mime": "image/webp", "name": "thumbnail_vn-11134207-7r98o-lsl2zw52ulz831.webp", "path": null, "size": 4.99, "width": 156, "height": 156, "sizeInBytes": 4992}}	vn_11134207_7r98o_lsl2zw52ulz831_9eb6bfcd8d	.webp	image/webp	54.41	/uploads/vn_11134207_7r98o_lsl2zw52ulz831_9eb6bfcd8d.webp	\N	local	\N	/	2024-10-22 22:07:02.624	2024-10-22 22:07:02.624	1	1
40	vn-11134207-7r98o-lsl2zw52t7es92.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_vn_11134207_7r98o_lsl2zw52t7es92_2d1f0670c5.webp", "hash": "large_vn_11134207_7r98o_lsl2zw52t7es92_2d1f0670c5", "mime": "image/webp", "name": "large_vn-11134207-7r98o-lsl2zw52t7es92.webp", "path": null, "size": 45.56, "width": 1000, "height": 1000, "sizeInBytes": 45564}, "small": {"ext": ".webp", "url": "/uploads/small_vn_11134207_7r98o_lsl2zw52t7es92_2d1f0670c5.webp", "hash": "small_vn_11134207_7r98o_lsl2zw52t7es92_2d1f0670c5", "mime": "image/webp", "name": "small_vn-11134207-7r98o-lsl2zw52t7es92.webp", "path": null, "size": 20.5, "width": 500, "height": 500, "sizeInBytes": 20504}, "medium": {"ext": ".webp", "url": "/uploads/medium_vn_11134207_7r98o_lsl2zw52t7es92_2d1f0670c5.webp", "hash": "medium_vn_11134207_7r98o_lsl2zw52t7es92_2d1f0670c5", "mime": "image/webp", "name": "medium_vn-11134207-7r98o-lsl2zw52t7es92.webp", "path": null, "size": 33.75, "width": 750, "height": 750, "sizeInBytes": 33752}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_vn_11134207_7r98o_lsl2zw52t7es92_2d1f0670c5.webp", "hash": "thumbnail_vn_11134207_7r98o_lsl2zw52t7es92_2d1f0670c5", "mime": "image/webp", "name": "thumbnail_vn-11134207-7r98o-lsl2zw52t7es92.webp", "path": null, "size": 4.31, "width": 156, "height": 156, "sizeInBytes": 4312}}	vn_11134207_7r98o_lsl2zw52t7es92_2d1f0670c5	.webp	image/webp	57.12	/uploads/vn_11134207_7r98o_lsl2zw52t7es92_2d1f0670c5.webp	\N	local	\N	/	2024-10-22 22:07:02.789	2024-10-22 22:07:02.789	1	1
41	vn-11134207-7r98o-lsl2zw52rsuc52.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_vn_11134207_7r98o_lsl2zw52rsuc52_b0e4424b31.webp", "hash": "large_vn_11134207_7r98o_lsl2zw52rsuc52_b0e4424b31", "mime": "image/webp", "name": "large_vn-11134207-7r98o-lsl2zw52rsuc52.webp", "path": null, "size": 34.18, "width": 1000, "height": 1000, "sizeInBytes": 34178}, "small": {"ext": ".webp", "url": "/uploads/small_vn_11134207_7r98o_lsl2zw52rsuc52_b0e4424b31.webp", "hash": "small_vn_11134207_7r98o_lsl2zw52rsuc52_b0e4424b31", "mime": "image/webp", "name": "small_vn-11134207-7r98o-lsl2zw52rsuc52.webp", "path": null, "size": 15.24, "width": 500, "height": 500, "sizeInBytes": 15238}, "medium": {"ext": ".webp", "url": "/uploads/medium_vn_11134207_7r98o_lsl2zw52rsuc52_b0e4424b31.webp", "hash": "medium_vn_11134207_7r98o_lsl2zw52rsuc52_b0e4424b31", "mime": "image/webp", "name": "medium_vn-11134207-7r98o-lsl2zw52rsuc52.webp", "path": null, "size": 24.85, "width": 750, "height": 750, "sizeInBytes": 24850}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_vn_11134207_7r98o_lsl2zw52rsuc52_b0e4424b31.webp", "hash": "thumbnail_vn_11134207_7r98o_lsl2zw52rsuc52_b0e4424b31", "mime": "image/webp", "name": "thumbnail_vn-11134207-7r98o-lsl2zw52rsuc52.webp", "path": null, "size": 3.36, "width": 156, "height": 156, "sizeInBytes": 3356}}	vn_11134207_7r98o_lsl2zw52rsuc52_b0e4424b31	.webp	image/webp	37.78	/uploads/vn_11134207_7r98o_lsl2zw52rsuc52_b0e4424b31.webp	\N	local	\N	/	2024-10-22 22:07:03.207	2024-10-22 22:20:21.581	1	1
48	vouchers-image-1.webp	\N	\N	931	406	{"small": {"ext": ".webp", "url": "/uploads/small_vouchers_image_1_74581bd975.webp", "hash": "small_vouchers_image_1_74581bd975", "mime": "image/webp", "name": "small_vouchers-image-1.webp", "path": null, "size": 6.17, "width": 500, "height": 218, "sizeInBytes": 6170}, "medium": {"ext": ".webp", "url": "/uploads/medium_vouchers_image_1_74581bd975.webp", "hash": "medium_vouchers_image_1_74581bd975", "mime": "image/webp", "name": "medium_vouchers-image-1.webp", "path": null, "size": 9.52, "width": 750, "height": 327, "sizeInBytes": 9516}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_vouchers_image_1_74581bd975.webp", "hash": "thumbnail_vouchers_image_1_74581bd975", "mime": "image/webp", "name": "thumbnail_vouchers-image-1.webp", "path": null, "size": 2.75, "width": 245, "height": 107, "sizeInBytes": 2752}}	vouchers_image_1_74581bd975	.webp	image/webp	13.99	/uploads/vouchers_image_1_74581bd975.webp	\N	local	\N	/	2024-10-24 17:51:15.1	2024-10-24 17:51:15.1	1	1
60	vouchers-image-1.webp	\N	\N	931	406	{"small": {"ext": ".webp", "url": "/uploads/small_vouchers_image_1_80ef7ec03b.webp", "hash": "small_vouchers_image_1_80ef7ec03b", "mime": "image/webp", "name": "small_vouchers-image-1.webp", "path": null, "size": 6.17, "width": 500, "height": 218, "sizeInBytes": 6170}, "medium": {"ext": ".webp", "url": "/uploads/medium_vouchers_image_1_80ef7ec03b.webp", "hash": "medium_vouchers_image_1_80ef7ec03b", "mime": "image/webp", "name": "medium_vouchers-image-1.webp", "path": null, "size": 9.52, "width": 750, "height": 327, "sizeInBytes": 9516}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_vouchers_image_1_80ef7ec03b.webp", "hash": "thumbnail_vouchers_image_1_80ef7ec03b", "mime": "image/webp", "name": "thumbnail_vouchers-image-1.webp", "path": null, "size": 2.75, "width": 245, "height": 107, "sizeInBytes": 2752}}	vouchers_image_1_80ef7ec03b	.webp	image/webp	13.99	/uploads/vouchers_image_1_80ef7ec03b.webp	\N	local	\N	/1	2024-10-29 16:55:12.889	2024-10-29 16:55:12.889	\N	\N
42	treatment_1.jpg	\N	\N	1024	768	{"large": {"ext": ".jpg", "url": "/uploads/large_treatment_1_4abc3620c3.jpg", "hash": "large_treatment_1_4abc3620c3", "mime": "image/jpeg", "name": "large_treatment_1.jpg", "path": null, "size": 47.63, "width": 1000, "height": 750, "sizeInBytes": 47625}, "small": {"ext": ".jpg", "url": "/uploads/small_treatment_1_4abc3620c3.jpg", "hash": "small_treatment_1_4abc3620c3", "mime": "image/jpeg", "name": "small_treatment_1.jpg", "path": null, "size": 15.93, "width": 500, "height": 375, "sizeInBytes": 15933}, "medium": {"ext": ".jpg", "url": "/uploads/medium_treatment_1_4abc3620c3.jpg", "hash": "medium_treatment_1_4abc3620c3", "mime": "image/jpeg", "name": "medium_treatment_1.jpg", "path": null, "size": 30.58, "width": 750, "height": 563, "sizeInBytes": 30582}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_treatment_1_4abc3620c3.jpg", "hash": "thumbnail_treatment_1_4abc3620c3", "mime": "image/jpeg", "name": "thumbnail_treatment_1.jpg", "path": null, "size": 4.33, "width": 208, "height": 156, "sizeInBytes": 4329}}	treatment_1_4abc3620c3	.jpg	image/jpeg	49.34	/uploads/treatment_1_4abc3620c3.jpg	\N	local	\N	/	2024-10-22 22:53:36.147	2024-10-22 22:53:36.147	1	1
43	treatment_2.jpeg	\N	\N	1080	720	{"large": {"ext": ".jpeg", "url": "/uploads/large_treatment_2_af06311f1f.jpeg", "hash": "large_treatment_2_af06311f1f", "mime": "image/jpeg", "name": "large_treatment_2.jpeg", "path": null, "size": 47.97, "width": 1000, "height": 667, "sizeInBytes": 47972}, "small": {"ext": ".jpeg", "url": "/uploads/small_treatment_2_af06311f1f.jpeg", "hash": "small_treatment_2_af06311f1f", "mime": "image/jpeg", "name": "small_treatment_2.jpeg", "path": null, "size": 14.98, "width": 500, "height": 333, "sizeInBytes": 14975}, "medium": {"ext": ".jpeg", "url": "/uploads/medium_treatment_2_af06311f1f.jpeg", "hash": "medium_treatment_2_af06311f1f", "mime": "image/jpeg", "name": "medium_treatment_2.jpeg", "path": null, "size": 29.43, "width": 750, "height": 500, "sizeInBytes": 29430}, "thumbnail": {"ext": ".jpeg", "url": "/uploads/thumbnail_treatment_2_af06311f1f.jpeg", "hash": "thumbnail_treatment_2_af06311f1f", "mime": "image/jpeg", "name": "thumbnail_treatment_2.jpeg", "path": null, "size": 4.87, "width": 234, "height": 156, "sizeInBytes": 4867}}	treatment_2_af06311f1f	.jpeg	image/jpeg	54.46	/uploads/treatment_2_af06311f1f.jpeg	\N	local	\N	/	2024-10-22 22:54:28.313	2024-10-22 22:54:28.313	1	1
44	treatment_3.png	\N	\N	600	400	{"small": {"ext": ".png", "url": "/uploads/small_treatment_3_7c58bd6451.png", "hash": "small_treatment_3_7c58bd6451", "mime": "image/png", "name": "small_treatment_3.png", "path": null, "size": 329.76, "width": 500, "height": 333, "sizeInBytes": 329758}, "thumbnail": {"ext": ".png", "url": "/uploads/thumbnail_treatment_3_7c58bd6451.png", "hash": "thumbnail_treatment_3_7c58bd6451", "mime": "image/png", "name": "thumbnail_treatment_3.png", "path": null, "size": 77.19, "width": 234, "height": 156, "sizeInBytes": 77188}}	treatment_3_7c58bd6451	.png	image/png	115.10	/uploads/treatment_3_7c58bd6451.png	\N	local	\N	/	2024-10-22 22:55:18.439	2024-10-22 22:55:18.439	1	1
45	set-nam-01-min.webp	\N	\N	1024	683	{"large": {"ext": ".webp", "url": "/uploads/large_set_nam_01_min_f5576759cf.webp", "hash": "large_set_nam_01_min_f5576759cf", "mime": "image/webp", "name": "large_set-nam-01-min.webp", "path": null, "size": 34.36, "width": 1000, "height": 667, "sizeInBytes": 34356}, "small": {"ext": ".webp", "url": "/uploads/small_set_nam_01_min_f5576759cf.webp", "hash": "small_set_nam_01_min_f5576759cf", "mime": "image/webp", "name": "small_set-nam-01-min.webp", "path": null, "size": 15.12, "width": 500, "height": 333, "sizeInBytes": 15124}, "medium": {"ext": ".webp", "url": "/uploads/medium_set_nam_01_min_f5576759cf.webp", "hash": "medium_set_nam_01_min_f5576759cf", "mime": "image/webp", "name": "medium_set-nam-01-min.webp", "path": null, "size": 24.55, "width": 750, "height": 500, "sizeInBytes": 24548}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_set_nam_01_min_f5576759cf.webp", "hash": "thumbnail_set_nam_01_min_f5576759cf", "mime": "image/webp", "name": "thumbnail_set-nam-01-min.webp", "path": null, "size": 5.61, "width": 234, "height": 156, "sizeInBytes": 5612}}	set_nam_01_min_f5576759cf	.webp	image/webp	41.40	/uploads/set_nam_01_min_f5576759cf.webp	\N	local	\N	/	2024-10-22 23:00:48.795	2024-10-22 23:00:48.795	1	1
46	362816-90-phut-massage-body-thu-gian-ket-hop-cham-soc-da-mat-tai-he-thong-hana-spa.jpg	\N	\N	500	500	{"thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_362816_90_phut_massage_body_thu_gian_ket_hop_cham_soc_da_mat_tai_he_thong_hana_spa_c62eb55fde.jpg", "hash": "thumbnail_362816_90_phut_massage_body_thu_gian_ket_hop_cham_soc_da_mat_tai_he_thong_hana_spa_c62eb55fde", "mime": "image/jpeg", "name": "thumbnail_362816-90-phut-massage-body-thu-gian-ket-hop-cham-soc-da-mat-tai-he-thong-hana-spa.jpg", "path": null, "size": 6.37, "width": 156, "height": 156, "sizeInBytes": 6368}}	362816_90_phut_massage_body_thu_gian_ket_hop_cham_soc_da_mat_tai_he_thong_hana_spa_c62eb55fde	.jpg	image/jpeg	37.27	/uploads/362816_90_phut_massage_body_thu_gian_ket_hop_cham_soc_da_mat_tai_he_thong_hana_spa_c62eb55fde.jpg	\N	local	\N	/	2024-10-22 23:02:22.405	2024-10-22 23:02:22.405	1	1
38	vn-11134207-7r98o-lsl2zw52w0jodf.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_vn_11134207_7r98o_lsl2zw52w0jodf_85758ed7d5.webp", "hash": "large_vn_11134207_7r98o_lsl2zw52w0jodf_85758ed7d5", "mime": "image/webp", "name": "large_vn-11134207-7r98o-lsl2zw52w0jodf.webp", "path": null, "size": 59.4, "width": 1000, "height": 1000, "sizeInBytes": 59398}, "small": {"ext": ".webp", "url": "/uploads/small_vn_11134207_7r98o_lsl2zw52w0jodf_85758ed7d5.webp", "hash": "small_vn_11134207_7r98o_lsl2zw52w0jodf_85758ed7d5", "mime": "image/webp", "name": "small_vn-11134207-7r98o-lsl2zw52w0jodf.webp", "path": null, "size": 24.65, "width": 500, "height": 500, "sizeInBytes": 24652}, "medium": {"ext": ".webp", "url": "/uploads/medium_vn_11134207_7r98o_lsl2zw52w0jodf_85758ed7d5.webp", "hash": "medium_vn_11134207_7r98o_lsl2zw52w0jodf_85758ed7d5", "mime": "image/webp", "name": "medium_vn-11134207-7r98o-lsl2zw52w0jodf.webp", "path": null, "size": 43.35, "width": 750, "height": 750, "sizeInBytes": 43348}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_vn_11134207_7r98o_lsl2zw52w0jodf_85758ed7d5.webp", "hash": "thumbnail_vn_11134207_7r98o_lsl2zw52w0jodf_85758ed7d5", "mime": "image/webp", "name": "thumbnail_vn-11134207-7r98o-lsl2zw52w0jodf.webp", "path": null, "size": 4.82, "width": 156, "height": 156, "sizeInBytes": 4822}}	vn_11134207_7r98o_lsl2zw52w0jodf_85758ed7d5	.webp	image/webp	73.53	/uploads/vn_11134207_7r98o_lsl2zw52w0jodf_85758ed7d5.webp	\N	local	\N	/	2024-10-22 22:07:02.606	2024-10-22 23:03:45.816	1	1
47	images.jpg	\N	\N	225	225	{"thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_images_a235a300e1.jpg", "hash": "thumbnail_images_a235a300e1", "mime": "image/jpeg", "name": "thumbnail_images.jpg", "path": null, "size": 5.7, "width": 156, "height": 156, "sizeInBytes": 5697}}	images_a235a300e1	.jpg	image/jpeg	8.13	/uploads/images_a235a300e1.jpg	\N	local	\N	/	2024-10-22 23:04:28.322	2024-10-22 23:04:28.322	1	1
49	z5942933662155_fa9bb1dc175da34b325e3e155548e737.jpg	\N	\N	800	1000	{"small": {"ext": ".jpg", "url": "/uploads/small_z5942933662155_fa9bb1dc175da34b325e3e155548e737_d395150e33.jpg", "hash": "small_z5942933662155_fa9bb1dc175da34b325e3e155548e737_d395150e33", "mime": "image/jpeg", "name": "small_z5942933662155_fa9bb1dc175da34b325e3e155548e737.jpg", "path": null, "size": 26.04, "width": 400, "height": 500, "sizeInBytes": 26043}, "medium": {"ext": ".jpg", "url": "/uploads/medium_z5942933662155_fa9bb1dc175da34b325e3e155548e737_d395150e33.jpg", "hash": "medium_z5942933662155_fa9bb1dc175da34b325e3e155548e737_d395150e33", "mime": "image/jpeg", "name": "medium_z5942933662155_fa9bb1dc175da34b325e3e155548e737.jpg", "path": null, "size": 57.01, "width": 600, "height": 750, "sizeInBytes": 57007}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_z5942933662155_fa9bb1dc175da34b325e3e155548e737_d395150e33.jpg", "hash": "thumbnail_z5942933662155_fa9bb1dc175da34b325e3e155548e737_d395150e33", "mime": "image/jpeg", "name": "thumbnail_z5942933662155_fa9bb1dc175da34b325e3e155548e737.jpg", "path": null, "size": 3.75, "width": 125, "height": 156, "sizeInBytes": 3754}}	z5942933662155_fa9bb1dc175da34b325e3e155548e737_d395150e33	.jpg	image/jpeg	88.80	/uploads/z5942933662155_fa9bb1dc175da34b325e3e155548e737_d395150e33.jpg	\N	local	\N	/1	2024-10-24 22:49:46.151	2024-10-24 22:49:46.151	\N	\N
50	la1-15603980086951829863265.jpg	\N	\N	1200	553	{"large": {"ext": ".jpg", "url": "/uploads/large_la1_15603980086951829863265_cc2bf42d52.jpg", "hash": "large_la1_15603980086951829863265_cc2bf42d52", "mime": "image/jpeg", "name": "large_la1-15603980086951829863265.jpg", "path": null, "size": 41.35, "width": 1000, "height": 461, "sizeInBytes": 41351}, "small": {"ext": ".jpg", "url": "/uploads/small_la1_15603980086951829863265_cc2bf42d52.jpg", "hash": "small_la1_15603980086951829863265_cc2bf42d52", "mime": "image/jpeg", "name": "small_la1-15603980086951829863265.jpg", "path": null, "size": 14.26, "width": 500, "height": 230, "sizeInBytes": 14263}, "medium": {"ext": ".jpg", "url": "/uploads/medium_la1_15603980086951829863265_cc2bf42d52.jpg", "hash": "medium_la1_15603980086951829863265_cc2bf42d52", "mime": "image/jpeg", "name": "medium_la1-15603980086951829863265.jpg", "path": null, "size": 26.29, "width": 750, "height": 346, "sizeInBytes": 26288}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_la1_15603980086951829863265_cc2bf42d52.jpg", "hash": "thumbnail_la1_15603980086951829863265_cc2bf42d52", "mime": "image/jpeg", "name": "thumbnail_la1-15603980086951829863265.jpg", "path": null, "size": 5.19, "width": 245, "height": 113, "sizeInBytes": 5193}}	la1_15603980086951829863265_cc2bf42d52	.jpg	image/jpeg	55.41	/uploads/la1_15603980086951829863265_cc2bf42d52.jpg	\N	local	\N	/	2024-10-28 08:58:25.22	2024-10-28 08:58:25.22	1	1
51	image2-17035912738921135997835.webp	\N	\N	760	442	{"small": {"ext": ".webp", "url": "/uploads/small_image2_17035912738921135997835_1bd36e7037.webp", "hash": "small_image2_17035912738921135997835_1bd36e7037", "mime": "image/webp", "name": "small_image2-17035912738921135997835.webp", "path": null, "size": 8.7, "width": 500, "height": 291, "sizeInBytes": 8700}, "medium": {"ext": ".webp", "url": "/uploads/medium_image2_17035912738921135997835_1bd36e7037.webp", "hash": "medium_image2_17035912738921135997835_1bd36e7037", "mime": "image/webp", "name": "medium_image2-17035912738921135997835.webp", "path": null, "size": 14.23, "width": 750, "height": 436, "sizeInBytes": 14228}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_image2_17035912738921135997835_1bd36e7037.webp", "hash": "thumbnail_image2_17035912738921135997835_1bd36e7037", "mime": "image/webp", "name": "thumbnail_image2-17035912738921135997835.webp", "path": null, "size": 3.16, "width": 245, "height": 142, "sizeInBytes": 3158}}	image2_17035912738921135997835_1bd36e7037	.webp	image/webp	19.29	/uploads/image2_17035912738921135997835_1bd36e7037.webp	\N	local	\N	/	2024-10-28 08:59:50.723	2024-10-28 08:59:50.723	1	1
52	20230119_023549_478292_dieu_tri_da_bang_an_max_1800x1800_jpg_f07112b19f.jpg	\N	\N	1280	853	{"large": {"ext": ".jpg", "url": "/uploads/large_20230119_023549_478292_dieu_tri_da_bang_an_max_1800x1800_jpg_f07112b19f_3619aac258.jpg", "hash": "large_20230119_023549_478292_dieu_tri_da_bang_an_max_1800x1800_jpg_f07112b19f_3619aac258", "mime": "image/jpeg", "name": "large_20230119_023549_478292_dieu_tri_da_bang_an_max_1800x1800_jpg_f07112b19f.jpg", "path": null, "size": 51.43, "width": 1000, "height": 666, "sizeInBytes": 51425}, "small": {"ext": ".jpg", "url": "/uploads/small_20230119_023549_478292_dieu_tri_da_bang_an_max_1800x1800_jpg_f07112b19f_3619aac258.jpg", "hash": "small_20230119_023549_478292_dieu_tri_da_bang_an_max_1800x1800_jpg_f07112b19f_3619aac258", "mime": "image/jpeg", "name": "small_20230119_023549_478292_dieu_tri_da_bang_an_max_1800x1800_jpg_f07112b19f.jpg", "path": null, "size": 19.27, "width": 500, "height": 333, "sizeInBytes": 19271}, "medium": {"ext": ".jpg", "url": "/uploads/medium_20230119_023549_478292_dieu_tri_da_bang_an_max_1800x1800_jpg_f07112b19f_3619aac258.jpg", "hash": "medium_20230119_023549_478292_dieu_tri_da_bang_an_max_1800x1800_jpg_f07112b19f_3619aac258", "mime": "image/jpeg", "name": "medium_20230119_023549_478292_dieu_tri_da_bang_an_max_1800x1800_jpg_f07112b19f.jpg", "path": null, "size": 34.19, "width": 750, "height": 500, "sizeInBytes": 34189}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_20230119_023549_478292_dieu_tri_da_bang_an_max_1800x1800_jpg_f07112b19f_3619aac258.jpg", "hash": "thumbnail_20230119_023549_478292_dieu_tri_da_bang_an_max_1800x1800_jpg_f07112b19f_3619aac258", "mime": "image/jpeg", "name": "thumbnail_20230119_023549_478292_dieu_tri_da_bang_an_max_1800x1800_jpg_f07112b19f.jpg", "path": null, "size": 6.86, "width": 234, "height": 156, "sizeInBytes": 6855}}	20230119_023549_478292_dieu_tri_da_bang_an_max_1800x1800_jpg_f07112b19f_3619aac258	.jpg	image/jpeg	68.98	/uploads/20230119_023549_478292_dieu_tri_da_bang_an_max_1800x1800_jpg_f07112b19f_3619aac258.jpg	\N	local	\N	/	2024-10-28 09:01:47.765	2024-10-28 09:01:47.765	1	1
53	microneedling-in-kenya-uai-825x550.webp	\N	\N	825	550	{"small": {"ext": ".webp", "url": "/uploads/small_microneedling_in_kenya_uai_825x550_1e59c93337.webp", "hash": "small_microneedling_in_kenya_uai_825x550_1e59c93337", "mime": "image/webp", "name": "small_microneedling-in-kenya-uai-825x550.webp", "path": null, "size": 10.97, "width": 500, "height": 333, "sizeInBytes": 10974}, "medium": {"ext": ".webp", "url": "/uploads/medium_microneedling_in_kenya_uai_825x550_1e59c93337.webp", "hash": "medium_microneedling_in_kenya_uai_825x550_1e59c93337", "mime": "image/webp", "name": "medium_microneedling-in-kenya-uai-825x550.webp", "path": null, "size": 17.58, "width": 750, "height": 500, "sizeInBytes": 17576}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_microneedling_in_kenya_uai_825x550_1e59c93337.webp", "hash": "thumbnail_microneedling_in_kenya_uai_825x550_1e59c93337", "mime": "image/webp", "name": "thumbnail_microneedling-in-kenya-uai-825x550.webp", "path": null, "size": 4.21, "width": 234, "height": 156, "sizeInBytes": 4208}}	microneedling_in_kenya_uai_825x550_1e59c93337	.webp	image/webp	23.21	/uploads/microneedling_in_kenya_uai_825x550_1e59c93337.webp	\N	local	\N	/	2024-10-28 09:02:46.768	2024-10-28 09:02:46.768	1	1
59	20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113.jpg	\N	\N	700	466	{"small": {"ext": ".jpg", "url": "/uploads/small_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_b66ba99b96.jpg", "hash": "small_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_b66ba99b96", "mime": "image/jpeg", "name": "small_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113.jpg", "path": null, "size": 21.22, "width": 500, "height": 333, "sizeInBytes": 21218}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_b66ba99b96.jpg", "hash": "thumbnail_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_b66ba99b96", "mime": "image/jpeg", "name": "thumbnail_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113.jpg", "path": null, "size": 6.78, "width": 234, "height": 156, "sizeInBytes": 6776}}	20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_b66ba99b96	.jpg	image/jpeg	35.83	/uploads/20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_b66ba99b96.jpg	\N	local	\N	/1	2024-10-29 16:54:55.502	2024-10-29 16:54:55.502	\N	\N
54	Cong-nghe-mesotherapy-va-uu-diem-trong-lam-dep-da.jpg	\N	\N	1200	630	{"large": {"ext": ".jpg", "url": "/uploads/large_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_59bd415346.jpg", "hash": "large_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_59bd415346", "mime": "image/jpeg", "name": "large_Cong-nghe-mesotherapy-va-uu-diem-trong-lam-dep-da.jpg", "path": null, "size": 49.93, "width": 1000, "height": 525, "sizeInBytes": 49934}, "small": {"ext": ".jpg", "url": "/uploads/small_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_59bd415346.jpg", "hash": "small_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_59bd415346", "mime": "image/jpeg", "name": "small_Cong-nghe-mesotherapy-va-uu-diem-trong-lam-dep-da.jpg", "path": null, "size": 17.52, "width": 500, "height": 263, "sizeInBytes": 17516}, "medium": {"ext": ".jpg", "url": "/uploads/medium_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_59bd415346.jpg", "hash": "medium_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_59bd415346", "mime": "image/jpeg", "name": "medium_Cong-nghe-mesotherapy-va-uu-diem-trong-lam-dep-da.jpg", "path": null, "size": 32.78, "width": 750, "height": 394, "sizeInBytes": 32775}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_59bd415346.jpg", "hash": "thumbnail_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_59bd415346", "mime": "image/jpeg", "name": "thumbnail_Cong-nghe-mesotherapy-va-uu-diem-trong-lam-dep-da.jpg", "path": null, "size": 6.4, "width": 245, "height": 129, "sizeInBytes": 6398}}	Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_59bd415346	.jpg	image/jpeg	47.19	/uploads/Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_59bd415346.jpg	\N	local	\N	/	2024-10-28 09:04:23.842	2024-10-28 09:04:23.842	1	1
55	20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113.jpg	\N	\N	700	466	{"small": {"ext": ".jpg", "url": "/uploads/small_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_6cfd0023d5.jpg", "hash": "small_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_6cfd0023d5", "mime": "image/jpeg", "name": "small_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113.jpg", "path": null, "size": 21.22, "width": 500, "height": 333, "sizeInBytes": 21218}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_6cfd0023d5.jpg", "hash": "thumbnail_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_6cfd0023d5", "mime": "image/jpeg", "name": "thumbnail_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113.jpg", "path": null, "size": 6.78, "width": 234, "height": 156, "sizeInBytes": 6776}}	20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_6cfd0023d5	.jpg	image/jpeg	35.83	/uploads/20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_6cfd0023d5.jpg	\N	local	\N	/	2024-10-28 09:06:22.371	2024-10-28 09:06:22.371	1	1
56	Cong-nghe-mesotherapy-va-uu-diem-trong-lam-dep-da.jpg	\N	\N	1200	630	{"large": {"ext": ".jpg", "url": "/uploads/large_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_d1e10978ef.jpg", "hash": "large_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_d1e10978ef", "mime": "image/jpeg", "name": "large_Cong-nghe-mesotherapy-va-uu-diem-trong-lam-dep-da.jpg", "path": null, "size": 49.93, "width": 1000, "height": 525, "sizeInBytes": 49934}, "small": {"ext": ".jpg", "url": "/uploads/small_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_d1e10978ef.jpg", "hash": "small_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_d1e10978ef", "mime": "image/jpeg", "name": "small_Cong-nghe-mesotherapy-va-uu-diem-trong-lam-dep-da.jpg", "path": null, "size": 17.52, "width": 500, "height": 263, "sizeInBytes": 17516}, "medium": {"ext": ".jpg", "url": "/uploads/medium_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_d1e10978ef.jpg", "hash": "medium_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_d1e10978ef", "mime": "image/jpeg", "name": "medium_Cong-nghe-mesotherapy-va-uu-diem-trong-lam-dep-da.jpg", "path": null, "size": 32.78, "width": 750, "height": 394, "sizeInBytes": 32775}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_d1e10978ef.jpg", "hash": "thumbnail_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_d1e10978ef", "mime": "image/jpeg", "name": "thumbnail_Cong-nghe-mesotherapy-va-uu-diem-trong-lam-dep-da.jpg", "path": null, "size": 6.4, "width": 245, "height": 129, "sizeInBytes": 6398}}	Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_d1e10978ef	.jpg	image/jpeg	47.19	/uploads/Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_d1e10978ef.jpg	\N	local	\N	/1	2024-10-29 15:22:55.364	2024-10-29 15:22:55.364	\N	\N
57	microneedling-in-kenya-uai-825x550.webp	\N	\N	825	550	{"small": {"ext": ".webp", "url": "/uploads/small_microneedling_in_kenya_uai_825x550_5d7f799832.webp", "hash": "small_microneedling_in_kenya_uai_825x550_5d7f799832", "mime": "image/webp", "name": "small_microneedling-in-kenya-uai-825x550.webp", "path": null, "size": 10.97, "width": 500, "height": 333, "sizeInBytes": 10974}, "medium": {"ext": ".webp", "url": "/uploads/medium_microneedling_in_kenya_uai_825x550_5d7f799832.webp", "hash": "medium_microneedling_in_kenya_uai_825x550_5d7f799832", "mime": "image/webp", "name": "medium_microneedling-in-kenya-uai-825x550.webp", "path": null, "size": 17.58, "width": 750, "height": 500, "sizeInBytes": 17576}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_microneedling_in_kenya_uai_825x550_5d7f799832.webp", "hash": "thumbnail_microneedling_in_kenya_uai_825x550_5d7f799832", "mime": "image/webp", "name": "thumbnail_microneedling-in-kenya-uai-825x550.webp", "path": null, "size": 4.21, "width": 234, "height": 156, "sizeInBytes": 4208}}	microneedling_in_kenya_uai_825x550_5d7f799832	.webp	image/webp	23.21	/uploads/microneedling_in_kenya_uai_825x550_5d7f799832.webp	\N	local	\N	/1	2024-10-29 16:53:46.301	2024-10-29 16:53:46.301	\N	\N
58	microneedling-in-kenya-uai-825x550.webp	\N	\N	825	550	{"small": {"ext": ".webp", "url": "/uploads/small_microneedling_in_kenya_uai_825x550_dac1aff519.webp", "hash": "small_microneedling_in_kenya_uai_825x550_dac1aff519", "mime": "image/webp", "name": "small_microneedling-in-kenya-uai-825x550.webp", "path": null, "size": 10.97, "width": 500, "height": 333, "sizeInBytes": 10974}, "medium": {"ext": ".webp", "url": "/uploads/medium_microneedling_in_kenya_uai_825x550_dac1aff519.webp", "hash": "medium_microneedling_in_kenya_uai_825x550_dac1aff519", "mime": "image/webp", "name": "medium_microneedling-in-kenya-uai-825x550.webp", "path": null, "size": 17.58, "width": 750, "height": 500, "sizeInBytes": 17576}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_microneedling_in_kenya_uai_825x550_dac1aff519.webp", "hash": "thumbnail_microneedling_in_kenya_uai_825x550_dac1aff519", "mime": "image/webp", "name": "thumbnail_microneedling-in-kenya-uai-825x550.webp", "path": null, "size": 4.21, "width": 234, "height": 156, "sizeInBytes": 4208}}	microneedling_in_kenya_uai_825x550_dac1aff519	.webp	image/webp	23.21	/uploads/microneedling_in_kenya_uai_825x550_dac1aff519.webp	\N	local	\N	/1	2024-10-29 16:54:31.801	2024-10-29 16:54:31.801	\N	\N
61	vouchers-image-1.webp	\N	\N	931	406	{"small": {"ext": ".webp", "url": "/uploads/small_vouchers_image_1_620bf7e11f.webp", "hash": "small_vouchers_image_1_620bf7e11f", "mime": "image/webp", "name": "small_vouchers-image-1.webp", "path": null, "size": 6.17, "width": 500, "height": 218, "sizeInBytes": 6170}, "medium": {"ext": ".webp", "url": "/uploads/medium_vouchers_image_1_620bf7e11f.webp", "hash": "medium_vouchers_image_1_620bf7e11f", "mime": "image/webp", "name": "medium_vouchers-image-1.webp", "path": null, "size": 9.52, "width": 750, "height": 327, "sizeInBytes": 9516}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_vouchers_image_1_620bf7e11f.webp", "hash": "thumbnail_vouchers_image_1_620bf7e11f", "mime": "image/webp", "name": "thumbnail_vouchers-image-1.webp", "path": null, "size": 2.75, "width": 245, "height": 107, "sizeInBytes": 2752}}	vouchers_image_1_620bf7e11f	.webp	image/webp	13.99	/uploads/vouchers_image_1_620bf7e11f.webp	\N	local	\N	/1	2024-10-29 16:56:26.053	2024-10-29 16:56:26.053	\N	\N
62	vouchers-image-1.webp	\N	\N	931	406	{"small": {"ext": ".webp", "url": "/uploads/small_vouchers_image_1_71814f0624.webp", "hash": "small_vouchers_image_1_71814f0624", "mime": "image/webp", "name": "small_vouchers-image-1.webp", "path": null, "size": 6.17, "width": 500, "height": 218, "sizeInBytes": 6170}, "medium": {"ext": ".webp", "url": "/uploads/medium_vouchers_image_1_71814f0624.webp", "hash": "medium_vouchers_image_1_71814f0624", "mime": "image/webp", "name": "medium_vouchers-image-1.webp", "path": null, "size": 9.52, "width": 750, "height": 327, "sizeInBytes": 9516}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_vouchers_image_1_71814f0624.webp", "hash": "thumbnail_vouchers_image_1_71814f0624", "mime": "image/webp", "name": "thumbnail_vouchers-image-1.webp", "path": null, "size": 2.75, "width": 245, "height": 107, "sizeInBytes": 2752}}	vouchers_image_1_71814f0624	.webp	image/webp	13.99	/uploads/vouchers_image_1_71814f0624.webp	\N	local	\N	/1	2024-10-29 16:58:13.712	2024-10-29 16:58:13.712	\N	\N
63	20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113.jpg	\N	\N	700	466	{"small": {"ext": ".jpg", "url": "/uploads/small_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_035c788bcf.jpg", "hash": "small_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_035c788bcf", "mime": "image/jpeg", "name": "small_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113.jpg", "path": null, "size": 21.22, "width": 500, "height": 333, "sizeInBytes": 21218}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_035c788bcf.jpg", "hash": "thumbnail_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_035c788bcf", "mime": "image/jpeg", "name": "thumbnail_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113.jpg", "path": null, "size": 6.78, "width": 234, "height": 156, "sizeInBytes": 6776}}	20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_035c788bcf	.jpg	image/jpeg	35.83	/uploads/20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_035c788bcf.jpg	\N	local	\N	/1	2024-10-29 16:58:34.839	2024-10-29 16:58:34.839	\N	\N
64	2024-L7-CK1-70900543-J6-3.webp	\N	\N	756	1008	{"large": {"ext": ".webp", "url": "/uploads/large_2024_L7_CK_1_70900543_J6_3_94bbc614b4.webp", "hash": "large_2024_L7_CK_1_70900543_J6_3_94bbc614b4", "mime": "image/webp", "name": "large_2024-L7-CK1-70900543-J6-3.webp", "path": null, "size": 9.66, "width": 750, "height": 1000, "sizeInBytes": 9660}, "small": {"ext": ".webp", "url": "/uploads/small_2024_L7_CK_1_70900543_J6_3_94bbc614b4.webp", "hash": "small_2024_L7_CK_1_70900543_J6_3_94bbc614b4", "mime": "image/webp", "name": "small_2024-L7-CK1-70900543-J6-3.webp", "path": null, "size": 3.79, "width": 375, "height": 500, "sizeInBytes": 3786}, "medium": {"ext": ".webp", "url": "/uploads/medium_2024_L7_CK_1_70900543_J6_3_94bbc614b4.webp", "hash": "medium_2024_L7_CK_1_70900543_J6_3_94bbc614b4", "mime": "image/webp", "name": "medium_2024-L7-CK1-70900543-J6-3.webp", "path": null, "size": 6.53, "width": 562, "height": 750, "sizeInBytes": 6532}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_2024_L7_CK_1_70900543_J6_3_94bbc614b4.webp", "hash": "thumbnail_2024_L7_CK_1_70900543_J6_3_94bbc614b4", "mime": "image/webp", "name": "thumbnail_2024-L7-CK1-70900543-J6-3.webp", "path": null, "size": 0.86, "width": 117, "height": 156, "sizeInBytes": 860}}	2024_L7_CK_1_70900543_J6_3_94bbc614b4	.webp	image/webp	11.64	/uploads/2024_L7_CK_1_70900543_J6_3_94bbc614b4.webp	\N	local	\N	/1	2024-10-29 16:59:04.98	2024-10-29 16:59:04.98	\N	\N
65	20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113.jpg	\N	\N	700	466	{"small": {"ext": ".jpg", "url": "/uploads/small_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_04b346e211.jpg", "hash": "small_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_04b346e211", "mime": "image/jpeg", "name": "small_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113.jpg", "path": null, "size": 21.22, "width": 500, "height": 333, "sizeInBytes": 21218}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_04b346e211.jpg", "hash": "thumbnail_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_04b346e211", "mime": "image/jpeg", "name": "thumbnail_20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113.jpg", "path": null, "size": 6.78, "width": 234, "height": 156, "sizeInBytes": 6776}}	20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_04b346e211	.jpg	image/jpeg	35.83	/uploads/20210625_015127_590039_nang_co_mat_bang_so_max_1800x1800_jpg_b54e159113_04b346e211.jpg	\N	local	\N	/1	2024-10-29 17:01:06.07	2024-10-29 17:01:06.07	\N	\N
71	cham-soc-da-chuyen-sau-2.jpg	\N	\N	800	500	{"small": {"ext": ".jpg", "url": "/uploads/small_cham_soc_da_chuyen_sau_2_585bb67ccb.jpg", "hash": "small_cham_soc_da_chuyen_sau_2_585bb67ccb", "mime": "image/jpeg", "name": "small_cham-soc-da-chuyen-sau-2.jpg", "path": null, "size": 327.54, "width": 500, "height": 313, "sizeInBytes": 327539}, "medium": {"ext": ".jpg", "url": "/uploads/medium_cham_soc_da_chuyen_sau_2_585bb67ccb.jpg", "hash": "medium_cham_soc_da_chuyen_sau_2_585bb67ccb", "mime": "image/jpeg", "name": "medium_cham-soc-da-chuyen-sau-2.jpg", "path": null, "size": 695.17, "width": 750, "height": 469, "sizeInBytes": 695165}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_cham_soc_da_chuyen_sau_2_585bb67ccb.jpg", "hash": "thumbnail_cham_soc_da_chuyen_sau_2_585bb67ccb", "mime": "image/jpeg", "name": "thumbnail_cham-soc-da-chuyen-sau-2.jpg", "path": null, "size": 84.03, "width": 245, "height": 153, "sizeInBytes": 84027}}	cham_soc_da_chuyen_sau_2_585bb67ccb	.jpg	image/jpeg	222.50	/uploads/cham_soc_da_chuyen_sau_2_585bb67ccb.jpg	\N	local	\N	/	2024-10-31 08:51:58.5	2024-10-31 08:51:58.5	1	1
66	Cong-nghe-mesotherapy-va-uu-diem-trong-lam-dep-da.jpg	\N	\N	1200	630	{"large": {"ext": ".jpg", "url": "/uploads/large_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_cb47adc089.jpg", "hash": "large_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_cb47adc089", "mime": "image/jpeg", "name": "large_Cong-nghe-mesotherapy-va-uu-diem-trong-lam-dep-da.jpg", "path": null, "size": 49.93, "width": 1000, "height": 525, "sizeInBytes": 49934}, "small": {"ext": ".jpg", "url": "/uploads/small_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_cb47adc089.jpg", "hash": "small_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_cb47adc089", "mime": "image/jpeg", "name": "small_Cong-nghe-mesotherapy-va-uu-diem-trong-lam-dep-da.jpg", "path": null, "size": 17.52, "width": 500, "height": 263, "sizeInBytes": 17516}, "medium": {"ext": ".jpg", "url": "/uploads/medium_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_cb47adc089.jpg", "hash": "medium_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_cb47adc089", "mime": "image/jpeg", "name": "medium_Cong-nghe-mesotherapy-va-uu-diem-trong-lam-dep-da.jpg", "path": null, "size": 32.78, "width": 750, "height": 394, "sizeInBytes": 32775}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_cb47adc089.jpg", "hash": "thumbnail_Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_cb47adc089", "mime": "image/jpeg", "name": "thumbnail_Cong-nghe-mesotherapy-va-uu-diem-trong-lam-dep-da.jpg", "path": null, "size": 6.4, "width": 245, "height": 129, "sizeInBytes": 6398}}	Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_cb47adc089	.jpg	image/jpeg	47.19	/uploads/Cong_nghe_mesotherapy_va_uu_diem_trong_lam_dep_da_cb47adc089.jpg	\N	local	\N	/1	2024-10-29 17:01:35.012	2024-10-29 17:01:35.012	\N	\N
67	vouchers-image-1.webp	\N	\N	931	406	{"small": {"ext": ".webp", "url": "/uploads/small_vouchers_image_1_5fde8721d9.webp", "hash": "small_vouchers_image_1_5fde8721d9", "mime": "image/webp", "name": "small_vouchers-image-1.webp", "path": null, "size": 6.17, "width": 500, "height": 218, "sizeInBytes": 6170}, "medium": {"ext": ".webp", "url": "/uploads/medium_vouchers_image_1_5fde8721d9.webp", "hash": "medium_vouchers_image_1_5fde8721d9", "mime": "image/webp", "name": "medium_vouchers-image-1.webp", "path": null, "size": 9.52, "width": 750, "height": 327, "sizeInBytes": 9516}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_vouchers_image_1_5fde8721d9.webp", "hash": "thumbnail_vouchers_image_1_5fde8721d9", "mime": "image/webp", "name": "thumbnail_vouchers-image-1.webp", "path": null, "size": 2.75, "width": 245, "height": 107, "sizeInBytes": 2752}}	vouchers_image_1_5fde8721d9	.webp	image/webp	13.99	/uploads/vouchers_image_1_5fde8721d9.webp	\N	local	\N	/1	2024-10-29 17:01:44.494	2024-10-29 17:01:44.494	\N	\N
68	microneedling-in-kenya-uai-825x550.webp	\N	\N	825	550	{"small": {"ext": ".webp", "url": "/uploads/small_microneedling_in_kenya_uai_825x550_8905d39d43.webp", "hash": "small_microneedling_in_kenya_uai_825x550_8905d39d43", "mime": "image/webp", "name": "small_microneedling-in-kenya-uai-825x550.webp", "path": null, "size": 10.97, "width": 500, "height": 333, "sizeInBytes": 10974}, "medium": {"ext": ".webp", "url": "/uploads/medium_microneedling_in_kenya_uai_825x550_8905d39d43.webp", "hash": "medium_microneedling_in_kenya_uai_825x550_8905d39d43", "mime": "image/webp", "name": "medium_microneedling-in-kenya-uai-825x550.webp", "path": null, "size": 17.58, "width": 750, "height": 500, "sizeInBytes": 17576}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_microneedling_in_kenya_uai_825x550_8905d39d43.webp", "hash": "thumbnail_microneedling_in_kenya_uai_825x550_8905d39d43", "mime": "image/webp", "name": "thumbnail_microneedling-in-kenya-uai-825x550.webp", "path": null, "size": 4.21, "width": 234, "height": 156, "sizeInBytes": 4208}}	microneedling_in_kenya_uai_825x550_8905d39d43	.webp	image/webp	23.21	/uploads/microneedling_in_kenya_uai_825x550_8905d39d43.webp	\N	local	\N	/1	2024-10-29 17:30:14.312	2024-10-29 17:30:14.312	\N	\N
69	vn-11134207-7r98o-lsaw5h2mj2dg10.webp	\N	\N	1024	1024	{"large": {"ext": ".webp", "url": "/uploads/large_vn_11134207_7r98o_lsaw5h2mj2dg10_49e46d7e53.webp", "hash": "large_vn_11134207_7r98o_lsaw5h2mj2dg10_49e46d7e53", "mime": "image/webp", "name": "large_vn-11134207-7r98o-lsaw5h2mj2dg10.webp", "path": null, "size": 40.61, "width": 1000, "height": 1000, "sizeInBytes": 40614}, "small": {"ext": ".webp", "url": "/uploads/small_vn_11134207_7r98o_lsaw5h2mj2dg10_49e46d7e53.webp", "hash": "small_vn_11134207_7r98o_lsaw5h2mj2dg10_49e46d7e53", "mime": "image/webp", "name": "small_vn-11134207-7r98o-lsaw5h2mj2dg10.webp", "path": null, "size": 16.83, "width": 500, "height": 500, "sizeInBytes": 16830}, "medium": {"ext": ".webp", "url": "/uploads/medium_vn_11134207_7r98o_lsaw5h2mj2dg10_49e46d7e53.webp", "hash": "medium_vn_11134207_7r98o_lsaw5h2mj2dg10_49e46d7e53", "mime": "image/webp", "name": "medium_vn-11134207-7r98o-lsaw5h2mj2dg10.webp", "path": null, "size": 28.67, "width": 750, "height": 750, "sizeInBytes": 28670}, "thumbnail": {"ext": ".webp", "url": "/uploads/thumbnail_vn_11134207_7r98o_lsaw5h2mj2dg10_49e46d7e53.webp", "hash": "thumbnail_vn_11134207_7r98o_lsaw5h2mj2dg10_49e46d7e53", "mime": "image/webp", "name": "thumbnail_vn-11134207-7r98o-lsaw5h2mj2dg10.webp", "path": null, "size": 3.32, "width": 156, "height": 156, "sizeInBytes": 3324}}	vn_11134207_7r98o_lsaw5h2mj2dg10_49e46d7e53	.webp	image/webp	50.61	/uploads/vn_11134207_7r98o_lsaw5h2mj2dg10_49e46d7e53.webp	\N	local	\N	/1	2024-10-29 17:30:23.388	2024-10-29 17:30:23.388	\N	\N
70	banner_2.jpg	\N	\N	1024	300	{"large": {"ext": ".jpg", "url": "/uploads/large_banner_2_62be7631ab.jpg", "hash": "large_banner_2_62be7631ab", "mime": "image/jpeg", "name": "large_banner_2.jpg", "path": null, "size": 25.91, "width": 1000, "height": 293, "sizeInBytes": 25912}, "small": {"ext": ".jpg", "url": "/uploads/small_banner_2_62be7631ab.jpg", "hash": "small_banner_2_62be7631ab", "mime": "image/jpeg", "name": "small_banner_2.jpg", "path": null, "size": 9.39, "width": 500, "height": 146, "sizeInBytes": 9394}, "medium": {"ext": ".jpg", "url": "/uploads/medium_banner_2_62be7631ab.jpg", "hash": "medium_banner_2_62be7631ab", "mime": "image/jpeg", "name": "medium_banner_2.jpg", "path": null, "size": 16.61, "width": 750, "height": 220, "sizeInBytes": 16607}, "thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_banner_2_62be7631ab.jpg", "hash": "thumbnail_banner_2_62be7631ab", "mime": "image/jpeg", "name": "thumbnail_banner_2.jpg", "path": null, "size": 3.34, "width": 245, "height": 72, "sizeInBytes": 3335}}	banner_2_62be7631ab	.jpg	image/jpeg	26.58	/uploads/banner_2_62be7631ab.jpg	\N	local	\N	/1	2024-10-29 17:30:44.371	2024-10-29 17:30:44.371	\N	\N
72	images (1).jpg	\N	\N	292	173	{"thumbnail": {"ext": ".jpg", "url": "/uploads/thumbnail_images_1_640968f049.jpg", "hash": "thumbnail_images_1_640968f049", "mime": "image/jpeg", "name": "thumbnail_images (1).jpg", "path": null, "size": 5.07, "width": 245, "height": 145, "sizeInBytes": 5074}}	images_1_640968f049	.jpg	image/jpeg	5.26	/uploads/images_1_640968f049.jpg	\N	local	\N	/	2024-10-31 08:53:19.42	2024-10-31 08:53:19.42	1	1
\.


--
-- Data for Name: files_folder_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.files_folder_links (id, file_id, folder_id, file_order) FROM stdin;
1	49	1	1
2	56	1	2
3	57	1	3
4	58	1	4
5	59	1	5
6	60	1	6
7	61	1	7
8	62	1	8
9	63	1	9
10	64	1	10
11	65	1	11
12	66	1	12
13	67	1	13
14	68	1	14
15	69	1	15
16	70	1	16
\.


--
-- Data for Name: files_related_morphs; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.files_related_morphs (id, file_id, related_id, related_type, field, "order") FROM stdin;
1	1	1	api::category.category	banner	1
2	2	2	api::category.category	banner	1
3	3	3	api::category.category	banner	1
4	4	4	api::category.category	banner	1
5	5	5	api::category.category	banner	1
6	6	6	api::category.category	banner	1
7	7	7	api::category.category	banner	1
108	43	2	api::service.service	banner	1
109	42	1	api::service.service	banner	1
110	44	3	api::service.service	banner	1
111	45	4	api::service.service	banner	1
112	46	5	api::service.service	banner	1
114	42	7	api::service.service	banner	1
18	17	8	api::category.category	banner	1
186	43	8	api::service.service	banner	1
187	47	6	api::service.service	banner	1
188	50	9	api::service.service	banner	1
189	51	10	api::service.service	banner	1
191	53	12	api::service.service	banner	1
192	54	13	api::service.service	banner	1
28	32	9	api::category.category	banner	1
194	55	14	api::service.service	banner	1
31	34	10	api::category.category	banner	1
195	52	11	api::service.service	banner	1
211	59	15	api::service.service	banner	1
212	71	16	api::service.service	banner	1
213	72	17	api::service.service	banner	1
214	74	18	api::service.service	banner	1
215	34	6	api::product.product	gallery	1
216	32	6	api::product.product	gallery	2
217	31	6	api::product.product	gallery	3
218	63	6	api::product.product	avatar	1
219	41	5	api::product.product	gallery	1
220	36	5	api::product.product	gallery	2
221	40	5	api::product.product	gallery	3
222	39	5	api::product.product	gallery	4
223	37	5	api::product.product	gallery	5
224	35	5	api::product.product	gallery	6
225	38	5	api::product.product	gallery	7
226	41	5	api::product.product	avatar	1
227	25	4	api::product.product	gallery	1
228	26	4	api::product.product	gallery	2
229	27	4	api::product.product	gallery	3
230	28	4	api::product.product	gallery	4
231	18	4	api::product.product	gallery	5
232	19	4	api::product.product	gallery	6
233	21	4	api::product.product	gallery	7
234	20	4	api::product.product	gallery	8
235	31	4	api::product.product	avatar	1
236	31	3	api::product.product	gallery	1
237	32	3	api::product.product	gallery	2
238	34	3	api::product.product	avatar	1
239	16	2	api::product.product	gallery	1
240	15	2	api::product.product	gallery	2
241	16	2	api::product.product	avatar	1
242	8	1	api::product.product	gallery	1
243	13	1	api::product.product	gallery	2
244	9	1	api::product.product	gallery	3
245	12	1	api::product.product	gallery	4
246	11	1	api::product.product	gallery	5
247	10	1	api::product.product	gallery	6
248	13	1	api::product.product	avatar	1
250	48	6	api::voucher.voucher	image	1
\.


--
-- Data for Name: i18n_locale; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.i18n_locale (id, name, code, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	English (en)	en	2024-10-19 19:44:08.139	2024-10-19 19:44:08.139	\N	\N
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.messages (id, content, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: messages_room_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.messages_room_links (id, message_id, room_id) FROM stdin;
\.


--
-- Data for Name: messages_sender_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.messages_sender_links (id, message_id, user_id) FROM stdin;
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.order_details (id, unit_price, quantity, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
20	120000	1	2024-10-29 10:27:54.482	2024-10-29 10:27:54.482	\N	\N
21	475000	1	2024-10-29 11:36:21.5	2024-10-29 11:36:21.5	\N	\N
22	170000	1	2024-10-29 22:21:50.184	2024-10-29 22:21:50.184	\N	\N
23	1010000	1	2024-10-30 16:52:24.934	2024-10-30 16:52:24.934	\N	\N
24	150000	1	2024-10-30 16:53:04.285	2024-10-30 16:53:04.285	\N	\N
25	1010000	1	2024-10-30 16:53:37.493	2024-10-30 16:53:37.493	\N	\N
26	1590000	1	2024-10-30 16:54:40.461	2024-10-30 16:54:40.461	\N	\N
\.


--
-- Data for Name: order_details_order_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.order_details_order_links (id, order_detail_id, order_id, order_detail_order) FROM stdin;
19	20	10	1
20	21	11	1
21	22	12	1
22	23	13	1
23	24	14	1
24	25	15	1
25	26	16	1
\.


--
-- Data for Name: order_details_product_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.order_details_product_links (id, order_detail_id, product_id) FROM stdin;
20	20	6
21	21	1
22	22	3
23	23	4
24	24	6
25	25	4
26	26	2
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.orders (id, customer_email, customer_full_name, customer_phone, shipping_address, shipping_method, payment_method, total, status, transport_fee, order_code, created_at, updated_at, created_by_id, updated_by_id, reason) FROM stdin;
10	hautrinh@gmail.com	Trß╗ïnh V─ân Hß║¡u	0981234567	123/4 ─É╞░ß╗¥ng sß╗æ 1, X├ú Minh Thß║ính, Huyß╗çn Dß║ºu Tiß║┐ng, Tß╗ënh B├¼nh D╞░╞íng	Giao qua ─æß╗æi t├íc	COD	140000	Chß╗¥ x├íc nhß║¡n	35000	ANZF252028	2024-10-29 10:27:54.538	2024-10-29 10:27:54.538	\N	\N	
11	hautrinh@gmail.com	Trß╗ïnh V─ân Hß║¡u	0981234567	123/4 ─É╞░ß╗¥ng sß╗æ 1, X├ú Minh Thß║ính, Huyß╗çn Dß║ºu Tiß║┐ng, Tß╗ënh B├¼nh D╞░╞íng	Giao qua ─æß╗æi t├íc	COD	510000	X├íc nhß║¡n	35000	PRHK612876	2024-10-29 11:36:21.565	2024-10-29 14:10:58.901	\N	\N	
12	devtest2@gmail.com	devtest2@gmail.com	0981234567	13123, X├ú M├í L├⌐, Huyß╗çn ─Éß╗ông V─ân, Tß╗ënh H├á Giang	Giao qua ─æß╗æi t├íc	COD	175000	Chß╗¥ x├íc nhß║¡n	35000	UVPU197011	2024-10-29 22:21:50.25	2024-10-29 22:21:50.25	\N	\N	
13	hautrinh@gmail.com	Trß╗ïnh V─ân Hß║¡u	0981234567	123/4 ─É╞░ß╗¥ng sß╗æ 1, X├ú Minh Thß║ính, Huyß╗çn Dß║ºu Tiß║┐ng, Tß╗ënh B├¼nh D╞░╞íng	Giao qua ─æß╗æi t├íc	COD	1045000	Chß╗¥ x├íc nhß║¡n	35000	SIJB095441	2024-10-30 16:52:24.988	2024-10-30 16:52:24.988	\N	\N	
14	hautrinh@gmail.com	Trß╗ïnh V─ân Hß║¡u	0981234567	123/4 ─É╞░ß╗¥ng sß╗æ 1, X├ú Minh Thß║ính, Huyß╗çn Dß║ºu Tiß║┐ng, Tß╗ënh B├¼nh D╞░╞íng	Giao qua ─æß╗æi t├íc	COD	185000	Chß╗¥ x├íc nhß║¡n	35000	RMAB908933	2024-10-30 16:53:04.331	2024-10-30 16:53:04.331	\N	\N	
15	hautrinh@gmail.com	Trß╗ïnh V─ân Hß║¡u	0981234567	123/4 ─É╞░ß╗¥ng sß╗æ 1, X├ú Minh Thß║ính, Huyß╗çn Dß║ºu Tiß║┐ng, Tß╗ënh B├¼nh D╞░╞íng	Giao qua ─æß╗æi t├íc	COD	1045000	Chß╗¥ x├íc nhß║¡n	35000	GUUV768307	2024-10-30 16:53:37.542	2024-10-30 16:53:37.542	\N	\N	
16	hautrinh@gmail.com	Trß╗ïnh V─ân Hß║¡u	0981234567	123/4 ─É╞░ß╗¥ng sß╗æ 1, X├ú Minh Thß║ính, Huyß╗çn Dß║ºu Tiß║┐ng, Tß╗ënh B├¼nh D╞░╞íng	Giao qua ─æß╗æi t├íc	COD	1610000	Chß╗¥ x├íc nhß║¡n	35000	KHXH220760	2024-10-30 16:54:40.505	2024-10-30 16:54:40.505	\N	\N	
\.


--
-- Data for Name: orders_user_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.orders_user_links (id, order_id, user_id) FROM stdin;
10	10	1
11	11	1
12	12	3
13	13	1
14	14	1
15	15	1
16	16	1
\.


--
-- Data for Name: orders_voucher_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.orders_voucher_links (id, order_id, voucher_id) FROM stdin;
6	10	1
7	12	2
8	16	1
\.


--
-- Data for Name: product_lines; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.product_lines (id, name, slug, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
5	Sß╗»a rß╗¡a mß║╖t (Cleanser)	sua-rua-mat-cleanser	2024-10-31 09:02:45.599	2024-10-31 09:02:45.599	1	1
6	N╞░ß╗¢c hoa hß╗ông (Toner)	nuoc-hoa-hong-toner	2024-10-31 09:02:59.722	2024-10-31 09:02:59.722	1	1
7	Tinh chß║Ñt (Essence)	tinh-chat-essence	2024-10-31 09:03:09.828	2024-10-31 09:03:09.828	1	1
8	Serum	serum	2024-10-31 09:03:22.142	2024-10-31 09:03:22.142	1	1
9	Kem chß╗æng nß║»ng (Sunscreen)	kem-chong-nang-sunscreen	2024-10-31 09:04:31.99	2024-10-31 09:04:31.99	\N	\N
10	Mß║╖t nß║í (Mask)	mat-na-mask	2024-10-31 09:04:48.096	2024-10-31 09:04:48.096	\N	\N
11	Dß║ºu d╞░ß╗íng (Facial Oil)	dau-duong-facial-oil	2024-10-31 09:04:57.289	2024-10-31 09:04:57.289	\N	\N
12	Tß║⌐y tß║┐ b├áo chß║┐t (Exfoliator)	tay-te-bao-chet-exfoliator	2024-10-31 09:05:10.694	2024-10-31 09:05:10.694	\N	\N
13	Kem mß║»t (Eye Cream)	kem-mat-eye-cream	2024-10-31 09:05:18.178	2024-10-31 09:05:18.178	\N	\N
14	Xß╗ït kho├íng (Face Mist)	xit-khoang-face-mist	2024-10-31 09:05:25.585	2024-10-31 09:05:25.585	\N	\N
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.products (id, name, slug, price, sale_price, total_purchase, created_at, updated_at, created_by_id, updated_by_id, description, quan, quantity) FROM stdin;
6	Bß╗Ö 2 Serum d╞░ß╗íng s├íng da ─æa tß║ºng ng├áy & ─æ├¬m Pond's Bright Miracle mß╗¥ th├óm sß║ím vß╗¢i 50X Niasorcinol 30G+30G	bo-2-serum-duong-sang-da-da-tang-ngay-and-dem-pond-s-bright-miracle-mo-tham-sam-voi-50-x-niasorcinol-30-g-30-g	150000	150000	59	2024-10-22 22:07:13.626	2024-10-31 09:13:53.836	1	1	\N	\N	100
4	Sß╗»a rß╗¡a mß║╖t Simple gi├║p kiß╗üm dß║ºu v├á ngß╗½a mß╗Ñn hiß╗çu quß║ú - cho da dß║ºu mß╗Ñn 150ml [CH├ìNH H├âNG ─Éß╗ÿC QUYß╗ÇN] [DIß╗åN Mß║áO Mß╗ÜI]	sua-rua-mat-simple-giup-kiem-dau-va-ngua-mun-hieu-qua-cho-da-dau-mun-150ml-chinh-hang-doc-quyen-dien-mao-moi	1320000	1320000	60	2024-10-22 22:01:51.227	2024-10-31 09:14:34.068	1	1	\N	\N	5
3	[H├ÇNG Mß╗ÜI Vß╗Ç] Kem ß╗º Dove Phß╗Ñc hß╗ôi h╞░ tß╗òn Hya + Ceramide / Ng─ân g├úy rß╗Ñng t├│c Hya + Biotin 300ML	hang-moi-ve-kem-u-dove-phuc-hoi-hu-ton-hya-ceramide-ngan-gay-rung-toc-hya-biotin-300-ml	200000	200000	100	2024-10-22 21:56:40.024	2024-10-31 09:15:08.85	1	1	\N	\N	100
2	Tinh Chß║Ñt Phß╗Ñc Hß╗ôi Da Ban ─É├¬m Est├⌐e Lauder Advanced Night Repair 50ml	tinh-chat-phuc-hoi-da-ban-dem-estee-lauder-advanced-night-repair-50ml	2600000	2600000	40	2024-10-22 21:55:12.184	2024-10-31 09:15:44.873	1	1	\N	\N	\N
1	Kem xua muß╗ùi Remos Baby Cream h╞░╞íng khuynh diß╗çp suß╗æt 6 giß╗¥ cho b├⌐ tß╗½ 6 th├íng tuß╗òi (70g)	kem-xua-muoi-remos-baby-cream-huong-khuynh-diep-suot-6-gio-cho-be-tu-6-thang-tuoi-70g	475000	475000	5	2024-10-22 21:49:17.48	2024-10-31 09:15:59.756	1	1	\N	\N	\N
5	Kem D╞░ß╗íng Hß╗ù Trß╗ú L├ám Dß╗ïu V├á Phß╗Ñc Hß╗ôi Da La Roche-Posay Cicap Last Braume B5 100ml	kem-duong-ho-tro-lam-diu-va-phuc-hoi-da-la-roche-posay-cicap-last-braume-b5-100ml	780000	780000	11	2024-10-22 22:04:44.822	2024-10-31 09:14:12.062	1	1	\N	\N	100
\.


--
-- Data for Name: products_categories_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.products_categories_links (id, product_id, category_id, category_order, product_order) FROM stdin;
6	6	10	1	1
5	5	9	1	1
4	4	8	1	1
3	3	1	1	1
2	2	2	1	1
1	1	7	1	1
\.


--
-- Data for Name: products_product_line_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.products_product_line_links (id, product_id, product_line_id, product_order) FROM stdin;
11	6	14	1
12	5	8	1
13	4	11	1
14	3	11	2
15	2	13	1
16	1	11	3
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.rooms (id, room_id, seen_status, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: rooms_user_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.rooms_user_links (id, room_id, user_id) FROM stdin;
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.services (id, title, short_description, price, slug, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
5	Th╞░ gi├ún tß║┐ b├áo	Th╞░ gian tß║┐ b├áo	400000	thu-gian-te-bao	2024-10-22 23:02:33.24	2024-10-22 23:02:33.24	1	1
9	─Éiß╗üu trß╗ï laser	─Éiß╗üu trß╗ï laser: 1.000.000 - 10.000.000 VN─É/lß║ºn, t├╣y thuß╗Öc v├áo c├┤ng nghß╗ç laser v├á diß╗çn t├¡ch v├╣ng ─æiß╗üu trß╗ï. C├íc liß╗çu tr├¼nh ─æiß╗üu trß╗ï sß║╣o mß╗Ñn hoß║╖c t├án nhang th╞░ß╗¥ng y├¬u cß║ºu nhiß╗üu lß║ºn ─æß╗â ─æß║ít hiß╗çu quß║ú tß╗æi ╞░u.	10000000	dieu-tri-laser	2024-10-28 08:58:49.256	2024-10-28 08:58:54.511	1	1
10	Peel da h├│a hß╗ìc	Peel da h├│a hß╗ìc: 500.000 - 3.000.000 VN─É/lß║ºn. Gi├í cß║ú phß╗Ñ thuß╗Öc v├áo loß║íi h├│a chß║Ñt ─æ╞░ß╗úc sß╗¡ dß╗Ñng (nh╞░ AHA, BHA, TCA) v├á ─æß╗Ö s├óu cß╗ºa qu├í tr├¼nh peel. Liß╗çu tr├¼nh n├áy c├│ thß╗â cß║ºn lß║╖p lß║íi sau v├ái tuß║ºn ─æß╗â duy tr├¼ kß║┐t quß║ú.	300000	peel-da-hoa-hoc	2024-10-28 09:00:20.884	2024-10-28 09:00:20.884	1	1
12	─Éiß╗üu trß╗ï ├ính s├íng IPL	Microneedling: 2.000.000 - 5.000.000 VN─É/lß║ºn. ─Éß╗æi vß╗¢i c├íc vß║Ñn ─æß╗ü nh╞░ sß║╣o mß╗Ñn, c├│ thß╗â cß║ºn nhiß╗üu lß║ºn ─æiß╗üu trß╗ï. Kß║┐t hß╗úp c├╣ng d╞░ß╗íng chß║Ñt sau mß╗ùi lß║ºn c├│ thß╗â t─âng chi ph├¡.	5000000	dieu-tri-anh-sang-ipl	2024-10-28 09:03:05.713	2024-10-28 09:03:05.713	1	1
13	Mesotherapy	3.000.000 - 8.000.000 VN─É/lß║ºn, t├╣y v├áo c├íc d╞░ß╗íng chß║Ñt ─æ╞░ß╗úc sß╗¡ dß╗Ñng (chß║│ng hß║ín, axit hyaluronic hoß║╖c c├íc loß║íi vitamin) v├á sß╗æ l╞░ß╗úng v├╣ng ─æiß╗üu trß╗ï.	800000	mesotherapy	2024-10-28 09:04:43.437	2024-10-28 09:04:43.437	1	1
15	RF (Radio Frequency) - s├│ng cao tß║ºn	RF (Radio Frequency) - s├│ng cao tß║ºn: 1.000.000 - 7.000.000 VN─É/lß║ºn, t	1200000	rf-radio-frequency-song-cao-tan-1-000-000-7-000-000-vnd-lan-t	2024-10-29 15:22:55.449	2024-10-31 08:47:31.901	\N	1
11	─Éiß╗üu trß╗ï ├ính s├íng IPL ─Éiß╗üu trß╗ï ├ính s├íng IPL ─Éiß╗üu trß╗ï ├ính s├íng IPL	─Éiß╗üu trß╗ï ├ính s├íng IPL (Intense Pulsed Light): 1.500.000 - 8.000.000 VN─É/lß║ºn. Ph╞░╞íng ph├íp n├áy c├│ gi├í phß╗Ñ thuß╗Öc v├áo loß║íi m├íy IPL v├á t├¼nh trß║íng da cß║ºn ─æiß╗üu trß╗ï. Th╞░ß╗¥ng cß║ºn 3-6 lß║ºn cho hiß╗çu quß║ú tß╗æt nhß║Ñt	8000000	dieu-tri-anh-sang-ipl	2024-10-28 09:01:51.193	2024-10-29 10:50:17.872	1	1
16	L├ám sß║ích da chuy├¬n s├óu	Loß║íi bß╗Å bß╗Ñi bß║⌐n, dß║ºu thß╗½a v├á lß╗¢p trang ─æiß╗âm s├óu trong lß╗ù ch├ón l├┤ng, gi├║p da th├┤ng tho├íng, giß║úm mß╗Ñn.	500000	lam-sach-da-chuyen-sau	2024-10-31 08:52:17.739	2024-10-31 08:52:17.739	1	1
14	RF-1	RF (Radio Frequency) - s├│ng cao tß║ºn: 1.000.000 - 7.000.000 VN─É/lß║ºn, t├╣y v├áo c├┤ng nghß╗ç RF v├á v├╣ng da cß║ºn ─æiß╗üu trß╗ï. Liß╗çu tr├¼nh th╞░ß╗¥ng tß╗½ 3-5 lß║ºn ─æß╗â ─æß║ít ─æ╞░ß╗úc hiß╗çu quß║ú s─ân chß║»c da.\n\nRF (Radio Frequency) - s├│ng cao tß║ºn: 1.000.000 - 7.000.000 VN─É/lß║ºn, t├╣y v├áo c├┤ng nghß╗ç RF v├á v├╣ng da cß║ºn ─æiß╗üu trß╗ï. Liß╗çu tr├¼nh th╞░ß╗¥ng tß╗½ 3-5 lß║ºn ─æß╗â ─æß║ít ─æ╞░ß╗úc hiß╗çu quß║ú s─ân chß║»c da.	700000	rf	2024-10-28 09:06:38.409	2024-10-29 15:22:34.725	1	1
17	X├┤ng h╞íi v├á tß║⌐y tß║┐ b├áo chß║┐t	Gi├║p mß╗ƒ lß╗ù ch├ón l├┤ng v├á loß║íi bß╗Å tß║┐ b├áo chß║┐t, k├¡ch th├¡ch t├íi tß║ío da mß╗¢i v├á l├ám da s├íng mß╗ïn.	480000	xong-hoi-va-tay-te-bao-chet	2024-10-31 08:53:36.763	2024-10-31 08:53:36.763	1	1
18	─Éß║»p mß║╖t nß║í d╞░ß╗íng da	Cung cß║Ñp ─æß╗Ö ß║⌐m v├á d╞░ß╗íng chß║Ñt, t├╣y theo loß║íi da m├á c├│ thß╗â chß╗ìn mß║╖t nß║í d╞░ß╗íng ß║⌐m, l├ám trß║»ng, trß╗ï mß╗Ñn, hay l├ám dß╗ïu da.	350000	dap-mat-na-duong-da	2024-10-31 08:59:59.536	2024-10-31 09:18:09.24	1	1
\.


--
-- Data for Name: skin_properties; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.skin_properties (id, name, slug, created_at, updated_at, published_at, created_by_id, updated_by_id) FROM stdin;
5	─Éß╗Ö ß║⌐m	do-am	2024-10-31 09:12:25.241	2024-10-31 09:12:25.241	2024-10-31 09:12:25.238	\N	\N
6	─Éß╗Ö ─æ├án hß╗ôi	do-dan-hoi	2024-10-31 09:12:34.224	2024-10-31 09:12:34.224	2024-10-31 09:12:34.221	\N	\N
7	M├áu sß║»c	mau-sac	2024-10-31 09:12:42.433	2024-10-31 09:12:42.433	2024-10-31 09:12:42.429	\N	\N
8	Kß║┐t cß║Ñu	ket-cau	2024-10-31 09:12:50.867	2024-10-31 09:12:50.867	2024-10-31 09:12:50.863	\N	\N
9	Sß╗▒ tiß║┐t dß║ºu	su-tiet-dau	2024-10-31 09:12:58.227	2024-10-31 09:12:58.227	2024-10-31 09:12:58.221	\N	\N
10	─Éß╗Ö nhß║íy cß║úm	do-nhay-cam	2024-10-31 09:13:05.579	2024-10-31 09:13:05.579	2024-10-31 09:13:05.575	\N	\N
11	Lß╗ù ch├ón l├┤ng	lo-chan-long	2024-10-31 09:13:14.931	2024-10-31 09:13:14.931	2024-10-31 09:13:14.928	\N	\N
\.


--
-- Data for Name: skin_properties_products_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.skin_properties_products_links (id, skin_property_id, product_id, product_order, skin_property_order) FROM stdin;
12	11	6	1	1
13	10	6	1	2
14	9	6	1	3
15	8	6	1	4
16	9	5	2	1
17	8	5	2	2
18	6	4	1	1
19	5	4	1	2
20	7	4	1	3
21	11	3	2	1
22	10	3	2	2
23	10	2	3	1
24	9	2	3	2
25	11	1	3	1
26	9	1	4	2
27	7	1	2	3
28	6	1	2	4
29	5	1	2	5
\.


--
-- Data for Name: slugs; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.slugs (id, slug, count, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.strapi_api_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_api_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.strapi_api_token_permissions_token_links (id, api_token_permission_id, api_token_id, api_token_permission_order) FROM stdin;
\.


--
-- Data for Name: strapi_api_tokens; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.strapi_api_tokens (id, name, description, type, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_core_store_settings; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.strapi_core_store_settings (id, key, value, type, environment, tag) FROM stdin;
2	plugin_content_manager_configuration_content_types::admin::permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"actionParameters":{"edit":{"label":"actionParameters","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"actionParameters","searchable":false,"sortable":false}},"subject":{"edit":{"label":"subject","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"subject","searchable":true,"sortable":true}},"properties":{"edit":{"label":"properties","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"properties","searchable":false,"sortable":false}},"conditions":{"edit":{"label":"conditions","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"conditions","searchable":false,"sortable":false}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","subject","role"],"edit":[[{"name":"action","size":6}],[{"name":"actionParameters","size":12}],[{"name":"subject","size":6}],[{"name":"properties","size":12}],[{"name":"conditions","size":12}],[{"name":"role","size":6}]]},"uid":"admin::permission"}	object	\N	\N
3	plugin_content_manager_configuration_content_types::admin::user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"firstname","defaultSortBy":"firstname","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"firstname":{"edit":{"label":"firstname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"firstname","searchable":true,"sortable":true}},"lastname":{"edit":{"label":"lastname","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastname","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"registrationToken":{"edit":{"label":"registrationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"registrationToken","searchable":true,"sortable":true}},"isActive":{"edit":{"label":"isActive","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isActive","searchable":true,"sortable":true}},"roles":{"edit":{"label":"roles","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"roles","searchable":false,"sortable":false}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"preferedLanguage":{"edit":{"label":"preferedLanguage","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"preferedLanguage","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","firstname","lastname","username"],"edit":[[{"name":"firstname","size":6},{"name":"lastname","size":6}],[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"isActive","size":4}],[{"name":"roles","size":6},{"name":"blocked","size":4}],[{"name":"preferedLanguage","size":6}]]},"uid":"admin::user"}	object	\N	\N
4	plugin_content_manager_configuration_content_types::admin::role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"firstname"},"list":{"label":"users","searchable":false,"sortable":false}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","description"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}],[{"name":"description","size":6},{"name":"users","size":6}],[{"name":"permissions","size":6}]]},"uid":"admin::role"}	object	\N	\N
5	plugin_content_manager_configuration_content_types::admin::api-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"accessKey","size":6}],[{"name":"lastUsedAt","size":6},{"name":"permissions","size":6}],[{"name":"expiresAt","size":6},{"name":"lifespan","size":4}]]},"uid":"admin::api-token"}	object	\N	\N
6	plugin_content_manager_configuration_content_types::admin::api-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::api-token-permission"}	object	\N	\N
7	plugin_content_manager_configuration_content_types::admin::transfer-token	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"accessKey":{"edit":{"label":"accessKey","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"accessKey","searchable":true,"sortable":true}},"lastUsedAt":{"edit":{"label":"lastUsedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lastUsedAt","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"expiresAt":{"edit":{"label":"expiresAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"expiresAt","searchable":true,"sortable":true}},"lifespan":{"edit":{"label":"lifespan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"lifespan","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","accessKey"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"accessKey","size":6},{"name":"lastUsedAt","size":6}],[{"name":"permissions","size":6},{"name":"expiresAt","size":6}],[{"name":"lifespan","size":4}]]},"uid":"admin::transfer-token"}	object	\N	\N
8	plugin_content_manager_configuration_content_types::admin::transfer-token-permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"token":{"edit":{"label":"token","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"token","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","token","createdAt"],"edit":[[{"name":"action","size":6},{"name":"token","size":6}]]},"uid":"admin::transfer-token-permission"}	object	\N	\N
9	plugin_content_manager_configuration_content_types::plugin::upload.file	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"alternativeText":{"edit":{"label":"alternativeText","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"alternativeText","searchable":true,"sortable":true}},"caption":{"edit":{"label":"caption","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"caption","searchable":true,"sortable":true}},"width":{"edit":{"label":"width","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"width","searchable":true,"sortable":true}},"height":{"edit":{"label":"height","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"height","searchable":true,"sortable":true}},"formats":{"edit":{"label":"formats","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"formats","searchable":false,"sortable":false}},"hash":{"edit":{"label":"hash","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"hash","searchable":true,"sortable":true}},"ext":{"edit":{"label":"ext","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"ext","searchable":true,"sortable":true}},"mime":{"edit":{"label":"mime","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"mime","searchable":true,"sortable":true}},"size":{"edit":{"label":"size","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"size","searchable":true,"sortable":true}},"url":{"edit":{"label":"url","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"url","searchable":true,"sortable":true}},"previewUrl":{"edit":{"label":"previewUrl","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"previewUrl","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"provider_metadata":{"edit":{"label":"provider_metadata","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"provider_metadata","searchable":false,"sortable":false}},"folder":{"edit":{"label":"folder","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"folder","searchable":true,"sortable":true}},"folderPath":{"edit":{"label":"folderPath","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"folderPath","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","alternativeText","caption"],"edit":[[{"name":"name","size":6},{"name":"alternativeText","size":6}],[{"name":"caption","size":6},{"name":"width","size":4}],[{"name":"height","size":4}],[{"name":"formats","size":12}],[{"name":"hash","size":6},{"name":"ext","size":6}],[{"name":"mime","size":6},{"name":"size","size":4}],[{"name":"url","size":6},{"name":"previewUrl","size":6}],[{"name":"provider","size":6}],[{"name":"provider_metadata","size":12}],[{"name":"folder","size":6},{"name":"folderPath","size":6}]]},"uid":"plugin::upload.file"}	object	\N	\N
1	strapi_content_types_schema	{"admin::permission":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_permissions","info":{"name":"Permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"actionParameters":{"type":"json","configurable":false,"required":false,"default":{}},"subject":{"type":"string","minLength":1,"configurable":false,"required":false},"properties":{"type":"json","configurable":false,"required":false,"default":{}},"conditions":{"type":"json","configurable":false,"required":false,"default":[]},"role":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::role"}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"admin::permission","plugin":"admin","globalId":"AdminPermission"},"admin::user":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"registrationToken":{"hidden":true}}},"kind":"collectionType","__schema__":{"collectionName":"admin_users","info":{"name":"User","description":"","singularName":"user","pluralName":"users","displayName":"User"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"firstname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"lastname":{"type":"string","unique":false,"minLength":1,"configurable":false,"required":false},"username":{"type":"string","unique":false,"configurable":false,"required":false},"email":{"type":"email","minLength":6,"configurable":false,"required":true,"unique":true,"private":true},"password":{"type":"password","minLength":6,"configurable":false,"required":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"registrationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"isActive":{"type":"boolean","default":false,"configurable":false,"private":true},"roles":{"configurable":false,"private":true,"type":"relation","relation":"manyToMany","inversedBy":"users","target":"admin::role","collectionName":"strapi_users_roles"},"blocked":{"type":"boolean","default":false,"configurable":false,"private":true},"preferedLanguage":{"type":"string","configurable":false,"required":false,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"admin::user","plugin":"admin","globalId":"AdminUser"},"admin::role":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"admin_roles","info":{"name":"Role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"code":{"type":"string","minLength":1,"unique":true,"configurable":false,"required":true},"description":{"type":"string","configurable":false},"users":{"configurable":false,"type":"relation","relation":"manyToMany","mappedBy":"roles","target":"admin::user"},"permissions":{"configurable":false,"type":"relation","relation":"oneToMany","mappedBy":"role","target":"admin::permission"}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"admin::role","plugin":"admin","globalId":"AdminRole"},"admin::api-token":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_tokens","info":{"name":"Api Token","singularName":"api-token","pluralName":"api-tokens","displayName":"Api Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"type":{"type":"enumeration","enum":["read-only","full-access","custom"],"configurable":false,"required":true,"default":"read-only"},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true,"searchable":false},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::api-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token","connection":"default","uid":"admin::api-token","plugin":"admin","globalId":"AdminApiToken"},"admin::api-token-permission":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_api_token_permissions","info":{"name":"API Token Permission","description":"","singularName":"api-token-permission","pluralName":"api-token-permissions","displayName":"API Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::api-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"api-token-permission","connection":"default","uid":"admin::api-token-permission","plugin":"admin","globalId":"AdminApiTokenPermission"},"admin::transfer-token":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_tokens","info":{"name":"Transfer Token","singularName":"transfer-token","pluralName":"transfer-tokens","displayName":"Transfer Token","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":1,"configurable":false,"required":true,"unique":true},"description":{"type":"string","minLength":1,"configurable":false,"required":false,"default":""},"accessKey":{"type":"string","minLength":1,"configurable":false,"required":true},"lastUsedAt":{"type":"datetime","configurable":false,"required":false},"permissions":{"type":"relation","target":"admin::transfer-token-permission","relation":"oneToMany","mappedBy":"token","configurable":false,"required":false},"expiresAt":{"type":"datetime","configurable":false,"required":false},"lifespan":{"type":"biginteger","configurable":false,"required":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token","connection":"default","uid":"admin::transfer-token","plugin":"admin","globalId":"AdminTransferToken"},"admin::transfer-token-permission":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_transfer_token_permissions","info":{"name":"Transfer Token Permission","description":"","singularName":"transfer-token-permission","pluralName":"transfer-token-permissions","displayName":"Transfer Token Permission"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","minLength":1,"configurable":false,"required":true},"token":{"configurable":false,"type":"relation","relation":"manyToOne","inversedBy":"permissions","target":"admin::transfer-token"}},"kind":"collectionType"},"modelType":"contentType","modelName":"transfer-token-permission","connection":"default","uid":"admin::transfer-token-permission","plugin":"admin","globalId":"AdminTransferTokenPermission"},"plugin::upload.file":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null}],"kind":"collectionType","__schema__":{"collectionName":"files","info":{"singularName":"file","pluralName":"files","displayName":"File","description":""},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","configurable":false,"required":true},"alternativeText":{"type":"string","configurable":false},"caption":{"type":"string","configurable":false},"width":{"type":"integer","configurable":false},"height":{"type":"integer","configurable":false},"formats":{"type":"json","configurable":false},"hash":{"type":"string","configurable":false,"required":true},"ext":{"type":"string","configurable":false},"mime":{"type":"string","configurable":false,"required":true},"size":{"type":"decimal","configurable":false,"required":true},"url":{"type":"string","configurable":false,"required":true},"previewUrl":{"type":"string","configurable":false},"provider":{"type":"string","configurable":false,"required":true},"provider_metadata":{"type":"json","configurable":false},"related":{"type":"relation","relation":"morphToMany","configurable":false},"folder":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"files","private":true},"folderPath":{"type":"string","min":1,"required":true,"private":true,"searchable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"file","connection":"default","uid":"plugin::upload.file","plugin":"upload","globalId":"UploadFile"},"plugin::upload.folder":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"}],"kind":"collectionType","__schema__":{"collectionName":"upload_folders","info":{"singularName":"folder","pluralName":"folders","displayName":"Folder"},"options":{},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"required":true},"pathId":{"type":"integer","unique":true,"required":true},"parent":{"type":"relation","relation":"manyToOne","target":"plugin::upload.folder","inversedBy":"children"},"children":{"type":"relation","relation":"oneToMany","target":"plugin::upload.folder","mappedBy":"parent"},"files":{"type":"relation","relation":"oneToMany","target":"plugin::upload.file","mappedBy":"folder"},"path":{"type":"string","min":1,"required":true}},"kind":"collectionType"},"modelType":"contentType","modelName":"folder","connection":"default","uid":"plugin::upload.folder","plugin":"upload","globalId":"UploadFolder"},"plugin::content-releases.release":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_releases","info":{"singularName":"release","pluralName":"releases","displayName":"Release"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","required":true},"releasedAt":{"type":"datetime"},"scheduledAt":{"type":"datetime"},"timezone":{"type":"string"},"status":{"type":"enumeration","enum":["ready","blocked","failed","done","empty"],"required":true},"actions":{"type":"relation","relation":"oneToMany","target":"plugin::content-releases.release-action","mappedBy":"release"}},"kind":"collectionType"},"modelType":"contentType","modelName":"release","connection":"default","uid":"plugin::content-releases.release","plugin":"content-releases","globalId":"ContentReleasesRelease"},"plugin::content-releases.release-action":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"entry":{"type":"relation","relation":"morphToOne","configurable":false},"contentType":{"type":"string","required":true},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"strapi_release_actions","info":{"singularName":"release-action","pluralName":"release-actions","displayName":"Release Action"},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"type":{"type":"enumeration","enum":["publish","unpublish"],"required":true},"entry":{"type":"relation","relation":"morphToOne","configurable":false},"contentType":{"type":"string","required":true},"locale":{"type":"string"},"release":{"type":"relation","relation":"manyToOne","target":"plugin::content-releases.release","inversedBy":"actions"},"isEntryValid":{"type":"boolean"}},"kind":"collectionType"},"modelType":"contentType","modelName":"release-action","connection":"default","uid":"plugin::content-releases.release-action","plugin":"content-releases","globalId":"ContentReleasesReleaseAction"},"plugin::slugify.slug":{"kind":"collectionType","collectionName":"slugs","info":{"singularName":"slug","pluralName":"slugs","displayName":"slug"},"options":{"draftAndPublish":false,"comment":""},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"slug":{"type":"text"},"count":{"type":"integer"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"slugs","info":{"singularName":"slug","pluralName":"slugs","displayName":"slug"},"options":{"draftAndPublish":false,"comment":""},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"slug":{"type":"text"},"count":{"type":"integer"}},"kind":"collectionType"},"modelType":"contentType","modelName":"slug","connection":"default","uid":"plugin::slugify.slug","plugin":"slugify","globalId":"SlugifySlug"},"plugin::i18n.locale":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"info":{"singularName":"locale","pluralName":"locales","collectionName":"locales","displayName":"Locale","description":""},"options":{"draftAndPublish":false},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","min":1,"max":50,"configurable":false},"code":{"type":"string","unique":true,"configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"locale","connection":"default","uid":"plugin::i18n.locale","plugin":"i18n","collectionName":"i18n_locale","globalId":"I18NLocale"},"plugin::users-permissions.permission":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_permissions","info":{"name":"permission","description":"","singularName":"permission","pluralName":"permissions","displayName":"Permission"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"action":{"type":"string","required":true,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"permissions","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"permission","connection":"default","uid":"plugin::users-permissions.permission","plugin":"users-permissions","globalId":"UsersPermissionsPermission"},"plugin::users-permissions.role":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"kind":"collectionType","__schema__":{"collectionName":"up_roles","info":{"name":"role","description":"","singularName":"role","pluralName":"roles","displayName":"Role"},"pluginOptions":{"content-manager":{"visible":false},"content-type-builder":{"visible":false}},"attributes":{"name":{"type":"string","minLength":3,"required":true,"configurable":false},"description":{"type":"string","configurable":false},"type":{"type":"string","unique":true,"configurable":false},"permissions":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.permission","mappedBy":"role","configurable":false},"users":{"type":"relation","relation":"oneToMany","target":"plugin::users-permissions.user","mappedBy":"role","configurable":false}},"kind":"collectionType"},"modelType":"contentType","modelName":"role","connection":"default","uid":"plugin::users-permissions.role","plugin":"users-permissions","globalId":"UsersPermissionsRole"},"plugin::users-permissions.user":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"address":{"type":"text"},"full_name":{"type":"string"},"phone":{"type":"string"},"gender":{"type":"enumeration","enum":["male","female"]},"type":{"type":"enumeration","enum":["USER","ADMIN"]},"birthday":{"type":"date"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"config":{"attributes":{"resetPasswordToken":{"hidden":true},"confirmationToken":{"hidden":true},"provider":{"hidden":true}}},"kind":"collectionType","__filename__":"schema.json","__schema__":{"collectionName":"up_users","info":{"name":"user","description":"","singularName":"user","pluralName":"users","displayName":"User"},"options":{"draftAndPublish":false},"attributes":{"username":{"type":"string","minLength":3,"unique":true,"configurable":false,"required":true},"email":{"type":"email","minLength":6,"configurable":false,"required":true},"provider":{"type":"string","configurable":false},"password":{"type":"password","minLength":6,"configurable":false,"private":true,"searchable":false},"resetPasswordToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmationToken":{"type":"string","configurable":false,"private":true,"searchable":false},"confirmed":{"type":"boolean","default":false,"configurable":false},"blocked":{"type":"boolean","default":false,"configurable":false},"role":{"type":"relation","relation":"manyToOne","target":"plugin::users-permissions.role","inversedBy":"users","configurable":false},"address":{"type":"text"},"full_name":{"type":"string"},"phone":{"type":"string"},"gender":{"type":"enumeration","enum":["male","female"]},"type":{"type":"enumeration","enum":["USER","ADMIN"]},"birthday":{"type":"date"}},"kind":"collectionType"},"modelType":"contentType","modelName":"user","connection":"default","uid":"plugin::users-permissions.user","plugin":"users-permissions","globalId":"UsersPermissionsUser"},"api::booking.booking":{"kind":"collectionType","collectionName":"bookings","info":{"singularName":"booking","pluralName":"bookings","displayName":"Booking","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"user":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"customer_email":{"type":"string"},"customer_full_name":{"type":"string"},"customer_phone":{"type":"string"},"date":{"type":"datetime"},"status":{"type":"enumeration","enum":["Chß╗¥ x├íc nhß║¡n","X├íc nhß║¡n","Ho├án th├ánh","Huß╗╖"]},"service":{"type":"relation","relation":"oneToOne","target":"api::service.service"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"bookings","info":{"singularName":"booking","pluralName":"bookings","displayName":"Booking","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"user":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"customer_email":{"type":"string"},"customer_full_name":{"type":"string"},"customer_phone":{"type":"string"},"date":{"type":"datetime"},"status":{"type":"enumeration","enum":["Chß╗¥ x├íc nhß║¡n","X├íc nhß║¡n","Ho├án th├ánh","Huß╗╖"]},"service":{"type":"relation","relation":"oneToOne","target":"api::service.service"}},"kind":"collectionType"},"modelType":"contentType","modelName":"booking","connection":"default","uid":"api::booking.booking","apiName":"booking","globalId":"Booking","actions":{},"lifecycles":{}},"api::category.category":{"kind":"collectionType","collectionName":"categories","info":{"singularName":"category","pluralName":"categories","displayName":"category","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string","unique":true},"slug":{"type":"string"},"banner":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"products":{"type":"relation","relation":"manyToMany","target":"api::product.product","mappedBy":"categories"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"categories","info":{"singularName":"category","pluralName":"categories","displayName":"category","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string","unique":true},"slug":{"type":"string"},"banner":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"products":{"type":"relation","relation":"manyToMany","target":"api::product.product","mappedBy":"categories"}},"kind":"collectionType"},"modelType":"contentType","modelName":"category","connection":"default","uid":"api::category.category","apiName":"category","globalId":"Category","actions":{},"lifecycles":{}},"api::message.message":{"kind":"collectionType","collectionName":"messages","info":{"singularName":"message","pluralName":"messages","displayName":"message"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"image":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":true},"sender":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"content":{"type":"text"},"room":{"type":"relation","relation":"oneToOne","target":"api::room.room"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"messages","info":{"singularName":"message","pluralName":"messages","displayName":"message"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"image":{"allowedTypes":["images","files","videos","audios"],"type":"media","multiple":true},"sender":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"content":{"type":"text"},"room":{"type":"relation","relation":"oneToOne","target":"api::room.room"}},"kind":"collectionType"},"modelType":"contentType","modelName":"message","connection":"default","uid":"api::message.message","apiName":"message","globalId":"Message","actions":{},"lifecycles":{}},"api::order.order":{"kind":"collectionType","collectionName":"orders","info":{"singularName":"order","pluralName":"orders","displayName":"order","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"customer_email":{"type":"string"},"customer_full_name":{"type":"string"},"customer_phone":{"type":"string"},"shipping_address":{"type":"string"},"shipping_method":{"type":"enumeration","enum":["Giao qua ─æß╗æi t├íc"],"default":"Giao qua ─æß╗æi t├íc"},"payment_method":{"type":"enumeration","enum":["VNPAY","COD"]},"total":{"type":"biginteger"},"status":{"type":"enumeration","enum":["Chß╗¥ x├íc nhß║¡n","X├íc nhß║¡n","─Éang vß║¡n chuyß╗ân","Ho├án th├ánh","Huß╗╖","Trß║ú h├áng"]},"user":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"voucher":{"type":"relation","relation":"oneToOne","target":"api::voucher.voucher"},"transport_fee":{"type":"biginteger","default":"35000"},"order_code":{"type":"uid","options":{"uuid-format":"^[A-Z]{4}[0-9]{6}$"},"customField":"plugin::strapi-advanced-uuid.uuid"},"reason":{"type":"string"},"order_details":{"type":"relation","relation":"oneToMany","target":"api::order-detail.order-detail","mappedBy":"order"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"orders","info":{"singularName":"order","pluralName":"orders","displayName":"order","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"customer_email":{"type":"string"},"customer_full_name":{"type":"string"},"customer_phone":{"type":"string"},"shipping_address":{"type":"string"},"shipping_method":{"type":"enumeration","enum":["Giao qua ─æß╗æi t├íc"],"default":"Giao qua ─æß╗æi t├íc"},"payment_method":{"type":"enumeration","enum":["VNPAY","COD"]},"total":{"type":"biginteger"},"status":{"type":"enumeration","enum":["Chß╗¥ x├íc nhß║¡n","X├íc nhß║¡n","─Éang vß║¡n chuyß╗ân","Ho├án th├ánh","Huß╗╖","Trß║ú h├áng"]},"user":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"voucher":{"type":"relation","relation":"oneToOne","target":"api::voucher.voucher"},"transport_fee":{"type":"biginteger","default":"35000"},"order_code":{"type":"customField","options":{"uuid-format":"^[A-Z]{4}[0-9]{6}$"},"customField":"plugin::strapi-advanced-uuid.uuid"},"reason":{"type":"string"},"order_details":{"type":"relation","relation":"oneToMany","target":"api::order-detail.order-detail","mappedBy":"order"}},"kind":"collectionType"},"modelType":"contentType","modelName":"order","connection":"default","uid":"api::order.order","apiName":"order","globalId":"Order","actions":{},"lifecycles":{}},"api::order-detail.order-detail":{"kind":"collectionType","collectionName":"order_details","info":{"singularName":"order-detail","pluralName":"order-details","displayName":"order-detail","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"product":{"type":"relation","relation":"oneToOne","target":"api::product.product"},"order":{"type":"relation","relation":"manyToOne","target":"api::order.order","inversedBy":"order_details"},"unit_price":{"type":"biginteger"},"quantity":{"type":"integer"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"order_details","info":{"singularName":"order-detail","pluralName":"order-details","displayName":"order-detail","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"product":{"type":"relation","relation":"oneToOne","target":"api::product.product"},"order":{"type":"relation","relation":"manyToOne","target":"api::order.order","inversedBy":"order_details"},"unit_price":{"type":"biginteger"},"quantity":{"type":"integer"}},"kind":"collectionType"},"modelType":"contentType","modelName":"order-detail","connection":"default","uid":"api::order-detail.order-detail","apiName":"order-detail","globalId":"OrderDetail","actions":{},"lifecycles":{}},"api::product.product":{"kind":"collectionType","collectionName":"products","info":{"singularName":"product","pluralName":"products","displayName":"product","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string","unique":true},"slug":{"type":"string"},"categories":{"type":"relation","relation":"manyToMany","target":"api::category.category","inversedBy":"products"},"gallery":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"]},"avatar":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"price":{"type":"biginteger","default":"10000"},"sale_price":{"type":"biginteger","default":"10000"},"total_purchase":{"type":"integer","default":0},"product_line":{"type":"relation","relation":"manyToOne","target":"api::product-line.product-line","inversedBy":"products"},"skin_properties":{"type":"relation","relation":"manyToMany","target":"api::skin-property.skin-property","mappedBy":"products"},"description":{"type":"text"},"quan":{"type":"integer"},"quantity":{"type":"integer","default":100},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"products","info":{"singularName":"product","pluralName":"products","displayName":"product","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string","unique":true},"slug":{"type":"string"},"categories":{"type":"relation","relation":"manyToMany","target":"api::category.category","inversedBy":"products"},"gallery":{"type":"media","multiple":true,"required":false,"allowedTypes":["images","files","videos","audios"]},"avatar":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"price":{"type":"biginteger","default":"10000"},"sale_price":{"type":"biginteger","default":"10000"},"total_purchase":{"type":"integer","default":0},"product_line":{"type":"relation","relation":"manyToOne","target":"api::product-line.product-line","inversedBy":"products"},"skin_properties":{"type":"relation","relation":"manyToMany","target":"api::skin-property.skin-property","mappedBy":"products"},"description":{"type":"text"},"quan":{"type":"integer"},"quantity":{"type":"integer","default":100}},"kind":"collectionType"},"modelType":"contentType","modelName":"product","connection":"default","uid":"api::product.product","apiName":"product","globalId":"Product","actions":{},"lifecycles":{}},"api::product-line.product-line":{"kind":"collectionType","collectionName":"product_lines","info":{"singularName":"product-line","pluralName":"product-lines","displayName":"product-line","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string","unique":true},"slug":{"type":"string"},"products":{"type":"relation","relation":"oneToMany","target":"api::product.product","mappedBy":"product_line"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"product_lines","info":{"singularName":"product-line","pluralName":"product-lines","displayName":"product-line","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"name":{"type":"string","unique":true},"slug":{"type":"string"},"products":{"type":"relation","relation":"oneToMany","target":"api::product.product","mappedBy":"product_line"}},"kind":"collectionType"},"modelType":"contentType","modelName":"product-line","connection":"default","uid":"api::product-line.product-line","apiName":"product-line","globalId":"ProductLine","actions":{},"lifecycles":{}},"api::room.room":{"kind":"collectionType","collectionName":"rooms","info":{"singularName":"room","pluralName":"rooms","displayName":"room"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"room_id":{"type":"uid","options":{"uuid-format":"^[a-z0-9]{40}$"},"customField":"plugin::strapi-advanced-uuid.uuid"},"user":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"seen_status":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"rooms","info":{"singularName":"room","pluralName":"rooms","displayName":"room"},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"room_id":{"type":"customField","options":{"uuid-format":"^[a-z0-9]{40}$"},"customField":"plugin::strapi-advanced-uuid.uuid"},"user":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"seen_status":{"type":"boolean"}},"kind":"collectionType"},"modelType":"contentType","modelName":"room","connection":"default","uid":"api::room.room","apiName":"room","globalId":"Room","actions":{},"lifecycles":{}},"api::service.service":{"kind":"collectionType","collectionName":"services","info":{"singularName":"service","pluralName":"services","displayName":"Service","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"title":{"type":"string"},"banner":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"short_description":{"type":"text"},"price":{"type":"biginteger"},"slug":{"type":"string"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"services","info":{"singularName":"service","pluralName":"services","displayName":"Service","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"title":{"type":"string"},"banner":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"short_description":{"type":"text"},"price":{"type":"biginteger"},"slug":{"type":"string"}},"kind":"collectionType"},"modelType":"contentType","modelName":"service","connection":"default","uid":"api::service.service","apiName":"service","globalId":"Service","actions":{},"lifecycles":{}},"api::skin-property.skin-property":{"kind":"collectionType","collectionName":"skin_properties","info":{"singularName":"skin-property","pluralName":"skin-properties","displayName":"skin_property","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string","unique":true},"slug":{"type":"string"},"products":{"type":"relation","relation":"manyToMany","target":"api::product.product","inversedBy":"skin_properties"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"publishedAt":{"type":"datetime","configurable":false,"writable":true,"visible":false},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"skin_properties","info":{"singularName":"skin-property","pluralName":"skin-properties","displayName":"skin_property","description":""},"options":{"draftAndPublish":true},"pluginOptions":{},"attributes":{"name":{"type":"string","unique":true},"slug":{"type":"string"},"products":{"type":"relation","relation":"manyToMany","target":"api::product.product","inversedBy":"skin_properties"}},"kind":"collectionType"},"modelType":"contentType","modelName":"skin-property","connection":"default","uid":"api::skin-property.skin-property","apiName":"skin-property","globalId":"SkinProperty","actions":{},"lifecycles":{}},"api::user-voucher.user-voucher":{"kind":"collectionType","collectionName":"user_vouchers","info":{"singularName":"user-voucher","pluralName":"user-vouchers","displayName":"user-voucher","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"user":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"voucher":{"type":"relation","relation":"oneToOne","target":"api::voucher.voucher"},"status":{"type":"enumeration","enum":["USED","UNUSED"]},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"user_vouchers","info":{"singularName":"user-voucher","pluralName":"user-vouchers","displayName":"user-voucher","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"user":{"type":"relation","relation":"oneToOne","target":"plugin::users-permissions.user"},"voucher":{"type":"relation","relation":"oneToOne","target":"api::voucher.voucher"},"status":{"type":"enumeration","enum":["USED","UNUSED"]}},"kind":"collectionType"},"modelType":"contentType","modelName":"user-voucher","connection":"default","uid":"api::user-voucher.user-voucher","apiName":"user-voucher","globalId":"UserVoucher","actions":{},"lifecycles":{}},"api::voucher.voucher":{"kind":"collectionType","collectionName":"vouchers","info":{"singularName":"voucher","pluralName":"vouchers","displayName":"Voucher","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"code":{"type":"string"},"amount_decrease":{"type":"biginteger"},"image":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"title":{"type":"text"},"public":{"type":"boolean"},"createdAt":{"type":"datetime"},"updatedAt":{"type":"datetime"},"createdBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true},"updatedBy":{"type":"relation","relation":"oneToOne","target":"admin::user","configurable":false,"writable":false,"visible":false,"useJoinTable":false,"private":true}},"__schema__":{"collectionName":"vouchers","info":{"singularName":"voucher","pluralName":"vouchers","displayName":"Voucher","description":""},"options":{"draftAndPublish":false},"pluginOptions":{},"attributes":{"code":{"type":"string"},"amount_decrease":{"type":"biginteger"},"image":{"type":"media","multiple":false,"required":false,"allowedTypes":["images","files","videos","audios"]},"title":{"type":"text"},"public":{"type":"boolean"}},"kind":"collectionType"},"modelType":"contentType","modelName":"voucher","connection":"default","uid":"api::voucher.voucher","apiName":"voucher","globalId":"Voucher","actions":{},"lifecycles":{}}}	object	\N	\N
10	plugin_content_manager_configuration_content_types::plugin::upload.folder	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"pathId":{"edit":{"label":"pathId","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"pathId","searchable":true,"sortable":true}},"parent":{"edit":{"label":"parent","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"parent","searchable":true,"sortable":true}},"children":{"edit":{"label":"children","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"children","searchable":false,"sortable":false}},"files":{"edit":{"label":"files","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"files","searchable":false,"sortable":false}},"path":{"edit":{"label":"path","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"path","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","pathId","parent"],"edit":[[{"name":"name","size":6},{"name":"pathId","size":4}],[{"name":"parent","size":6},{"name":"children","size":6}],[{"name":"files","size":6},{"name":"path","size":6}]]},"uid":"plugin::upload.folder"}	object	\N	\N
11	plugin_content_manager_configuration_content_types::plugin::content-releases.release	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"releasedAt":{"edit":{"label":"releasedAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"releasedAt","searchable":true,"sortable":true}},"scheduledAt":{"edit":{"label":"scheduledAt","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"scheduledAt","searchable":true,"sortable":true}},"timezone":{"edit":{"label":"timezone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"timezone","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"actions":{"edit":{"label":"actions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"contentType"},"list":{"label":"actions","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","releasedAt","scheduledAt"],"edit":[[{"name":"name","size":6},{"name":"releasedAt","size":6}],[{"name":"scheduledAt","size":6},{"name":"timezone","size":6}],[{"name":"status","size":6},{"name":"actions","size":6}]]},"uid":"plugin::content-releases.release"}	object	\N	\N
21	plugin_content_manager_configuration_content_types::api::message.message	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"sender":{"edit":{"label":"sender","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"sender","searchable":true,"sortable":true}},"content":{"edit":{"label":"content","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"content","searchable":true,"sortable":true}},"room":{"edit":{"label":"room","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"room","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","image","sender","content"],"edit":[[{"name":"image","size":6},{"name":"sender","size":6}],[{"name":"content","size":6},{"name":"room","size":6}]]},"uid":"api::message.message"}	object	\N	\N
29	plugin_upload_settings	{"sizeOptimization":true,"responsiveDimensions":true,"autoOrientation":false}	object	\N	\N
30	plugin_upload_view_configuration	{"pageSize":10,"sort":"createdAt:DESC"}	object	\N	\N
37	plugin_documentation_config	{"restrictedAccess":false}	object	\N	\N
32	plugin_meilisearch_meilisearch_api_key	"masterKey"	string	\N	\N
33	plugin_meilisearch_meilisearch_api_key_config	true	boolean	\N	\N
34	plugin_meilisearch_meilisearch_host	"http://localhost:7707"	string	\N	\N
35	plugin_meilisearch_meilisearch_host_config	true	boolean	\N	\N
36	plugin_meilisearch_meilisearch_listened_content_types	[]	object	\N	\N
20	plugin_content_manager_configuration_content_types::api::order.order	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"customer_email","defaultSortBy":"customer_email","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"customer_email":{"edit":{"label":"customer_email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"customer_email","searchable":true,"sortable":true}},"customer_full_name":{"edit":{"label":"customer_full_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"customer_full_name","searchable":true,"sortable":true}},"customer_phone":{"edit":{"label":"customer_phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"customer_phone","searchable":true,"sortable":true}},"shipping_address":{"edit":{"label":"shipping_address","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"shipping_address","searchable":true,"sortable":true}},"shipping_method":{"edit":{"label":"shipping_method","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"shipping_method","searchable":true,"sortable":true}},"payment_method":{"edit":{"label":"payment_method","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"payment_method","searchable":true,"sortable":true}},"total":{"edit":{"label":"total","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"total","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"user":{"edit":{"label":"user","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"user","searchable":true,"sortable":true}},"voucher":{"edit":{"label":"voucher","description":"","placeholder":"","visible":true,"editable":true,"mainField":"code"},"list":{"label":"voucher","searchable":true,"sortable":true}},"transport_fee":{"edit":{"label":"transport_fee","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"transport_fee","searchable":true,"sortable":true}},"order_code":{"edit":{"label":"order_code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"order_code","searchable":true,"sortable":true}},"reason":{"edit":{"label":"reason","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"reason","searchable":true,"sortable":true}},"order_details":{"edit":{"label":"order_details","description":"","placeholder":"","visible":true,"editable":true,"mainField":"id"},"list":{"label":"order_details","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","customer_email","customer_full_name","customer_phone"],"edit":[[{"name":"customer_email","size":6},{"name":"customer_full_name","size":6}],[{"name":"customer_phone","size":6},{"name":"shipping_address","size":6}],[{"name":"shipping_method","size":6},{"name":"payment_method","size":6}],[{"name":"total","size":4},{"name":"status","size":6}],[{"name":"user","size":6},{"name":"voucher","size":6}],[{"name":"transport_fee","size":4},{"name":"order_code","size":6}],[{"name":"reason","size":6},{"name":"order_details","size":6}]]},"uid":"api::order.order"}	object	\N	\N
31	plugin_upload_metrics	{"weeklySchedule":"50 13 21 * * 6","lastWeeklyUpdate":1729952030035}	object	\N	\N
12	plugin_content_manager_configuration_content_types::plugin::content-releases.release-action	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"contentType","defaultSortBy":"contentType","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"contentType":{"edit":{"label":"contentType","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"contentType","searchable":true,"sortable":true}},"locale":{"edit":{"label":"locale","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"locale","searchable":true,"sortable":true}},"release":{"edit":{"label":"release","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"release","searchable":true,"sortable":true}},"isEntryValid":{"edit":{"label":"isEntryValid","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"isEntryValid","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","type","contentType","locale"],"edit":[[{"name":"type","size":6},{"name":"contentType","size":6}],[{"name":"locale","size":6},{"name":"release","size":6}],[{"name":"isEntryValid","size":4}]]},"uid":"plugin::content-releases.release-action"}	object	\N	\N
22	plugin_content_manager_configuration_content_types::api::order-detail.order-detail	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"product":{"edit":{"label":"product","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"product","searchable":true,"sortable":true}},"order":{"edit":{"label":"order","description":"","placeholder":"","visible":true,"editable":true,"mainField":"customer_email"},"list":{"label":"order","searchable":true,"sortable":true}},"unit_price":{"edit":{"label":"unit_price","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"unit_price","searchable":true,"sortable":true}},"quantity":{"edit":{"label":"quantity","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"quantity","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","product","order","unit_price"],"edit":[[{"name":"product","size":6},{"name":"order","size":6}],[{"name":"unit_price","size":4},{"name":"quantity","size":4}]]},"uid":"api::order-detail.order-detail"}	object	\N	\N
13	plugin_content_manager_configuration_content_types::plugin::slugify.slug	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"count":{"edit":{"label":"count","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"count","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","slug","count","createdAt"],"edit":[[{"name":"slug","size":6},{"name":"count","size":4}]]},"uid":"plugin::slugify.slug"}	object	\N	\N
23	plugin_content_manager_configuration_content_types::api::product.product	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"categories":{"edit":{"label":"categories","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"categories","searchable":false,"sortable":false}},"gallery":{"edit":{"label":"gallery","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"gallery","searchable":false,"sortable":false}},"avatar":{"edit":{"label":"avatar","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"avatar","searchable":false,"sortable":false}},"price":{"edit":{"label":"price","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"price","searchable":true,"sortable":true}},"sale_price":{"edit":{"label":"sale_price","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"sale_price","searchable":true,"sortable":true}},"total_purchase":{"edit":{"label":"total_purchase","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"total_purchase","searchable":true,"sortable":true}},"product_line":{"edit":{"label":"product_line","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"product_line","searchable":true,"sortable":true}},"skin_properties":{"edit":{"label":"skin_properties","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"skin_properties","searchable":false,"sortable":false}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"quan":{"edit":{"label":"quan","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"quan","searchable":true,"sortable":true}},"quantity":{"edit":{"label":"quantity","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"quantity","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","slug","categories"],"edit":[[{"name":"name","size":6},{"name":"slug","size":6}],[{"name":"categories","size":6},{"name":"gallery","size":6}],[{"name":"avatar","size":6},{"name":"price","size":4}],[{"name":"sale_price","size":4},{"name":"total_purchase","size":4}],[{"name":"product_line","size":6},{"name":"skin_properties","size":6}],[{"name":"description","size":6},{"name":"quan","size":4}],[{"name":"quantity","size":4}]]},"uid":"api::product.product"}	object	\N	\N
14	plugin_content_manager_configuration_content_types::plugin::i18n.locale	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","code","createdAt"],"edit":[[{"name":"name","size":6},{"name":"code","size":6}]]},"uid":"plugin::i18n.locale"}	object	\N	\N
24	plugin_content_manager_configuration_content_types::api::product-line.product-line	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"products":{"edit":{"label":"products","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"products","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","slug","products"],"edit":[[{"name":"name","size":6},{"name":"slug","size":6}],[{"name":"products","size":6}]]},"uid":"api::product-line.product-line"}	object	\N	\N
42	core_admin_auth	{"providers":{"autoRegister":false,"defaultRole":null,"ssoLockedRoles":null}}	object	\N	\N
15	plugin_content_manager_configuration_content_types::plugin::users-permissions.permission	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"action","defaultSortBy":"action","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"action":{"edit":{"label":"action","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"action","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","action","role","createdAt"],"edit":[[{"name":"action","size":6},{"name":"role","size":6}]]},"uid":"plugin::users-permissions.permission"}	object	\N	\N
25	plugin_content_manager_configuration_content_types::api::room.room	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"room_id":{"edit":{"label":"room_id","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"room_id","searchable":true,"sortable":true}},"user":{"edit":{"label":"user","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"user","searchable":true,"sortable":true}},"seen_status":{"edit":{"label":"seen_status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"seen_status","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","room_id","user","seen_status"],"edit":[[{"name":"room_id","size":6},{"name":"user","size":6}],[{"name":"seen_status","size":4}]]},"uid":"api::room.room"}	object	\N	\N
16	plugin_content_manager_configuration_content_types::plugin::users-permissions.role	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"description":{"edit":{"label":"description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"description","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"permissions":{"edit":{"label":"permissions","description":"","placeholder":"","visible":true,"editable":true,"mainField":"action"},"list":{"label":"permissions","searchable":false,"sortable":false}},"users":{"edit":{"label":"users","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"users","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","description","type"],"edit":[[{"name":"name","size":6},{"name":"description","size":6}],[{"name":"type","size":6},{"name":"permissions","size":6}],[{"name":"users","size":6}]]},"uid":"plugin::users-permissions.role"}	object	\N	\N
26	plugin_content_manager_configuration_content_types::api::skin-property.skin-property	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"products":{"edit":{"label":"products","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"products","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","slug","products"],"edit":[[{"name":"name","size":6},{"name":"slug","size":6}],[{"name":"products","size":6}]]},"uid":"api::skin-property.skin-property"}	object	\N	\N
27	plugin_content_manager_configuration_content_types::api::user-voucher.user-voucher	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"id","defaultSortBy":"id","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"user":{"edit":{"label":"user","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"user","searchable":true,"sortable":true}},"voucher":{"edit":{"label":"voucher","description":"","placeholder":"","visible":true,"editable":true,"mainField":"code"},"list":{"label":"voucher","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","user","voucher","status"],"edit":[[{"name":"user","size":6},{"name":"voucher","size":6}],[{"name":"status","size":6}]]},"uid":"api::user-voucher.user-voucher"}	object	\N	\N
17	plugin_content_manager_configuration_content_types::plugin::users-permissions.user	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"username","defaultSortBy":"username","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"username":{"edit":{"label":"username","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"username","searchable":true,"sortable":true}},"email":{"edit":{"label":"email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"email","searchable":true,"sortable":true}},"provider":{"edit":{"label":"provider","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"provider","searchable":true,"sortable":true}},"password":{"edit":{"label":"password","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"password","searchable":true,"sortable":true}},"resetPasswordToken":{"edit":{"label":"resetPasswordToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"resetPasswordToken","searchable":true,"sortable":true}},"confirmationToken":{"edit":{"label":"confirmationToken","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"confirmationToken","searchable":true,"sortable":true}},"confirmed":{"edit":{"label":"confirmed","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"confirmed","searchable":true,"sortable":true}},"blocked":{"edit":{"label":"blocked","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"blocked","searchable":true,"sortable":true}},"role":{"edit":{"label":"role","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"role","searchable":true,"sortable":true}},"address":{"edit":{"label":"address","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"address","searchable":false,"sortable":false}},"full_name":{"edit":{"label":"full_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"full_name","searchable":true,"sortable":true}},"phone":{"edit":{"label":"phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"phone","searchable":true,"sortable":true}},"gender":{"edit":{"label":"gender","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"gender","searchable":true,"sortable":true}},"type":{"edit":{"label":"type","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"type","searchable":true,"sortable":true}},"birthday":{"edit":{"label":"birthday","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"birthday","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","username","email","confirmed"],"edit":[[{"name":"username","size":6},{"name":"email","size":6}],[{"name":"password","size":6},{"name":"confirmed","size":4}],[{"name":"blocked","size":4},{"name":"role","size":6}],[{"name":"address","size":12}],[{"name":"full_name","size":6},{"name":"phone","size":6}],[{"name":"gender","size":6},{"name":"type","size":6}],[{"name":"birthday","size":4}]]},"uid":"plugin::users-permissions.user"}	object	\N	\N
18	plugin_content_manager_configuration_content_types::api::category.category	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"name","defaultSortBy":"name","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"name":{"edit":{"label":"name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"name","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"banner":{"edit":{"label":"banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"products":{"edit":{"label":"products","description":"","placeholder":"","visible":true,"editable":true,"mainField":"name"},"list":{"label":"products","searchable":false,"sortable":false}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","name","slug","banner"],"edit":[[{"name":"name","size":6},{"name":"slug","size":6}],[{"name":"banner","size":6},{"name":"products","size":6}]]},"uid":"api::category.category"}	object	\N	\N
38	plugin_i18n_default_locale	"en"	string	\N	\N
39	plugin_users-permissions_grant	{"email":{"enabled":true,"icon":"envelope"},"discord":{"enabled":false,"icon":"discord","key":"","secret":"","callback":"api/auth/discord/callback","scope":["identify","email"]},"facebook":{"enabled":false,"icon":"facebook-square","key":"","secret":"","callback":"api/auth/facebook/callback","scope":["email"]},"google":{"enabled":false,"icon":"google","key":"","secret":"","callback":"api/auth/google/callback","scope":["email"]},"github":{"enabled":false,"icon":"github","key":"","secret":"","callback":"api/auth/github/callback","scope":["user","user:email"]},"microsoft":{"enabled":false,"icon":"windows","key":"","secret":"","callback":"api/auth/microsoft/callback","scope":["user.read"]},"twitter":{"enabled":false,"icon":"twitter","key":"","secret":"","callback":"api/auth/twitter/callback"},"instagram":{"enabled":false,"icon":"instagram","key":"","secret":"","callback":"api/auth/instagram/callback","scope":["user_profile"]},"vk":{"enabled":false,"icon":"vk","key":"","secret":"","callback":"api/auth/vk/callback","scope":["email"]},"twitch":{"enabled":false,"icon":"twitch","key":"","secret":"","callback":"api/auth/twitch/callback","scope":["user:read:email"]},"linkedin":{"enabled":false,"icon":"linkedin","key":"","secret":"","callback":"api/auth/linkedin/callback","scope":["r_liteprofile","r_emailaddress"]},"cognito":{"enabled":false,"icon":"aws","key":"","secret":"","subdomain":"my.subdomain.com","callback":"api/auth/cognito/callback","scope":["email","openid","profile"]},"reddit":{"enabled":false,"icon":"reddit","key":"","secret":"","state":true,"callback":"api/auth/reddit/callback","scope":["identity"]},"auth0":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"my-tenant.eu","callback":"api/auth/auth0/callback","scope":["openid","email","profile"]},"cas":{"enabled":false,"icon":"book","key":"","secret":"","callback":"api/auth/cas/callback","scope":["openid email"],"subdomain":"my.subdomain.com/cas"},"patreon":{"enabled":false,"icon":"","key":"","secret":"","callback":"api/auth/patreon/callback","scope":["identity","identity[email]"]},"keycloak":{"enabled":false,"icon":"","key":"","secret":"","subdomain":"myKeycloakProvider.com/realms/myrealm","callback":"api/auth/keycloak/callback","scope":["openid","email","profile"]}}	object	\N	\N
40	plugin_users-permissions_email	{"reset_password":{"display":"Email.template.reset_password","icon":"sync","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Reset password","message":"<p>We heard that you lost your password. Sorry about that!</p>\\n\\n<p>But donΓÇÖt worry! You can use the following link to reset your password:</p>\\n<p><%= URL %>?code=<%= TOKEN %></p>\\n\\n<p>Thanks.</p>"}},"email_confirmation":{"display":"Email.template.email_confirmation","icon":"check-square","options":{"from":{"name":"Administration Panel","email":"no-reply@strapi.io"},"response_email":"","object":"Account confirmation","message":"<p>Thank you for registering!</p>\\n\\n<p>You have to confirm your email address. Please click on the link below.</p>\\n\\n<p><%= URL %>?confirmation=<%= CODE %></p>\\n\\n<p>Thanks.</p>"}}}	object	\N	\N
41	plugin_users-permissions_advanced	{"unique_email":true,"allow_register":true,"email_confirmation":false,"email_reset_password":null,"email_confirmation_redirection":null,"default_role":"authenticated"}	object	\N	\N
43	plugin_content_manager_configuration_content_types::api::service.service	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"title","defaultSortBy":"title","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"banner":{"edit":{"label":"banner","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"banner","searchable":false,"sortable":false}},"short_description":{"edit":{"label":"short_description","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"short_description","searchable":true,"sortable":true}},"price":{"edit":{"label":"price","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"price","searchable":true,"sortable":true}},"slug":{"edit":{"label":"slug","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"slug","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","title","banner","short_description"],"edit":[[{"name":"title","size":6},{"name":"banner","size":6}],[{"name":"short_description","size":6},{"name":"price","size":4}],[{"name":"slug","size":6}]]},"uid":"api::service.service"}	object	\N	\N
19	plugin_content_manager_configuration_content_types::api::booking.booking	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"customer_email","defaultSortBy":"customer_email","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"user":{"edit":{"label":"user","description":"","placeholder":"","visible":true,"editable":true,"mainField":"username"},"list":{"label":"user","searchable":true,"sortable":true}},"customer_email":{"edit":{"label":"customer_email","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"customer_email","searchable":true,"sortable":true}},"customer_full_name":{"edit":{"label":"customer_full_name","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"customer_full_name","searchable":true,"sortable":true}},"customer_phone":{"edit":{"label":"customer_phone","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"customer_phone","searchable":true,"sortable":true}},"date":{"edit":{"label":"date","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"date","searchable":true,"sortable":true}},"status":{"edit":{"label":"status","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"status","searchable":true,"sortable":true}},"service":{"edit":{"label":"service","description":"","placeholder":"","visible":true,"editable":true,"mainField":"title"},"list":{"label":"service","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","user","customer_email","customer_full_name"],"edit":[[{"name":"user","size":6},{"name":"customer_email","size":6}],[{"name":"customer_full_name","size":6},{"name":"customer_phone","size":6}],[{"name":"date","size":6}],[{"name":"status","size":6},{"name":"service","size":6}]]},"uid":"api::booking.booking"}	object	\N	\N
44	plugin_upload_api-folder	{"id":1}	object	\N	\N
28	plugin_content_manager_configuration_content_types::api::voucher.voucher	{"settings":{"bulkable":true,"filterable":true,"searchable":true,"pageSize":10,"mainField":"code","defaultSortBy":"code","defaultSortOrder":"ASC"},"metadatas":{"id":{"edit":{},"list":{"label":"id","searchable":true,"sortable":true}},"code":{"edit":{"label":"code","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"code","searchable":true,"sortable":true}},"amount_decrease":{"edit":{"label":"amount_decrease","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"amount_decrease","searchable":true,"sortable":true}},"image":{"edit":{"label":"image","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"image","searchable":false,"sortable":false}},"title":{"edit":{"label":"title","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"title","searchable":true,"sortable":true}},"public":{"edit":{"label":"public","description":"","placeholder":"","visible":true,"editable":true},"list":{"label":"public","searchable":true,"sortable":true}},"createdAt":{"edit":{"label":"createdAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"createdAt","searchable":true,"sortable":true}},"updatedAt":{"edit":{"label":"updatedAt","description":"","placeholder":"","visible":false,"editable":true},"list":{"label":"updatedAt","searchable":true,"sortable":true}},"createdBy":{"edit":{"label":"createdBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"createdBy","searchable":true,"sortable":true}},"updatedBy":{"edit":{"label":"updatedBy","description":"","placeholder":"","visible":false,"editable":true,"mainField":"firstname"},"list":{"label":"updatedBy","searchable":true,"sortable":true}}},"layouts":{"list":["id","code","amount_decrease","image"],"edit":[[{"name":"code","size":6},{"name":"amount_decrease","size":4}],[{"name":"image","size":6},{"name":"title","size":6}],[{"name":"public","size":4}]]},"uid":"api::voucher.voucher"}	object	\N	\N
\.


--
-- Data for Name: strapi_database_schema; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.strapi_database_schema (id, schema, "time", hash) FROM stdin;
9	{"tables":[{"name":"strapi_core_store_settings","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"value","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"environment","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"tag","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"strapi_webhooks","indexes":[],"foreignKeys":[],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"headers","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"events","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"enabled","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false}]},{"name":"admin_permissions","indexes":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"action_parameters","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"subject","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"properties","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"conditions","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users","indexes":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"firstname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lastname","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"registration_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_active","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"prefered_language","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_roles","indexes":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"admin_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"admin_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_tokens","indexes":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions","indexes":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_api_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_tokens","indexes":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_tokens_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_tokens_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"access_key","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"last_used_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"expires_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"lifespan","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions","indexes":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_transfer_token_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files","indexes":[{"name":"upload_files_folder_path_index","columns":["folder_path"],"type":null},{"name":"upload_files_created_at_index","columns":["created_at"],"type":null},{"name":"upload_files_updated_at_index","columns":["updated_at"],"type":null},{"name":"upload_files_name_index","columns":["name"],"type":null},{"name":"upload_files_size_index","columns":["size"],"type":null},{"name":"upload_files_ext_index","columns":["ext"],"type":null},{"name":"files_created_by_id_fk","columns":["created_by_id"]},{"name":"files_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"files_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"files_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"alternative_text","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"caption","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"width","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"height","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"formats","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"hash","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"ext","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"mime","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"size","type":"decimal","args":[10,2],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"preview_url","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider_metadata","type":"jsonb","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"folder_path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders","indexes":[{"name":"upload_folders_path_id_index","columns":["path_id"],"type":"unique"},{"name":"upload_folders_path_index","columns":["path"],"type":"unique"},{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"]},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"upload_folders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"upload_folders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"path","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_releases","indexes":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_releases_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_releases_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"released_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"scheduled_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"timezone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions","indexes":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"]},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"strapi_release_actions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"strapi_release_actions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"target_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"target_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"content_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"locale","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"is_entry_valid","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"slugs","indexes":[{"name":"slugs_created_by_id_fk","columns":["created_by_id"]},{"name":"slugs_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"slugs_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"slugs_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"slug","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"count","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"i18n_locale","indexes":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"]},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"i18n_locale_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"i18n_locale_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions","indexes":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"]},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_permissions_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_permissions_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"action","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_roles","indexes":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"]},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_roles_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_roles_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users","indexes":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"]},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"up_users_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"up_users_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"username","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"provider","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"password","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"reset_password_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmation_token","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"confirmed","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"blocked","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"address","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"full_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"gender","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"birthday","type":"date","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"bookings","indexes":[{"name":"bookings_created_by_id_fk","columns":["created_by_id"]},{"name":"bookings_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"bookings_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"bookings_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"customer_email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"customer_full_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"customer_phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"date","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"categories","indexes":[{"name":"categories_created_by_id_fk","columns":["created_by_id"]},{"name":"categories_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"categories_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"categories_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"messages","indexes":[{"name":"messages_created_by_id_fk","columns":["created_by_id"]},{"name":"messages_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"messages_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"messages_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"content","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"orders","indexes":[{"type":"unique","name":"orders_order_code_unique","columns":["order_code"]},{"name":"orders_created_by_id_fk","columns":["created_by_id"]},{"name":"orders_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"orders_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"orders_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"customer_email","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"customer_full_name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"customer_phone","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"shipping_address","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"shipping_method","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"payment_method","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"total","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"transport_fee","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order_code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"reason","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"order_details","indexes":[{"name":"order_details_created_by_id_fk","columns":["created_by_id"]},{"name":"order_details_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"order_details_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"order_details_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"unit_price","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"quantity","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"products","indexes":[{"name":"products_created_by_id_fk","columns":["created_by_id"]},{"name":"products_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"products_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"products_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"price","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"sale_price","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"total_purchase","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"quan","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"quantity","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"product_lines","indexes":[{"name":"product_lines_created_by_id_fk","columns":["created_by_id"]},{"name":"product_lines_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"product_lines_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"product_lines_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"rooms","indexes":[{"type":"unique","name":"rooms_room_id_unique","columns":["room_id"]},{"name":"rooms_created_by_id_fk","columns":["created_by_id"]},{"name":"rooms_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"rooms_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"rooms_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"room_id","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false,"unique":true},{"name":"seen_status","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"services","indexes":[{"name":"services_created_by_id_fk","columns":["created_by_id"]},{"name":"services_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"services_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"services_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"title","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"short_description","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"price","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"skin_properties","indexes":[{"name":"skin_properties_created_by_id_fk","columns":["created_by_id"]},{"name":"skin_properties_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"skin_properties_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"skin_properties_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"name","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"slug","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"published_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"user_vouchers","indexes":[{"name":"user_vouchers_created_by_id_fk","columns":["created_by_id"]},{"name":"user_vouchers_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"user_vouchers_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"user_vouchers_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"status","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"vouchers","indexes":[{"name":"vouchers_created_by_id_fk","columns":["created_by_id"]},{"name":"vouchers_updated_by_id_fk","columns":["updated_by_id"]}],"foreignKeys":[{"name":"vouchers_created_by_id_fk","columns":["created_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"},{"name":"vouchers_updated_by_id_fk","columns":["updated_by_id"],"referencedTable":"admin_users","referencedColumns":["id"],"onDelete":"SET NULL"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"code","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"amount_decrease","type":"bigInteger","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"title","type":"text","args":["longtext"],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"public","type":"boolean","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"updated_at","type":"datetime","args":[{"useTz":false,"precision":6}],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"created_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"updated_by_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_permissions_role_links","indexes":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"]},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"admin_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"admin_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"admin_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"admin_permissions","onDelete":"CASCADE"},{"name":"admin_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"admin_users_roles_links","indexes":[{"name":"admin_users_roles_links_fk","columns":["user_id"]},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"]},{"name":"admin_users_roles_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"admin_users_roles_links_order_fk","columns":["role_order"]},{"name":"admin_users_roles_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"admin_users_roles_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"admin_users","onDelete":"CASCADE"},{"name":"admin_users_roles_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"admin_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_api_token_permissions_token_links","indexes":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"]},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"]},{"name":"strapi_api_token_permissions_token_links_unique","columns":["api_token_permission_id","api_token_id"],"type":"unique"},{"name":"strapi_api_token_permissions_token_links_order_inv_fk","columns":["api_token_permission_order"]}],"foreignKeys":[{"name":"strapi_api_token_permissions_token_links_fk","columns":["api_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_token_permissions","onDelete":"CASCADE"},{"name":"strapi_api_token_permissions_token_links_inv_fk","columns":["api_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_api_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"api_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"api_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_transfer_token_permissions_token_links","indexes":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"]},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"]},{"name":"strapi_transfer_token_permissions_token_links_unique","columns":["transfer_token_permission_id","transfer_token_id"],"type":"unique"},{"name":"strapi_transfer_token_permissions_token_links_order_inv_fk","columns":["transfer_token_permission_order"]}],"foreignKeys":[{"name":"strapi_transfer_token_permissions_token_links_fk","columns":["transfer_token_permission_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_token_permissions","onDelete":"CASCADE"},{"name":"strapi_transfer_token_permissions_token_links_inv_fk","columns":["transfer_token_id"],"referencedColumns":["id"],"referencedTable":"strapi_transfer_tokens","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"transfer_token_permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"transfer_token_permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_related_morphs","indexes":[{"name":"files_related_morphs_fk","columns":["file_id"]},{"name":"files_related_morphs_order_index","columns":["order"]},{"name":"files_related_morphs_id_column_index","columns":["related_id"]}],"foreignKeys":[{"name":"files_related_morphs_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"related_type","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"field","type":"string","args":[],"defaultTo":null,"notNullable":false,"unsigned":false},{"name":"order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"files_folder_links","indexes":[{"name":"files_folder_links_fk","columns":["file_id"]},{"name":"files_folder_links_inv_fk","columns":["folder_id"]},{"name":"files_folder_links_unique","columns":["file_id","folder_id"],"type":"unique"},{"name":"files_folder_links_order_inv_fk","columns":["file_order"]}],"foreignKeys":[{"name":"files_folder_links_fk","columns":["file_id"],"referencedColumns":["id"],"referencedTable":"files","onDelete":"CASCADE"},{"name":"files_folder_links_inv_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"file_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"file_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"upload_folders_parent_links","indexes":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"]},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"]},{"name":"upload_folders_parent_links_unique","columns":["folder_id","inv_folder_id"],"type":"unique"},{"name":"upload_folders_parent_links_order_inv_fk","columns":["folder_order"]}],"foreignKeys":[{"name":"upload_folders_parent_links_fk","columns":["folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"},{"name":"upload_folders_parent_links_inv_fk","columns":["inv_folder_id"],"referencedColumns":["id"],"referencedTable":"upload_folders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"inv_folder_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"folder_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"strapi_release_actions_release_links","indexes":[{"name":"strapi_release_actions_release_links_fk","columns":["release_action_id"]},{"name":"strapi_release_actions_release_links_inv_fk","columns":["release_id"]},{"name":"strapi_release_actions_release_links_unique","columns":["release_action_id","release_id"],"type":"unique"},{"name":"strapi_release_actions_release_links_order_inv_fk","columns":["release_action_order"]}],"foreignKeys":[{"name":"strapi_release_actions_release_links_fk","columns":["release_action_id"],"referencedColumns":["id"],"referencedTable":"strapi_release_actions","onDelete":"CASCADE"},{"name":"strapi_release_actions_release_links_inv_fk","columns":["release_id"],"referencedColumns":["id"],"referencedTable":"strapi_releases","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"release_action_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"release_action_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_permissions_role_links","indexes":[{"name":"up_permissions_role_links_fk","columns":["permission_id"]},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"]},{"name":"up_permissions_role_links_unique","columns":["permission_id","role_id"],"type":"unique"},{"name":"up_permissions_role_links_order_inv_fk","columns":["permission_order"]}],"foreignKeys":[{"name":"up_permissions_role_links_fk","columns":["permission_id"],"referencedColumns":["id"],"referencedTable":"up_permissions","onDelete":"CASCADE"},{"name":"up_permissions_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"permission_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"permission_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"up_users_role_links","indexes":[{"name":"up_users_role_links_fk","columns":["user_id"]},{"name":"up_users_role_links_inv_fk","columns":["role_id"]},{"name":"up_users_role_links_unique","columns":["user_id","role_id"],"type":"unique"},{"name":"up_users_role_links_order_inv_fk","columns":["user_order"]}],"foreignKeys":[{"name":"up_users_role_links_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"},{"name":"up_users_role_links_inv_fk","columns":["role_id"],"referencedColumns":["id"],"referencedTable":"up_roles","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"role_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"bookings_user_links","indexes":[{"name":"bookings_user_links_fk","columns":["booking_id"]},{"name":"bookings_user_links_inv_fk","columns":["user_id"]},{"name":"bookings_user_links_unique","columns":["booking_id","user_id"],"type":"unique"}],"foreignKeys":[{"name":"bookings_user_links_fk","columns":["booking_id"],"referencedColumns":["id"],"referencedTable":"bookings","onDelete":"CASCADE"},{"name":"bookings_user_links_inv_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"booking_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"bookings_service_links","indexes":[{"name":"bookings_service_links_fk","columns":["booking_id"]},{"name":"bookings_service_links_inv_fk","columns":["service_id"]},{"name":"bookings_service_links_unique","columns":["booking_id","service_id"],"type":"unique"}],"foreignKeys":[{"name":"bookings_service_links_fk","columns":["booking_id"],"referencedColumns":["id"],"referencedTable":"bookings","onDelete":"CASCADE"},{"name":"bookings_service_links_inv_fk","columns":["service_id"],"referencedColumns":["id"],"referencedTable":"services","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"booking_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"service_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"messages_sender_links","indexes":[{"name":"messages_sender_links_fk","columns":["message_id"]},{"name":"messages_sender_links_inv_fk","columns":["user_id"]},{"name":"messages_sender_links_unique","columns":["message_id","user_id"],"type":"unique"}],"foreignKeys":[{"name":"messages_sender_links_fk","columns":["message_id"],"referencedColumns":["id"],"referencedTable":"messages","onDelete":"CASCADE"},{"name":"messages_sender_links_inv_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"message_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"messages_room_links","indexes":[{"name":"messages_room_links_fk","columns":["message_id"]},{"name":"messages_room_links_inv_fk","columns":["room_id"]},{"name":"messages_room_links_unique","columns":["message_id","room_id"],"type":"unique"}],"foreignKeys":[{"name":"messages_room_links_fk","columns":["message_id"],"referencedColumns":["id"],"referencedTable":"messages","onDelete":"CASCADE"},{"name":"messages_room_links_inv_fk","columns":["room_id"],"referencedColumns":["id"],"referencedTable":"rooms","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"message_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"room_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"orders_user_links","indexes":[{"name":"orders_user_links_fk","columns":["order_id"]},{"name":"orders_user_links_inv_fk","columns":["user_id"]},{"name":"orders_user_links_unique","columns":["order_id","user_id"],"type":"unique"}],"foreignKeys":[{"name":"orders_user_links_fk","columns":["order_id"],"referencedColumns":["id"],"referencedTable":"orders","onDelete":"CASCADE"},{"name":"orders_user_links_inv_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"order_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"orders_voucher_links","indexes":[{"name":"orders_voucher_links_fk","columns":["order_id"]},{"name":"orders_voucher_links_inv_fk","columns":["voucher_id"]},{"name":"orders_voucher_links_unique","columns":["order_id","voucher_id"],"type":"unique"}],"foreignKeys":[{"name":"orders_voucher_links_fk","columns":["order_id"],"referencedColumns":["id"],"referencedTable":"orders","onDelete":"CASCADE"},{"name":"orders_voucher_links_inv_fk","columns":["voucher_id"],"referencedColumns":["id"],"referencedTable":"vouchers","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"order_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"voucher_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"order_details_product_links","indexes":[{"name":"order_details_product_links_fk","columns":["order_detail_id"]},{"name":"order_details_product_links_inv_fk","columns":["product_id"]},{"name":"order_details_product_links_unique","columns":["order_detail_id","product_id"],"type":"unique"}],"foreignKeys":[{"name":"order_details_product_links_fk","columns":["order_detail_id"],"referencedColumns":["id"],"referencedTable":"order_details","onDelete":"CASCADE"},{"name":"order_details_product_links_inv_fk","columns":["product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"order_detail_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"order_details_order_links","indexes":[{"name":"order_details_order_links_fk","columns":["order_detail_id"]},{"name":"order_details_order_links_inv_fk","columns":["order_id"]},{"name":"order_details_order_links_unique","columns":["order_detail_id","order_id"],"type":"unique"},{"name":"order_details_order_links_order_inv_fk","columns":["order_detail_order"]}],"foreignKeys":[{"name":"order_details_order_links_fk","columns":["order_detail_id"],"referencedColumns":["id"],"referencedTable":"order_details","onDelete":"CASCADE"},{"name":"order_details_order_links_inv_fk","columns":["order_id"],"referencedColumns":["id"],"referencedTable":"orders","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"order_detail_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"order_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"order_detail_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"products_categories_links","indexes":[{"name":"products_categories_links_fk","columns":["product_id"]},{"name":"products_categories_links_inv_fk","columns":["category_id"]},{"name":"products_categories_links_unique","columns":["product_id","category_id"],"type":"unique"},{"name":"products_categories_links_order_fk","columns":["category_order"]},{"name":"products_categories_links_order_inv_fk","columns":["product_order"]}],"foreignKeys":[{"name":"products_categories_links_fk","columns":["product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"},{"name":"products_categories_links_inv_fk","columns":["category_id"],"referencedColumns":["id"],"referencedTable":"categories","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"category_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"category_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"products_product_line_links","indexes":[{"name":"products_product_line_links_fk","columns":["product_id"]},{"name":"products_product_line_links_inv_fk","columns":["product_line_id"]},{"name":"products_product_line_links_unique","columns":["product_id","product_line_id"],"type":"unique"},{"name":"products_product_line_links_order_inv_fk","columns":["product_order"]}],"foreignKeys":[{"name":"products_product_line_links_fk","columns":["product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"},{"name":"products_product_line_links_inv_fk","columns":["product_line_id"],"referencedColumns":["id"],"referencedTable":"product_lines","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_line_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"rooms_user_links","indexes":[{"name":"rooms_user_links_fk","columns":["room_id"]},{"name":"rooms_user_links_inv_fk","columns":["user_id"]},{"name":"rooms_user_links_unique","columns":["room_id","user_id"],"type":"unique"}],"foreignKeys":[{"name":"rooms_user_links_fk","columns":["room_id"],"referencedColumns":["id"],"referencedTable":"rooms","onDelete":"CASCADE"},{"name":"rooms_user_links_inv_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"room_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"skin_properties_products_links","indexes":[{"name":"skin_properties_products_links_fk","columns":["skin_property_id"]},{"name":"skin_properties_products_links_inv_fk","columns":["product_id"]},{"name":"skin_properties_products_links_unique","columns":["skin_property_id","product_id"],"type":"unique"},{"name":"skin_properties_products_links_order_fk","columns":["product_order"]},{"name":"skin_properties_products_links_order_inv_fk","columns":["skin_property_order"]}],"foreignKeys":[{"name":"skin_properties_products_links_fk","columns":["skin_property_id"],"referencedColumns":["id"],"referencedTable":"skin_properties","onDelete":"CASCADE"},{"name":"skin_properties_products_links_inv_fk","columns":["product_id"],"referencedColumns":["id"],"referencedTable":"products","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"skin_property_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"product_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"skin_property_order","type":"double","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"user_vouchers_user_links","indexes":[{"name":"user_vouchers_user_links_fk","columns":["user_voucher_id"]},{"name":"user_vouchers_user_links_inv_fk","columns":["user_id"]},{"name":"user_vouchers_user_links_unique","columns":["user_voucher_id","user_id"],"type":"unique"}],"foreignKeys":[{"name":"user_vouchers_user_links_fk","columns":["user_voucher_id"],"referencedColumns":["id"],"referencedTable":"user_vouchers","onDelete":"CASCADE"},{"name":"user_vouchers_user_links_inv_fk","columns":["user_id"],"referencedColumns":["id"],"referencedTable":"up_users","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_voucher_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"user_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]},{"name":"user_vouchers_voucher_links","indexes":[{"name":"user_vouchers_voucher_links_fk","columns":["user_voucher_id"]},{"name":"user_vouchers_voucher_links_inv_fk","columns":["voucher_id"]},{"name":"user_vouchers_voucher_links_unique","columns":["user_voucher_id","voucher_id"],"type":"unique"}],"foreignKeys":[{"name":"user_vouchers_voucher_links_fk","columns":["user_voucher_id"],"referencedColumns":["id"],"referencedTable":"user_vouchers","onDelete":"CASCADE"},{"name":"user_vouchers_voucher_links_inv_fk","columns":["voucher_id"],"referencedColumns":["id"],"referencedTable":"vouchers","onDelete":"CASCADE"}],"columns":[{"name":"id","type":"increments","args":[{"primary":true,"primaryKey":true}],"defaultTo":null,"notNullable":true,"unsigned":false},{"name":"user_voucher_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true},{"name":"voucher_id","type":"integer","args":[],"defaultTo":null,"notNullable":false,"unsigned":true}]}]}	2024-10-30 11:14:45.678	0e84e5e729c4269ce6cdb6f9d810a4a5
\.


--
-- Data for Name: strapi_migrations; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.strapi_migrations (id, name, "time") FROM stdin;
\.


--
-- Data for Name: strapi_release_actions; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.strapi_release_actions (id, type, target_id, target_type, content_type, locale, is_entry_valid, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_release_actions_release_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.strapi_release_actions_release_links (id, release_action_id, release_id, release_action_order) FROM stdin;
\.


--
-- Data for Name: strapi_releases; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.strapi_releases (id, name, released_at, scheduled_at, timezone, status, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.strapi_transfer_token_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_token_permissions_token_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.strapi_transfer_token_permissions_token_links (id, transfer_token_permission_id, transfer_token_id, transfer_token_permission_order) FROM stdin;
\.


--
-- Data for Name: strapi_transfer_tokens; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.strapi_transfer_tokens (id, name, description, access_key, last_used_at, expires_at, lifespan, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
\.


--
-- Data for Name: strapi_webhooks; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.strapi_webhooks (id, name, url, headers, events, enabled) FROM stdin;
\.


--
-- Data for Name: up_permissions; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.up_permissions (id, action, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
2	plugin::users-permissions.auth.changePassword	2024-10-19 19:44:08.288	2024-10-19 19:44:08.288	\N	\N
3	plugin::users-permissions.auth.callback	2024-10-19 19:44:08.313	2024-10-19 19:44:08.313	\N	\N
4	plugin::users-permissions.auth.connect	2024-10-19 19:44:08.314	2024-10-19 19:44:08.314	\N	\N
5	plugin::users-permissions.auth.forgotPassword	2024-10-19 19:44:08.314	2024-10-19 19:44:08.314	\N	\N
6	plugin::users-permissions.auth.resetPassword	2024-10-19 19:44:08.314	2024-10-19 19:44:08.314	\N	\N
7	plugin::users-permissions.auth.register	2024-10-19 19:44:08.314	2024-10-19 19:44:08.314	\N	\N
8	plugin::users-permissions.auth.emailConfirmation	2024-10-19 19:44:08.314	2024-10-19 19:44:08.314	\N	\N
9	plugin::users-permissions.auth.sendEmailConfirmation	2024-10-19 19:44:08.314	2024-10-19 19:44:08.314	\N	\N
10	plugin::users-permissions.user.find	2024-10-21 21:53:07.842	2024-10-21 21:53:07.842	\N	\N
11	api::category.category.find	2024-10-22 15:24:07.749	2024-10-22 15:24:07.749	\N	\N
12	api::category.category.findOne	2024-10-22 15:24:07.749	2024-10-22 15:24:07.749	\N	\N
13	api::booking.booking.find	2024-10-22 15:57:13.427	2024-10-22 15:57:13.427	\N	\N
14	api::booking.booking.findOne	2024-10-22 15:57:13.427	2024-10-22 15:57:13.427	\N	\N
15	api::product.product.find	2024-10-22 15:57:13.427	2024-10-22 15:57:13.427	\N	\N
16	api::product.product.findOne	2024-10-22 15:57:13.427	2024-10-22 15:57:13.427	\N	\N
17	api::product-line.product-line.find	2024-10-22 15:57:13.427	2024-10-22 15:57:13.427	\N	\N
18	api::product-line.product-line.findOne	2024-10-22 15:57:13.427	2024-10-22 15:57:13.427	\N	\N
19	api::service.service.find	2024-10-22 15:57:13.427	2024-10-22 15:57:13.427	\N	\N
20	api::service.service.findOne	2024-10-22 15:57:13.427	2024-10-22 15:57:13.427	\N	\N
21	api::skin-property.skin-property.find	2024-10-22 15:57:13.427	2024-10-22 15:57:13.427	\N	\N
22	api::skin-property.skin-property.findOne	2024-10-22 15:57:13.428	2024-10-22 15:57:13.428	\N	\N
25	plugin::users-permissions.user.me	2024-10-23 23:01:41.391	2024-10-23 23:01:41.391	\N	\N
29	api::product.product.find	2024-10-23 23:21:23.942	2024-10-23 23:21:23.942	\N	\N
30	api::product.product.findOne	2024-10-23 23:21:23.942	2024-10-23 23:21:23.942	\N	\N
31	api::service.service.find	2024-10-23 23:21:42.246	2024-10-23 23:21:42.246	\N	\N
32	api::service.service.findOne	2024-10-23 23:21:42.246	2024-10-23 23:21:42.246	\N	\N
33	api::user-voucher.user-voucher.find	2024-10-24 17:52:46.643	2024-10-24 17:52:46.643	\N	\N
34	api::user-voucher.user-voucher.findOne	2024-10-24 17:52:46.643	2024-10-24 17:52:46.643	\N	\N
35	api::voucher.voucher.findOne	2024-10-24 21:23:45.024	2024-10-24 21:23:45.024	\N	\N
36	api::voucher.voucher.find	2024-10-24 21:23:45.024	2024-10-24 21:23:45.024	\N	\N
37	api::category.category.findOne	2024-10-24 21:51:47.601	2024-10-24 21:51:47.601	\N	\N
38	api::category.category.find	2024-10-24 21:51:47.601	2024-10-24 21:51:47.601	\N	\N
39	plugin::slugify.slugController.findSlug	2024-10-24 22:10:15.061	2024-10-24 22:10:15.061	\N	\N
40	plugin::users-permissions.user.find	2024-10-24 22:40:14.302	2024-10-24 22:40:14.302	\N	\N
41	plugin::users-permissions.user.findOne	2024-10-24 22:40:14.302	2024-10-24 22:40:14.302	\N	\N
42	api::booking.booking.findOne	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
43	api::booking.booking.find	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
44	api::booking.booking.create	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
45	api::booking.booking.update	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
46	api::booking.booking.delete	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
47	api::category.category.find	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
48	api::category.category.findOne	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
49	api::category.category.create	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
50	api::category.category.update	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
51	api::category.category.delete	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
52	api::message.message.find	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
53	api::message.message.findOne	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
54	api::message.message.create	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
55	api::message.message.update	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
56	api::message.message.delete	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
57	api::order.order.findOne	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
58	api::order.order.find	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
59	api::order.order.create	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
60	api::order.order.delete	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
61	api::order-detail.order-detail.find	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
62	api::order.order.update	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
63	api::order-detail.order-detail.findOne	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
64	api::order-detail.order-detail.create	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
65	api::order-detail.order-detail.update	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
66	api::order-detail.order-detail.delete	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
67	api::product.product.find	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
68	api::product.product.findOne	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
69	api::product.product.create	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
70	api::product.product.update	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
71	api::product.product.delete	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
72	api::product-line.product-line.find	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
73	api::product-line.product-line.findOne	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
74	api::product-line.product-line.create	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
75	api::product-line.product-line.update	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
76	api::product-line.product-line.delete	2024-10-24 22:45:41.911	2024-10-24 22:45:41.911	\N	\N
77	api::room.room.find	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
78	api::room.room.findOne	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
79	api::room.room.create	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
80	api::room.room.update	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
81	api::room.room.delete	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
82	api::service.service.find	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
83	api::service.service.findOne	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
84	api::service.service.create	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
85	api::service.service.update	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
86	api::service.service.delete	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
88	api::skin-property.skin-property.findOne	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
87	api::skin-property.skin-property.find	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
89	api::skin-property.skin-property.create	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
90	api::skin-property.skin-property.update	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
91	api::skin-property.skin-property.delete	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
92	api::user-voucher.user-voucher.find	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
93	api::user-voucher.user-voucher.findOne	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
94	api::user-voucher.user-voucher.create	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
95	api::user-voucher.user-voucher.update	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
96	api::user-voucher.user-voucher.delete	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
97	api::voucher.voucher.find	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
98	api::voucher.voucher.findOne	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
108	plugin::upload.content-api.upload	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
118	plugin::users-permissions.auth.sendEmailConfirmation	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
128	plugin::users-permissions.role.find	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
99	api::voucher.voucher.create	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
109	plugin::slugify.slugController.findSlug	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
119	plugin::users-permissions.user.create	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
129	plugin::users-permissions.role.updateRole	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
100	api::voucher.voucher.update	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
110	plugin::i18n.locales.listLocales	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
120	plugin::users-permissions.user.update	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
130	plugin::users-permissions.role.deleteRole	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
101	api::voucher.voucher.delete	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
111	plugin::users-permissions.auth.callback	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
121	plugin::users-permissions.user.find	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
131	plugin::users-permissions.permissions.getPermissions	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
102	plugin::content-type-builder.components.getComponents	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
112	plugin::users-permissions.auth.changePassword	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
122	plugin::users-permissions.user.findOne	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
103	plugin::content-type-builder.components.getComponent	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
113	plugin::users-permissions.auth.resetPassword	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
123	plugin::users-permissions.user.count	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
104	plugin::email.email.send	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
114	plugin::users-permissions.auth.connect	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
124	plugin::users-permissions.user.destroy	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
105	plugin::upload.content-api.find	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
115	plugin::users-permissions.auth.forgotPassword	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
125	plugin::users-permissions.user.me	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
106	plugin::upload.content-api.findOne	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
116	plugin::users-permissions.auth.register	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
126	plugin::users-permissions.role.createRole	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
107	plugin::upload.content-api.destroy	2024-10-24 22:45:41.912	2024-10-24 22:45:41.912	\N	\N
117	plugin::users-permissions.auth.emailConfirmation	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
127	plugin::users-permissions.role.findOne	2024-10-24 22:45:41.913	2024-10-24 22:45:41.913	\N	\N
132	api::product-line.product-line.findOne	2024-10-25 14:46:25.682	2024-10-25 14:46:25.682	\N	\N
133	api::product-line.product-line.find	2024-10-25 14:46:25.682	2024-10-25 14:46:25.682	\N	\N
134	api::skin-property.skin-property.find	2024-10-25 14:55:47.166	2024-10-25 14:55:47.166	\N	\N
135	api::skin-property.skin-property.findOne	2024-10-25 14:55:47.166	2024-10-25 14:55:47.166	\N	\N
142	api::order.order.findOne	2024-10-26 23:10:53.39	2024-10-26 23:10:53.39	\N	\N
143	api::order.order.find	2024-10-26 23:10:53.39	2024-10-26 23:10:53.39	\N	\N
144	api::order.order.create	2024-10-26 23:10:53.39	2024-10-26 23:10:53.39	\N	\N
145	api::order-detail.order-detail.find	2024-10-26 23:10:53.39	2024-10-26 23:10:53.39	\N	\N
146	api::order-detail.order-detail.findOne	2024-10-26 23:10:53.39	2024-10-26 23:10:53.39	\N	\N
147	api::order-detail.order-detail.create	2024-10-26 23:10:53.39	2024-10-26 23:10:53.39	\N	\N
149	api::booking.booking.find	2024-10-27 22:30:59.176	2024-10-27 22:30:59.176	\N	\N
148	api::booking.booking.findOne	2024-10-27 22:30:59.176	2024-10-27 22:30:59.176	\N	\N
150	api::booking.booking.create	2024-10-27 22:30:59.176	2024-10-27 22:30:59.176	\N	\N
151	plugin::users-permissions.user.create	2024-10-28 11:18:09.76	2024-10-28 11:18:09.76	\N	\N
152	plugin::users-permissions.user.update	2024-10-28 11:18:09.76	2024-10-28 11:18:09.76	\N	\N
153	api::order.order.update	2024-10-28 14:36:48.34	2024-10-28 14:36:48.34	\N	\N
154	api::booking.booking.update	2024-10-28 21:58:09.494	2024-10-28 21:58:09.494	\N	\N
155	api::user-voucher.user-voucher.create	2024-10-30 16:11:51.668	2024-10-30 16:11:51.668	\N	\N
\.


--
-- Data for Name: up_permissions_role_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.up_permissions_role_links (id, permission_id, role_id, permission_order) FROM stdin;
2	2	1	1
3	3	2	1
4	4	2	1
5	5	2	1
6	6	2	1
7	7	2	1
8	9	2	2
9	8	2	2
10	10	2	3
11	11	2	4
12	12	2	4
13	14	2	5
14	17	2	5
15	13	2	5
16	15	2	5
17	16	2	5
18	19	2	5
19	18	2	5
20	20	2	5
21	21	2	5
22	22	2	5
25	25	1	2
29	30	1	3
30	29	1	3
31	32	1	4
32	31	1	4
34	34	1	5
33	33	1	5
36	36	1	6
35	35	1	6
37	38	1	7
38	37	1	7
39	39	1	8
40	40	1	9
41	41	1	9
42	43	3	1
43	42	3	1
44	44	3	1
45	45	3	1
46	46	3	1
47	47	3	1
48	48	3	1
49	49	3	1
50	50	3	1
51	51	3	1
52	52	3	2
53	53	3	2
54	54	3	2
55	55	3	2
56	57	3	2
57	56	3	2
58	59	3	2
59	58	3	2
60	60	3	2
61	61	3	3
62	63	3	3
63	62	3	3
64	64	3	3
65	65	3	4
66	66	3	4
67	67	3	4
68	68	3	4
69	69	3	4
70	70	3	4
71	71	3	4
72	72	3	4
73	73	3	4
74	74	3	4
75	75	3	5
76	76	3	5
77	77	3	5
78	78	3	5
79	79	3	5
80	80	3	5
81	81	3	5
82	82	3	6
83	83	3	6
84	84	3	6
85	85	3	6
86	86	3	7
87	87	3	7
88	88	3	7
89	89	3	7
90	90	3	7
91	91	3	7
92	92	3	7
93	93	3	7
94	94	3	8
95	95	3	8
96	96	3	8
97	97	3	8
98	98	3	9
99	99	3	9
100	100	3	9
101	101	3	9
102	102	3	9
103	103	3	9
104	104	3	9
105	105	3	10
106	106	3	10
107	107	3	10
108	108	3	10
109	109	3	10
110	110	3	10
111	111	3	11
112	112	3	11
113	113	3	11
114	114	3	11
115	115	3	11
116	116	3	11
117	117	3	12
118	118	3	12
119	119	3	12
120	120	3	12
121	121	3	12
122	122	3	12
123	123	3	12
124	124	3	13
125	125	3	13
126	126	3	13
127	127	3	13
128	128	3	13
129	129	3	14
130	130	3	14
131	131	3	14
132	133	1	10
133	132	1	10
134	134	1	11
135	135	1	11
142	142	1	12
143	144	1	12
144	143	1	12
145	146	1	12
146	145	1	12
147	147	1	13
148	148	1	14
149	149	1	14
150	150	1	14
151	151	1	15
152	152	1	15
153	153	1	16
154	154	1	17
155	155	1	18
\.


--
-- Data for Name: up_roles; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.up_roles (id, name, description, type, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
2	Public	Default role given to unauthenticated user.	public	2024-10-19 19:44:08.265	2024-10-23 23:02:51.69	\N	\N
3	Admin	Admin	admin	2024-10-24 22:45:41.896	2024-10-24 22:45:41.896	\N	\N
1	Authenticated	Default role given to authenticated user.	authenticated	2024-10-19 19:44:08.252	2024-10-30 16:11:51.654	\N	\N
\.


--
-- Data for Name: up_users; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.up_users (id, username, email, provider, password, reset_password_token, confirmation_token, confirmed, blocked, address, full_name, phone, gender, type, created_at, updated_at, created_by_id, updated_by_id, birthday) FROM stdin;
2	devtest1@gmail.com	devtest1@gmail.com	local	$2a$10$5kd1i3HEsBNZ4U.HqzbkSOismvSe9.T6INg76ZrP5L4MFnZ3m7SWW	\N	\N	t	f	\N	devtest1@gmail.com	0981231234	male	\N	2024-10-21 22:55:14.12	2024-10-21 22:55:14.12	\N	\N	2024-09-01
4	dev@gmail.com	dev@gmail.com	local	$2a$10$BA5wfo9kzo/JrIrWezIi2OKgAW5NLiqAbejLQYy4vwmjzTO4eC9FO	\N	\N	t	f	\N	dev@gmail.com	0981234567	male	\N	2024-10-21 22:58:59.366	2024-10-21 22:58:59.366	\N	\N	2024-10-10
5	dev1@gmail.com	dev1@gmail.com	local	$2a$10$f6tGUlAhrBJMNAmcVXMmkO9fgnvIHM3TW.hncYxJTAAChkU9pWp12	\N	\N	t	f	\N	dev1@gmail.com	0981234567	male	\N	2024-10-21 23:00:54.657	2024-10-21 23:00:54.657	\N	\N	2024-10-01
6	admin	admin@gmail.com	local	$2a$10$UzXairKqefjF6offZgc9DuavhAYaQ.tvQpHdPguJDjFjxpbA1VOYu	\N	\N	t	f	\N	\N	\N	\N	ADMIN	2024-10-24 22:36:43.884	2024-10-24 22:45:55.915	1	1	\N
3	devtest2@gmail.com	devtest2@gmail.com	local	$2a$10$DxxYWwv6eCJcLmckhcAzBOrqFJMZHTeuFQTxO32Yq8qpHOya5sh2i	\N	\N	t	f	123123, X├ú Cß║ºn N├┤ng, Huyß╗çn H├á Quß║úng, Tß╗ënh Cao Bß║▒ng	devtest2@gmail.com	0981234567	male	\N	2024-10-21 22:57:25.668	2024-10-29 22:22:33.303	\N	1	2024-10-01
1	hautrinh	hautrinh@gmail.com	local	$2a$10$fUDS.GjD0M3MNxdIzmhXNO.p0ABjg6YOyymJ0UQDT8oVC.cNpYzZO	\N	\N	f	f	123/4 ─É╞░ß╗¥ng sß╗æ 1, X├ú Tr╞░ß╗¥ng ─É├┤ng, Thß╗ï x├ú H├▓a Th├ánh, Tß╗ënh T├óy Ninh	Trß╗ïnh V─ân Hß║¡u	0981234567	male	USER	2024-10-21 22:01:54.464	2024-10-30 17:22:39.124	1	1	2024-10-09
\.


--
-- Data for Name: up_users_role_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.up_users_role_links (id, user_id, role_id, user_order) FROM stdin;
3	2	1	1
4	3	1	2
5	4	1	3
6	5	1	4
7	1	1	5
9	6	3	1
\.


--
-- Data for Name: upload_folders; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.upload_folders (id, name, path_id, path, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
1	API Uploads	1	/1	2024-10-24 22:49:45.842	2024-10-24 22:49:45.842	\N	\N
\.


--
-- Data for Name: upload_folders_parent_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.upload_folders_parent_links (id, folder_id, inv_folder_id, folder_order) FROM stdin;
\.


--
-- Data for Name: user_vouchers; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.user_vouchers (id, status, created_at, updated_at, created_by_id, updated_by_id) FROM stdin;
53	UNUSED	2024-10-30 17:21:51.098	2024-10-30 17:21:51.098	\N	\N
\.


--
-- Data for Name: user_vouchers_user_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.user_vouchers_user_links (id, user_voucher_id, user_id) FROM stdin;
53	53	1
\.


--
-- Data for Name: user_vouchers_voucher_links; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.user_vouchers_voucher_links (id, user_voucher_id, voucher_id) FROM stdin;
53	53	7
\.


--
-- Data for Name: vouchers; Type: TABLE DATA; Schema: public; Owner: missha_user
--

COPY public.vouchers (id, code, amount_decrease, title, created_at, updated_at, created_by_id, updated_by_id, public) FROM stdin;
1	NEW_MEMBER	15000	D├ánh cho kh├íc h├áng mß╗¢i cß╗ºa Missha	2024-10-24 17:51:40.815	2024-10-30 15:24:50.633	1	1	t
2	BLACK_DAY	30000	BLACK_DAY	2024-10-24 21:44:39.927	2024-10-31 09:17:40.127	1	1	t
4	CODE_12313	20000	CODE_123132	2024-10-29 17:30:14.383	2024-10-31 09:17:49.927	\N	1	t
6	TEST_123	25000	Dev test 123	2024-10-30 15:52:14.673	2024-10-31 09:32:27.186	1	1	t
7	NEW_MEMBER_12_2025	10000	1223	2024-10-30 17:20:32.864	2024-10-31 09:32:44.39	1	1	t
\.


--
-- Name: admin_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.admin_permissions_id_seq', 260, true);


--
-- Name: admin_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.admin_permissions_role_links_id_seq', 260, true);


--
-- Name: admin_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.admin_roles_id_seq', 3, true);


--
-- Name: admin_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.admin_users_id_seq', 1, true);


--
-- Name: admin_users_roles_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.admin_users_roles_links_id_seq', 2, true);


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.bookings_id_seq', 10, true);


--
-- Name: bookings_service_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.bookings_service_links_id_seq', 16, true);


--
-- Name: bookings_user_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.bookings_user_links_id_seq', 12, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.categories_id_seq', 11, true);


--
-- Name: files_folder_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.files_folder_links_id_seq', 16, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.files_id_seq', 74, true);


--
-- Name: files_related_morphs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.files_related_morphs_id_seq', 250, true);


--
-- Name: i18n_locale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.i18n_locale_id_seq', 1, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.messages_id_seq', 1, false);


--
-- Name: messages_room_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.messages_room_links_id_seq', 1, false);


--
-- Name: messages_sender_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.messages_sender_links_id_seq', 1, false);


--
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.order_details_id_seq', 26, true);


--
-- Name: order_details_order_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.order_details_order_links_id_seq', 25, true);


--
-- Name: order_details_product_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.order_details_product_links_id_seq', 26, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.orders_id_seq', 16, true);


--
-- Name: orders_user_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.orders_user_links_id_seq', 16, true);


--
-- Name: orders_voucher_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.orders_voucher_links_id_seq', 8, true);


--
-- Name: product_lines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.product_lines_id_seq', 14, true);


--
-- Name: products_categories_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.products_categories_links_id_seq', 17, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.products_id_seq', 6, true);


--
-- Name: products_product_line_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.products_product_line_links_id_seq', 16, true);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.rooms_id_seq', 1, false);


--
-- Name: rooms_user_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.rooms_user_links_id_seq', 1, false);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.services_id_seq', 18, true);


--
-- Name: skin_properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.skin_properties_id_seq', 11, true);


--
-- Name: skin_properties_products_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.skin_properties_products_links_id_seq', 29, true);


--
-- Name: slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.slugs_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_id_seq', 1, false);


--
-- Name: strapi_api_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.strapi_api_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_api_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.strapi_api_tokens_id_seq', 1, false);


--
-- Name: strapi_core_store_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.strapi_core_store_settings_id_seq', 44, true);


--
-- Name: strapi_database_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.strapi_database_schema_id_seq', 9, true);


--
-- Name: strapi_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.strapi_migrations_id_seq', 1, false);


--
-- Name: strapi_release_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.strapi_release_actions_id_seq', 1, false);


--
-- Name: strapi_release_actions_release_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.strapi_release_actions_release_links_id_seq', 1, false);


--
-- Name: strapi_releases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.strapi_releases_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_id_seq', 1, false);


--
-- Name: strapi_transfer_token_permissions_token_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.strapi_transfer_token_permissions_token_links_id_seq', 1, false);


--
-- Name: strapi_transfer_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.strapi_transfer_tokens_id_seq', 1, false);


--
-- Name: strapi_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.strapi_webhooks_id_seq', 1, false);


--
-- Name: up_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.up_permissions_id_seq', 155, true);


--
-- Name: up_permissions_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.up_permissions_role_links_id_seq', 155, true);


--
-- Name: up_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.up_roles_id_seq', 3, true);


--
-- Name: up_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.up_users_id_seq', 6, true);


--
-- Name: up_users_role_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.up_users_role_links_id_seq', 9, true);


--
-- Name: upload_folders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.upload_folders_id_seq', 1, true);


--
-- Name: upload_folders_parent_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.upload_folders_parent_links_id_seq', 1, false);


--
-- Name: user_vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.user_vouchers_id_seq', 53, true);


--
-- Name: user_vouchers_user_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.user_vouchers_user_links_id_seq', 53, true);


--
-- Name: user_vouchers_voucher_links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.user_vouchers_voucher_links_id_seq', 53, true);


--
-- Name: vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: missha_user
--

SELECT pg_catalog.setval('public.vouchers_id_seq', 7, true);


--
-- Name: admin_permissions admin_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_role_links admin_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: admin_roles admin_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_pkey PRIMARY KEY (id);


--
-- Name: admin_users admin_users_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_pkey PRIMARY KEY (id);


--
-- Name: admin_users_roles_links admin_users_roles_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_unique UNIQUE (user_id, role_id);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: bookings_service_links bookings_service_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.bookings_service_links
    ADD CONSTRAINT bookings_service_links_pkey PRIMARY KEY (id);


--
-- Name: bookings_service_links bookings_service_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.bookings_service_links
    ADD CONSTRAINT bookings_service_links_unique UNIQUE (booking_id, service_id);


--
-- Name: bookings_user_links bookings_user_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.bookings_user_links
    ADD CONSTRAINT bookings_user_links_pkey PRIMARY KEY (id);


--
-- Name: bookings_user_links bookings_user_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.bookings_user_links
    ADD CONSTRAINT bookings_user_links_unique UNIQUE (booking_id, user_id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: files_folder_links files_folder_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_pkey PRIMARY KEY (id);


--
-- Name: files_folder_links files_folder_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_unique UNIQUE (file_id, folder_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: files_related_morphs files_related_morphs_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_pkey PRIMARY KEY (id);


--
-- Name: i18n_locale i18n_locale_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: messages_room_links messages_room_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.messages_room_links
    ADD CONSTRAINT messages_room_links_pkey PRIMARY KEY (id);


--
-- Name: messages_room_links messages_room_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.messages_room_links
    ADD CONSTRAINT messages_room_links_unique UNIQUE (message_id, room_id);


--
-- Name: messages_sender_links messages_sender_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.messages_sender_links
    ADD CONSTRAINT messages_sender_links_pkey PRIMARY KEY (id);


--
-- Name: messages_sender_links messages_sender_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.messages_sender_links
    ADD CONSTRAINT messages_sender_links_unique UNIQUE (message_id, user_id);


--
-- Name: order_details_order_links order_details_order_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.order_details_order_links
    ADD CONSTRAINT order_details_order_links_pkey PRIMARY KEY (id);


--
-- Name: order_details_order_links order_details_order_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.order_details_order_links
    ADD CONSTRAINT order_details_order_links_unique UNIQUE (order_detail_id, order_id);


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- Name: order_details_product_links order_details_product_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.order_details_product_links
    ADD CONSTRAINT order_details_product_links_pkey PRIMARY KEY (id);


--
-- Name: order_details_product_links order_details_product_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.order_details_product_links
    ADD CONSTRAINT order_details_product_links_unique UNIQUE (order_detail_id, product_id);


--
-- Name: orders orders_order_code_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_order_code_unique UNIQUE (order_code);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: orders_user_links orders_user_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.orders_user_links
    ADD CONSTRAINT orders_user_links_pkey PRIMARY KEY (id);


--
-- Name: orders_user_links orders_user_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.orders_user_links
    ADD CONSTRAINT orders_user_links_unique UNIQUE (order_id, user_id);


--
-- Name: orders_voucher_links orders_voucher_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.orders_voucher_links
    ADD CONSTRAINT orders_voucher_links_pkey PRIMARY KEY (id);


--
-- Name: orders_voucher_links orders_voucher_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.orders_voucher_links
    ADD CONSTRAINT orders_voucher_links_unique UNIQUE (order_id, voucher_id);


--
-- Name: product_lines product_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.product_lines
    ADD CONSTRAINT product_lines_pkey PRIMARY KEY (id);


--
-- Name: products_categories_links products_categories_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.products_categories_links
    ADD CONSTRAINT products_categories_links_pkey PRIMARY KEY (id);


--
-- Name: products_categories_links products_categories_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.products_categories_links
    ADD CONSTRAINT products_categories_links_unique UNIQUE (product_id, category_id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products_product_line_links products_product_line_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.products_product_line_links
    ADD CONSTRAINT products_product_line_links_pkey PRIMARY KEY (id);


--
-- Name: products_product_line_links products_product_line_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.products_product_line_links
    ADD CONSTRAINT products_product_line_links_unique UNIQUE (product_id, product_line_id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_room_id_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_room_id_unique UNIQUE (room_id);


--
-- Name: rooms_user_links rooms_user_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.rooms_user_links
    ADD CONSTRAINT rooms_user_links_pkey PRIMARY KEY (id);


--
-- Name: rooms_user_links rooms_user_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.rooms_user_links
    ADD CONSTRAINT rooms_user_links_unique UNIQUE (room_id, user_id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: skin_properties skin_properties_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.skin_properties
    ADD CONSTRAINT skin_properties_pkey PRIMARY KEY (id);


--
-- Name: skin_properties_products_links skin_properties_products_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.skin_properties_products_links
    ADD CONSTRAINT skin_properties_products_links_pkey PRIMARY KEY (id);


--
-- Name: skin_properties_products_links skin_properties_products_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.skin_properties_products_links
    ADD CONSTRAINT skin_properties_products_links_unique UNIQUE (skin_property_id, product_id);


--
-- Name: slugs slugs_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.slugs
    ADD CONSTRAINT slugs_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_unique UNIQUE (api_token_permission_id, api_token_id);


--
-- Name: strapi_api_tokens strapi_api_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_core_store_settings strapi_core_store_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_core_store_settings
    ADD CONSTRAINT strapi_core_store_settings_pkey PRIMARY KEY (id);


--
-- Name: strapi_database_schema strapi_database_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_database_schema
    ADD CONSTRAINT strapi_database_schema_pkey PRIMARY KEY (id);


--
-- Name: strapi_migrations strapi_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_migrations
    ADD CONSTRAINT strapi_migrations_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions strapi_release_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_links strapi_release_actions_release_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_release_actions_release_links
    ADD CONSTRAINT strapi_release_actions_release_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_release_actions_release_links strapi_release_actions_release_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_release_actions_release_links
    ADD CONSTRAINT strapi_release_actions_release_links_unique UNIQUE (release_action_id, release_id);


--
-- Name: strapi_releases strapi_releases_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_pkey PRIMARY KEY (id);


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_unique UNIQUE (transfer_token_permission_id, transfer_token_id);


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_pkey PRIMARY KEY (id);


--
-- Name: strapi_webhooks strapi_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_webhooks
    ADD CONSTRAINT strapi_webhooks_pkey PRIMARY KEY (id);


--
-- Name: up_permissions up_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_permissions_role_links up_permissions_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_unique UNIQUE (permission_id, role_id);


--
-- Name: up_roles up_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_pkey PRIMARY KEY (id);


--
-- Name: up_users up_users_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_pkey PRIMARY KEY (id);


--
-- Name: up_users_role_links up_users_role_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_unique UNIQUE (user_id, role_id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_pkey PRIMARY KEY (id);


--
-- Name: upload_folders_parent_links upload_folders_parent_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_unique UNIQUE (folder_id, inv_folder_id);


--
-- Name: upload_folders upload_folders_path_id_index; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_id_index UNIQUE (path_id);


--
-- Name: upload_folders upload_folders_path_index; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_path_index UNIQUE (path);


--
-- Name: upload_folders upload_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_pkey PRIMARY KEY (id);


--
-- Name: user_vouchers user_vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.user_vouchers
    ADD CONSTRAINT user_vouchers_pkey PRIMARY KEY (id);


--
-- Name: user_vouchers_user_links user_vouchers_user_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.user_vouchers_user_links
    ADD CONSTRAINT user_vouchers_user_links_pkey PRIMARY KEY (id);


--
-- Name: user_vouchers_user_links user_vouchers_user_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.user_vouchers_user_links
    ADD CONSTRAINT user_vouchers_user_links_unique UNIQUE (user_voucher_id, user_id);


--
-- Name: user_vouchers_voucher_links user_vouchers_voucher_links_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.user_vouchers_voucher_links
    ADD CONSTRAINT user_vouchers_voucher_links_pkey PRIMARY KEY (id);


--
-- Name: user_vouchers_voucher_links user_vouchers_voucher_links_unique; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.user_vouchers_voucher_links
    ADD CONSTRAINT user_vouchers_voucher_links_unique UNIQUE (user_voucher_id, voucher_id);


--
-- Name: vouchers vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_pkey PRIMARY KEY (id);


--
-- Name: admin_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX admin_permissions_created_by_id_fk ON public.admin_permissions USING btree (created_by_id);


--
-- Name: admin_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX admin_permissions_role_links_fk ON public.admin_permissions_role_links USING btree (permission_id);


--
-- Name: admin_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX admin_permissions_role_links_inv_fk ON public.admin_permissions_role_links USING btree (role_id);


--
-- Name: admin_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX admin_permissions_role_links_order_inv_fk ON public.admin_permissions_role_links USING btree (permission_order);


--
-- Name: admin_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX admin_permissions_updated_by_id_fk ON public.admin_permissions USING btree (updated_by_id);


--
-- Name: admin_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX admin_roles_created_by_id_fk ON public.admin_roles USING btree (created_by_id);


--
-- Name: admin_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX admin_roles_updated_by_id_fk ON public.admin_roles USING btree (updated_by_id);


--
-- Name: admin_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX admin_users_created_by_id_fk ON public.admin_users USING btree (created_by_id);


--
-- Name: admin_users_roles_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX admin_users_roles_links_fk ON public.admin_users_roles_links USING btree (user_id);


--
-- Name: admin_users_roles_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX admin_users_roles_links_inv_fk ON public.admin_users_roles_links USING btree (role_id);


--
-- Name: admin_users_roles_links_order_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX admin_users_roles_links_order_fk ON public.admin_users_roles_links USING btree (role_order);


--
-- Name: admin_users_roles_links_order_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX admin_users_roles_links_order_inv_fk ON public.admin_users_roles_links USING btree (user_order);


--
-- Name: admin_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX admin_users_updated_by_id_fk ON public.admin_users USING btree (updated_by_id);


--
-- Name: bookings_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX bookings_created_by_id_fk ON public.bookings USING btree (created_by_id);


--
-- Name: bookings_service_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX bookings_service_links_fk ON public.bookings_service_links USING btree (booking_id);


--
-- Name: bookings_service_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX bookings_service_links_inv_fk ON public.bookings_service_links USING btree (service_id);


--
-- Name: bookings_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX bookings_updated_by_id_fk ON public.bookings USING btree (updated_by_id);


--
-- Name: bookings_user_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX bookings_user_links_fk ON public.bookings_user_links USING btree (booking_id);


--
-- Name: bookings_user_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX bookings_user_links_inv_fk ON public.bookings_user_links USING btree (user_id);


--
-- Name: categories_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX categories_created_by_id_fk ON public.categories USING btree (created_by_id);


--
-- Name: categories_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX categories_updated_by_id_fk ON public.categories USING btree (updated_by_id);


--
-- Name: files_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX files_created_by_id_fk ON public.files USING btree (created_by_id);


--
-- Name: files_folder_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX files_folder_links_fk ON public.files_folder_links USING btree (file_id);


--
-- Name: files_folder_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX files_folder_links_inv_fk ON public.files_folder_links USING btree (folder_id);


--
-- Name: files_folder_links_order_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX files_folder_links_order_inv_fk ON public.files_folder_links USING btree (file_order);


--
-- Name: files_related_morphs_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX files_related_morphs_fk ON public.files_related_morphs USING btree (file_id);


--
-- Name: files_related_morphs_id_column_index; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX files_related_morphs_id_column_index ON public.files_related_morphs USING btree (related_id);


--
-- Name: files_related_morphs_order_index; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX files_related_morphs_order_index ON public.files_related_morphs USING btree ("order");


--
-- Name: files_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX files_updated_by_id_fk ON public.files USING btree (updated_by_id);


--
-- Name: i18n_locale_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX i18n_locale_created_by_id_fk ON public.i18n_locale USING btree (created_by_id);


--
-- Name: i18n_locale_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX i18n_locale_updated_by_id_fk ON public.i18n_locale USING btree (updated_by_id);


--
-- Name: messages_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX messages_created_by_id_fk ON public.messages USING btree (created_by_id);


--
-- Name: messages_room_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX messages_room_links_fk ON public.messages_room_links USING btree (message_id);


--
-- Name: messages_room_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX messages_room_links_inv_fk ON public.messages_room_links USING btree (room_id);


--
-- Name: messages_sender_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX messages_sender_links_fk ON public.messages_sender_links USING btree (message_id);


--
-- Name: messages_sender_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX messages_sender_links_inv_fk ON public.messages_sender_links USING btree (user_id);


--
-- Name: messages_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX messages_updated_by_id_fk ON public.messages USING btree (updated_by_id);


--
-- Name: order_details_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX order_details_created_by_id_fk ON public.order_details USING btree (created_by_id);


--
-- Name: order_details_order_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX order_details_order_links_fk ON public.order_details_order_links USING btree (order_detail_id);


--
-- Name: order_details_order_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX order_details_order_links_inv_fk ON public.order_details_order_links USING btree (order_id);


--
-- Name: order_details_order_links_order_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX order_details_order_links_order_inv_fk ON public.order_details_order_links USING btree (order_detail_order);


--
-- Name: order_details_product_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX order_details_product_links_fk ON public.order_details_product_links USING btree (order_detail_id);


--
-- Name: order_details_product_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX order_details_product_links_inv_fk ON public.order_details_product_links USING btree (product_id);


--
-- Name: order_details_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX order_details_updated_by_id_fk ON public.order_details USING btree (updated_by_id);


--
-- Name: orders_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX orders_created_by_id_fk ON public.orders USING btree (created_by_id);


--
-- Name: orders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX orders_updated_by_id_fk ON public.orders USING btree (updated_by_id);


--
-- Name: orders_user_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX orders_user_links_fk ON public.orders_user_links USING btree (order_id);


--
-- Name: orders_user_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX orders_user_links_inv_fk ON public.orders_user_links USING btree (user_id);


--
-- Name: orders_voucher_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX orders_voucher_links_fk ON public.orders_voucher_links USING btree (order_id);


--
-- Name: orders_voucher_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX orders_voucher_links_inv_fk ON public.orders_voucher_links USING btree (voucher_id);


--
-- Name: product_lines_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX product_lines_created_by_id_fk ON public.product_lines USING btree (created_by_id);


--
-- Name: product_lines_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX product_lines_updated_by_id_fk ON public.product_lines USING btree (updated_by_id);


--
-- Name: products_categories_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX products_categories_links_fk ON public.products_categories_links USING btree (product_id);


--
-- Name: products_categories_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX products_categories_links_inv_fk ON public.products_categories_links USING btree (category_id);


--
-- Name: products_categories_links_order_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX products_categories_links_order_fk ON public.products_categories_links USING btree (category_order);


--
-- Name: products_categories_links_order_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX products_categories_links_order_inv_fk ON public.products_categories_links USING btree (product_order);


--
-- Name: products_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX products_created_by_id_fk ON public.products USING btree (created_by_id);


--
-- Name: products_product_line_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX products_product_line_links_fk ON public.products_product_line_links USING btree (product_id);


--
-- Name: products_product_line_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX products_product_line_links_inv_fk ON public.products_product_line_links USING btree (product_line_id);


--
-- Name: products_product_line_links_order_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX products_product_line_links_order_inv_fk ON public.products_product_line_links USING btree (product_order);


--
-- Name: products_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX products_updated_by_id_fk ON public.products USING btree (updated_by_id);


--
-- Name: rooms_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX rooms_created_by_id_fk ON public.rooms USING btree (created_by_id);


--
-- Name: rooms_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX rooms_updated_by_id_fk ON public.rooms USING btree (updated_by_id);


--
-- Name: rooms_user_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX rooms_user_links_fk ON public.rooms_user_links USING btree (room_id);


--
-- Name: rooms_user_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX rooms_user_links_inv_fk ON public.rooms_user_links USING btree (user_id);


--
-- Name: services_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX services_created_by_id_fk ON public.services USING btree (created_by_id);


--
-- Name: services_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX services_updated_by_id_fk ON public.services USING btree (updated_by_id);


--
-- Name: skin_properties_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX skin_properties_created_by_id_fk ON public.skin_properties USING btree (created_by_id);


--
-- Name: skin_properties_products_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX skin_properties_products_links_fk ON public.skin_properties_products_links USING btree (skin_property_id);


--
-- Name: skin_properties_products_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX skin_properties_products_links_inv_fk ON public.skin_properties_products_links USING btree (product_id);


--
-- Name: skin_properties_products_links_order_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX skin_properties_products_links_order_fk ON public.skin_properties_products_links USING btree (product_order);


--
-- Name: skin_properties_products_links_order_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX skin_properties_products_links_order_inv_fk ON public.skin_properties_products_links USING btree (skin_property_order);


--
-- Name: skin_properties_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX skin_properties_updated_by_id_fk ON public.skin_properties USING btree (updated_by_id);


--
-- Name: slugs_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX slugs_created_by_id_fk ON public.slugs USING btree (created_by_id);


--
-- Name: slugs_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX slugs_updated_by_id_fk ON public.slugs USING btree (updated_by_id);


--
-- Name: strapi_api_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_api_token_permissions_created_by_id_fk ON public.strapi_api_token_permissions USING btree (created_by_id);


--
-- Name: strapi_api_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_api_token_permissions_token_links_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_id);


--
-- Name: strapi_api_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_api_token_permissions_token_links_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_id);


--
-- Name: strapi_api_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_api_token_permissions_token_links_order_inv_fk ON public.strapi_api_token_permissions_token_links USING btree (api_token_permission_order);


--
-- Name: strapi_api_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_api_token_permissions_updated_by_id_fk ON public.strapi_api_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_api_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_api_tokens_created_by_id_fk ON public.strapi_api_tokens USING btree (created_by_id);


--
-- Name: strapi_api_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_api_tokens_updated_by_id_fk ON public.strapi_api_tokens USING btree (updated_by_id);


--
-- Name: strapi_release_actions_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_release_actions_created_by_id_fk ON public.strapi_release_actions USING btree (created_by_id);


--
-- Name: strapi_release_actions_release_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_release_actions_release_links_fk ON public.strapi_release_actions_release_links USING btree (release_action_id);


--
-- Name: strapi_release_actions_release_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_release_actions_release_links_inv_fk ON public.strapi_release_actions_release_links USING btree (release_id);


--
-- Name: strapi_release_actions_release_links_order_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_release_actions_release_links_order_inv_fk ON public.strapi_release_actions_release_links USING btree (release_action_order);


--
-- Name: strapi_release_actions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_release_actions_updated_by_id_fk ON public.strapi_release_actions USING btree (updated_by_id);


--
-- Name: strapi_releases_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_releases_created_by_id_fk ON public.strapi_releases USING btree (created_by_id);


--
-- Name: strapi_releases_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_releases_updated_by_id_fk ON public.strapi_releases USING btree (updated_by_id);


--
-- Name: strapi_transfer_token_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_transfer_token_permissions_created_by_id_fk ON public.strapi_transfer_token_permissions USING btree (created_by_id);


--
-- Name: strapi_transfer_token_permissions_token_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_transfer_token_permissions_token_links_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_id);


--
-- Name: strapi_transfer_token_permissions_token_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_transfer_token_permissions_token_links_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_id);


--
-- Name: strapi_transfer_token_permissions_token_links_order_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_transfer_token_permissions_token_links_order_inv_fk ON public.strapi_transfer_token_permissions_token_links USING btree (transfer_token_permission_order);


--
-- Name: strapi_transfer_token_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_transfer_token_permissions_updated_by_id_fk ON public.strapi_transfer_token_permissions USING btree (updated_by_id);


--
-- Name: strapi_transfer_tokens_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_transfer_tokens_created_by_id_fk ON public.strapi_transfer_tokens USING btree (created_by_id);


--
-- Name: strapi_transfer_tokens_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX strapi_transfer_tokens_updated_by_id_fk ON public.strapi_transfer_tokens USING btree (updated_by_id);


--
-- Name: up_permissions_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX up_permissions_created_by_id_fk ON public.up_permissions USING btree (created_by_id);


--
-- Name: up_permissions_role_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX up_permissions_role_links_fk ON public.up_permissions_role_links USING btree (permission_id);


--
-- Name: up_permissions_role_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX up_permissions_role_links_inv_fk ON public.up_permissions_role_links USING btree (role_id);


--
-- Name: up_permissions_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX up_permissions_role_links_order_inv_fk ON public.up_permissions_role_links USING btree (permission_order);


--
-- Name: up_permissions_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX up_permissions_updated_by_id_fk ON public.up_permissions USING btree (updated_by_id);


--
-- Name: up_roles_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX up_roles_created_by_id_fk ON public.up_roles USING btree (created_by_id);


--
-- Name: up_roles_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX up_roles_updated_by_id_fk ON public.up_roles USING btree (updated_by_id);


--
-- Name: up_users_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX up_users_created_by_id_fk ON public.up_users USING btree (created_by_id);


--
-- Name: up_users_role_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX up_users_role_links_fk ON public.up_users_role_links USING btree (user_id);


--
-- Name: up_users_role_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX up_users_role_links_inv_fk ON public.up_users_role_links USING btree (role_id);


--
-- Name: up_users_role_links_order_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX up_users_role_links_order_inv_fk ON public.up_users_role_links USING btree (user_order);


--
-- Name: up_users_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX up_users_updated_by_id_fk ON public.up_users USING btree (updated_by_id);


--
-- Name: upload_files_created_at_index; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX upload_files_created_at_index ON public.files USING btree (created_at);


--
-- Name: upload_files_ext_index; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX upload_files_ext_index ON public.files USING btree (ext);


--
-- Name: upload_files_folder_path_index; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX upload_files_folder_path_index ON public.files USING btree (folder_path);


--
-- Name: upload_files_name_index; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX upload_files_name_index ON public.files USING btree (name);


--
-- Name: upload_files_size_index; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX upload_files_size_index ON public.files USING btree (size);


--
-- Name: upload_files_updated_at_index; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX upload_files_updated_at_index ON public.files USING btree (updated_at);


--
-- Name: upload_folders_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX upload_folders_created_by_id_fk ON public.upload_folders USING btree (created_by_id);


--
-- Name: upload_folders_parent_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX upload_folders_parent_links_fk ON public.upload_folders_parent_links USING btree (folder_id);


--
-- Name: upload_folders_parent_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX upload_folders_parent_links_inv_fk ON public.upload_folders_parent_links USING btree (inv_folder_id);


--
-- Name: upload_folders_parent_links_order_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX upload_folders_parent_links_order_inv_fk ON public.upload_folders_parent_links USING btree (folder_order);


--
-- Name: upload_folders_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX upload_folders_updated_by_id_fk ON public.upload_folders USING btree (updated_by_id);


--
-- Name: user_vouchers_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX user_vouchers_created_by_id_fk ON public.user_vouchers USING btree (created_by_id);


--
-- Name: user_vouchers_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX user_vouchers_updated_by_id_fk ON public.user_vouchers USING btree (updated_by_id);


--
-- Name: user_vouchers_user_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX user_vouchers_user_links_fk ON public.user_vouchers_user_links USING btree (user_voucher_id);


--
-- Name: user_vouchers_user_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX user_vouchers_user_links_inv_fk ON public.user_vouchers_user_links USING btree (user_id);


--
-- Name: user_vouchers_voucher_links_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX user_vouchers_voucher_links_fk ON public.user_vouchers_voucher_links USING btree (user_voucher_id);


--
-- Name: user_vouchers_voucher_links_inv_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX user_vouchers_voucher_links_inv_fk ON public.user_vouchers_voucher_links USING btree (voucher_id);


--
-- Name: vouchers_created_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX vouchers_created_by_id_fk ON public.vouchers USING btree (created_by_id);


--
-- Name: vouchers_updated_by_id_fk; Type: INDEX; Schema: public; Owner: missha_user
--

CREATE INDEX vouchers_updated_by_id_fk ON public.vouchers USING btree (updated_by_id);


--
-- Name: admin_permissions admin_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.admin_permissions(id) ON DELETE CASCADE;


--
-- Name: admin_permissions_role_links admin_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_permissions_role_links
    ADD CONSTRAINT admin_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_permissions admin_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_permissions
    ADD CONSTRAINT admin_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_roles admin_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_roles
    ADD CONSTRAINT admin_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users admin_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: admin_users_roles_links admin_users_roles_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_fk FOREIGN KEY (user_id) REFERENCES public.admin_users(id) ON DELETE CASCADE;


--
-- Name: admin_users_roles_links admin_users_roles_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_users_roles_links
    ADD CONSTRAINT admin_users_roles_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.admin_roles(id) ON DELETE CASCADE;


--
-- Name: admin_users admin_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT admin_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: bookings bookings_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: bookings_service_links bookings_service_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.bookings_service_links
    ADD CONSTRAINT bookings_service_links_fk FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


--
-- Name: bookings_service_links bookings_service_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.bookings_service_links
    ADD CONSTRAINT bookings_service_links_inv_fk FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: bookings bookings_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: bookings_user_links bookings_user_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.bookings_user_links
    ADD CONSTRAINT bookings_user_links_fk FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


--
-- Name: bookings_user_links bookings_user_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.bookings_user_links
    ADD CONSTRAINT bookings_user_links_inv_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: categories categories_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: categories categories_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files files_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: files_folder_links files_folder_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files_folder_links files_folder_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.files_folder_links
    ADD CONSTRAINT files_folder_links_inv_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: files_related_morphs files_related_morphs_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.files_related_morphs
    ADD CONSTRAINT files_related_morphs_fk FOREIGN KEY (file_id) REFERENCES public.files(id) ON DELETE CASCADE;


--
-- Name: files files_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: i18n_locale i18n_locale_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.i18n_locale
    ADD CONSTRAINT i18n_locale_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: messages messages_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: messages_room_links messages_room_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.messages_room_links
    ADD CONSTRAINT messages_room_links_fk FOREIGN KEY (message_id) REFERENCES public.messages(id) ON DELETE CASCADE;


--
-- Name: messages_room_links messages_room_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.messages_room_links
    ADD CONSTRAINT messages_room_links_inv_fk FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON DELETE CASCADE;


--
-- Name: messages_sender_links messages_sender_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.messages_sender_links
    ADD CONSTRAINT messages_sender_links_fk FOREIGN KEY (message_id) REFERENCES public.messages(id) ON DELETE CASCADE;


--
-- Name: messages_sender_links messages_sender_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.messages_sender_links
    ADD CONSTRAINT messages_sender_links_inv_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: messages messages_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: order_details order_details_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: order_details_order_links order_details_order_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.order_details_order_links
    ADD CONSTRAINT order_details_order_links_fk FOREIGN KEY (order_detail_id) REFERENCES public.order_details(id) ON DELETE CASCADE;


--
-- Name: order_details_order_links order_details_order_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.order_details_order_links
    ADD CONSTRAINT order_details_order_links_inv_fk FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: order_details_product_links order_details_product_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.order_details_product_links
    ADD CONSTRAINT order_details_product_links_fk FOREIGN KEY (order_detail_id) REFERENCES public.order_details(id) ON DELETE CASCADE;


--
-- Name: order_details_product_links order_details_product_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.order_details_product_links
    ADD CONSTRAINT order_details_product_links_inv_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: order_details order_details_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: orders orders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: orders orders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: orders_user_links orders_user_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.orders_user_links
    ADD CONSTRAINT orders_user_links_fk FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: orders_user_links orders_user_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.orders_user_links
    ADD CONSTRAINT orders_user_links_inv_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: orders_voucher_links orders_voucher_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.orders_voucher_links
    ADD CONSTRAINT orders_voucher_links_fk FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: orders_voucher_links orders_voucher_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.orders_voucher_links
    ADD CONSTRAINT orders_voucher_links_inv_fk FOREIGN KEY (voucher_id) REFERENCES public.vouchers(id) ON DELETE CASCADE;


--
-- Name: product_lines product_lines_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.product_lines
    ADD CONSTRAINT product_lines_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: product_lines product_lines_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.product_lines
    ADD CONSTRAINT product_lines_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: products_categories_links products_categories_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.products_categories_links
    ADD CONSTRAINT products_categories_links_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_categories_links products_categories_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.products_categories_links
    ADD CONSTRAINT products_categories_links_inv_fk FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: products products_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: products_product_line_links products_product_line_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.products_product_line_links
    ADD CONSTRAINT products_product_line_links_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products_product_line_links products_product_line_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.products_product_line_links
    ADD CONSTRAINT products_product_line_links_inv_fk FOREIGN KEY (product_line_id) REFERENCES public.product_lines(id) ON DELETE CASCADE;


--
-- Name: products products_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: rooms rooms_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: rooms rooms_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: rooms_user_links rooms_user_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.rooms_user_links
    ADD CONSTRAINT rooms_user_links_fk FOREIGN KEY (room_id) REFERENCES public.rooms(id) ON DELETE CASCADE;


--
-- Name: rooms_user_links rooms_user_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.rooms_user_links
    ADD CONSTRAINT rooms_user_links_inv_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: services services_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: services services_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: skin_properties skin_properties_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.skin_properties
    ADD CONSTRAINT skin_properties_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: skin_properties_products_links skin_properties_products_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.skin_properties_products_links
    ADD CONSTRAINT skin_properties_products_links_fk FOREIGN KEY (skin_property_id) REFERENCES public.skin_properties(id) ON DELETE CASCADE;


--
-- Name: skin_properties_products_links skin_properties_products_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.skin_properties_products_links
    ADD CONSTRAINT skin_properties_products_links_inv_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: skin_properties skin_properties_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.skin_properties
    ADD CONSTRAINT skin_properties_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: slugs slugs_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.slugs
    ADD CONSTRAINT slugs_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: slugs slugs_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.slugs
    ADD CONSTRAINT slugs_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_fk FOREIGN KEY (api_token_permission_id) REFERENCES public.strapi_api_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions_token_links strapi_api_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions_token_links
    ADD CONSTRAINT strapi_api_token_permissions_token_links_inv_fk FOREIGN KEY (api_token_id) REFERENCES public.strapi_api_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_api_token_permissions strapi_api_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_api_token_permissions
    ADD CONSTRAINT strapi_api_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_api_tokens strapi_api_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_api_tokens
    ADD CONSTRAINT strapi_api_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions strapi_release_actions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_release_actions_release_links strapi_release_actions_release_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_release_actions_release_links
    ADD CONSTRAINT strapi_release_actions_release_links_fk FOREIGN KEY (release_action_id) REFERENCES public.strapi_release_actions(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions_release_links strapi_release_actions_release_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_release_actions_release_links
    ADD CONSTRAINT strapi_release_actions_release_links_inv_fk FOREIGN KEY (release_id) REFERENCES public.strapi_releases(id) ON DELETE CASCADE;


--
-- Name: strapi_release_actions strapi_release_actions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_release_actions
    ADD CONSTRAINT strapi_release_actions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_releases strapi_releases_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_releases
    ADD CONSTRAINT strapi_releases_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_fk FOREIGN KEY (transfer_token_permission_id) REFERENCES public.strapi_transfer_token_permissions(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions_token_links strapi_transfer_token_permissions_token_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions_token_links
    ADD CONSTRAINT strapi_transfer_token_permissions_token_links_inv_fk FOREIGN KEY (transfer_token_id) REFERENCES public.strapi_transfer_tokens(id) ON DELETE CASCADE;


--
-- Name: strapi_transfer_token_permissions strapi_transfer_token_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_transfer_token_permissions
    ADD CONSTRAINT strapi_transfer_token_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: strapi_transfer_tokens strapi_transfer_tokens_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.strapi_transfer_tokens
    ADD CONSTRAINT strapi_transfer_tokens_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions up_permissions_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_permissions_role_links up_permissions_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_fk FOREIGN KEY (permission_id) REFERENCES public.up_permissions(id) ON DELETE CASCADE;


--
-- Name: up_permissions_role_links up_permissions_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_permissions_role_links
    ADD CONSTRAINT up_permissions_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_permissions up_permissions_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_permissions
    ADD CONSTRAINT up_permissions_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_roles up_roles_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_roles
    ADD CONSTRAINT up_roles_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users up_users_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: up_users_role_links up_users_role_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: up_users_role_links up_users_role_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_users_role_links
    ADD CONSTRAINT up_users_role_links_inv_fk FOREIGN KEY (role_id) REFERENCES public.up_roles(id) ON DELETE CASCADE;


--
-- Name: up_users up_users_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.up_users
    ADD CONSTRAINT up_users_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders upload_folders_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_fk FOREIGN KEY (folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders_parent_links upload_folders_parent_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.upload_folders_parent_links
    ADD CONSTRAINT upload_folders_parent_links_inv_fk FOREIGN KEY (inv_folder_id) REFERENCES public.upload_folders(id) ON DELETE CASCADE;


--
-- Name: upload_folders upload_folders_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.upload_folders
    ADD CONSTRAINT upload_folders_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: user_vouchers user_vouchers_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.user_vouchers
    ADD CONSTRAINT user_vouchers_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: user_vouchers user_vouchers_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.user_vouchers
    ADD CONSTRAINT user_vouchers_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: user_vouchers_user_links user_vouchers_user_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.user_vouchers_user_links
    ADD CONSTRAINT user_vouchers_user_links_fk FOREIGN KEY (user_voucher_id) REFERENCES public.user_vouchers(id) ON DELETE CASCADE;


--
-- Name: user_vouchers_user_links user_vouchers_user_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.user_vouchers_user_links
    ADD CONSTRAINT user_vouchers_user_links_inv_fk FOREIGN KEY (user_id) REFERENCES public.up_users(id) ON DELETE CASCADE;


--
-- Name: user_vouchers_voucher_links user_vouchers_voucher_links_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.user_vouchers_voucher_links
    ADD CONSTRAINT user_vouchers_voucher_links_fk FOREIGN KEY (user_voucher_id) REFERENCES public.user_vouchers(id) ON DELETE CASCADE;


--
-- Name: user_vouchers_voucher_links user_vouchers_voucher_links_inv_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.user_vouchers_voucher_links
    ADD CONSTRAINT user_vouchers_voucher_links_inv_fk FOREIGN KEY (voucher_id) REFERENCES public.vouchers(id) ON DELETE CASCADE;


--
-- Name: vouchers vouchers_created_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_created_by_id_fk FOREIGN KEY (created_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- Name: vouchers vouchers_updated_by_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: missha_user
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_updated_by_id_fk FOREIGN KEY (updated_by_id) REFERENCES public.admin_users(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

