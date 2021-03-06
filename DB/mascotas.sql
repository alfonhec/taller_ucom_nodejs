PGDMP         #                x           mascotas    12.2    12.2 7    Q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            R           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            S           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            T           1262    16466    mascotas    DATABASE     �   CREATE DATABASE mascotas WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE mascotas;
                postgres    false            �            1259    16542    articulo    TABLE     �   CREATE TABLE public.articulo (
    id_articulo integer NOT NULL,
    descripcion character varying,
    precio_publico integer,
    precio_mayorista integer,
    activo boolean
);
    DROP TABLE public.articulo;
       public         heap    postgres    false            �            1259    16540    articulo_id_articulo_seq    SEQUENCE     �   CREATE SEQUENCE public.articulo_id_articulo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.articulo_id_articulo_seq;
       public          postgres    false    214            U           0    0    articulo_id_articulo_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.articulo_id_articulo_seq OWNED BY public.articulo.id_articulo;
          public          postgres    false    213            �            1259    16467 	   categoria    TABLE     ^   CREATE TABLE public.categoria (
    id integer NOT NULL,
    nombre character varying(200)
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    16470    cliente    TABLE     �   CREATE TABLE public.cliente (
    id_cliente integer NOT NULL,
    nombre character varying,
    apellido character varying,
    direccion character varying,
    telefono character varying
);
    DROP TABLE public.cliente;
       public         heap    postgres    false            �            1259    16476    cliente_mascota    TABLE     �   CREATE TABLE public.cliente_mascota (
    id integer NOT NULL,
    id_cliente integer,
    id_mascota integer,
    activo boolean
);
 #   DROP TABLE public.cliente_mascota;
       public         heap    postgres    false            �            1259    16479    cliente_mascota_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cliente_mascota_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.cliente_mascota_id_seq;
       public          postgres    false    204            V           0    0    cliente_mascota_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.cliente_mascota_id_seq OWNED BY public.cliente_mascota.id;
          public          postgres    false    205            �            1259    16481    mascota    TABLE     y   CREATE TABLE public.mascota (
    id_mascota integer NOT NULL,
    nombre character varying,
    id_categoria integer
);
    DROP TABLE public.mascota;
       public         heap    postgres    false            �            1259    16526 	   my_serial    SEQUENCE     �   CREATE SEQUENCE public.my_serial
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE public.my_serial;
       public          postgres    false    206            W           0    0 	   my_serial    SEQUENCE OWNED BY     D   ALTER SEQUENCE public.my_serial OWNED BY public.mascota.id_mascota;
          public          postgres    false    211            �            1259    16529 
   my_serialc    SEQUENCE     �   CREATE SEQUENCE public.my_serialc
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE public.my_serialc;
       public          postgres    false    203            X           0    0 
   my_serialc    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.my_serialc OWNED BY public.cliente.id_cliente;
          public          postgres    false    212            �            1259    16487    servicio    TABLE     �   CREATE TABLE public.servicio (
    fecha_servicio date,
    id_cliente integer,
    estado character varying,
    id_tipo_servicio integer,
    id_servicio integer NOT NULL,
    id_mascota integer
);
    DROP TABLE public.servicio;
       public         heap    postgres    false            �            1259    16493    servicio_id_servicio_seq    SEQUENCE     �   CREATE SEQUENCE public.servicio_id_servicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.servicio_id_servicio_seq;
       public          postgres    false    207            Y           0    0    servicio_id_servicio_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.servicio_id_servicio_seq OWNED BY public.servicio.id_servicio;
          public          postgres    false    208            �            1259    16495    tipo_servicio    TABLE     t   CREATE TABLE public.tipo_servicio (
    id_tipo_servicio integer NOT NULL,
    nombre_servicio character varying
);
 !   DROP TABLE public.tipo_servicio;
       public         heap    postgres    false            �            1259    16501 "   tipo_servicio_id_tipo_servicio_seq    SEQUENCE     �   CREATE SEQUENCE public.tipo_servicio_id_tipo_servicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.tipo_servicio_id_tipo_servicio_seq;
       public          postgres    false    209            Z           0    0 "   tipo_servicio_id_tipo_servicio_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.tipo_servicio_id_tipo_servicio_seq OWNED BY public.tipo_servicio.id_tipo_servicio;
          public          postgres    false    210            �            1259    16557    ventas    TABLE     �   CREATE TABLE public.ventas (
    id_venta integer NOT NULL,
    fecha_venta date,
    id_cliente integer,
    monto_total integer,
    nro_factura character varying,
    activo boolean,
    id_articulo integer NOT NULL
);
    DROP TABLE public.ventas;
       public         heap    postgres    false            �            1259    16555    ventas_id_venta_seq    SEQUENCE     �   CREATE SEQUENCE public.ventas_id_venta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.ventas_id_venta_seq;
       public          postgres    false    216            [           0    0    ventas_id_venta_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.ventas_id_venta_seq OWNED BY public.ventas.id_venta;
          public          postgres    false    215            �
           2604    16545    articulo id_articulo    DEFAULT     |   ALTER TABLE ONLY public.articulo ALTER COLUMN id_articulo SET DEFAULT nextval('public.articulo_id_articulo_seq'::regclass);
 C   ALTER TABLE public.articulo ALTER COLUMN id_articulo DROP DEFAULT;
       public          postgres    false    214    213    214            �
           2604    16531    cliente id_cliente    DEFAULT     l   ALTER TABLE ONLY public.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('public.my_serialc'::regclass);
 A   ALTER TABLE public.cliente ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    212    203            �
           2604    16503    cliente_mascota id    DEFAULT     x   ALTER TABLE ONLY public.cliente_mascota ALTER COLUMN id SET DEFAULT nextval('public.cliente_mascota_id_seq'::regclass);
 A   ALTER TABLE public.cliente_mascota ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204            �
           2604    16528    mascota id_mascota    DEFAULT     k   ALTER TABLE ONLY public.mascota ALTER COLUMN id_mascota SET DEFAULT nextval('public.my_serial'::regclass);
 A   ALTER TABLE public.mascota ALTER COLUMN id_mascota DROP DEFAULT;
       public          postgres    false    211    206            �
           2604    16504    servicio id_servicio    DEFAULT     |   ALTER TABLE ONLY public.servicio ALTER COLUMN id_servicio SET DEFAULT nextval('public.servicio_id_servicio_seq'::regclass);
 C   ALTER TABLE public.servicio ALTER COLUMN id_servicio DROP DEFAULT;
       public          postgres    false    208    207            �
           2604    16505    tipo_servicio id_tipo_servicio    DEFAULT     �   ALTER TABLE ONLY public.tipo_servicio ALTER COLUMN id_tipo_servicio SET DEFAULT nextval('public.tipo_servicio_id_tipo_servicio_seq'::regclass);
 M   ALTER TABLE public.tipo_servicio ALTER COLUMN id_tipo_servicio DROP DEFAULT;
       public          postgres    false    210    209            �
           2604    16560    ventas id_venta    DEFAULT     r   ALTER TABLE ONLY public.ventas ALTER COLUMN id_venta SET DEFAULT nextval('public.ventas_id_venta_seq'::regclass);
 >   ALTER TABLE public.ventas ALTER COLUMN id_venta DROP DEFAULT;
       public          postgres    false    216    215    216            L          0    16542    articulo 
   TABLE DATA           f   COPY public.articulo (id_articulo, descripcion, precio_publico, precio_mayorista, activo) FROM stdin;
    public          postgres    false    214   ,<       @          0    16467 	   categoria 
   TABLE DATA           /   COPY public.categoria (id, nombre) FROM stdin;
    public          postgres    false    202   �<       A          0    16470    cliente 
   TABLE DATA           T   COPY public.cliente (id_cliente, nombre, apellido, direccion, telefono) FROM stdin;
    public          postgres    false    203   =       B          0    16476    cliente_mascota 
   TABLE DATA           M   COPY public.cliente_mascota (id, id_cliente, id_mascota, activo) FROM stdin;
    public          postgres    false    204   �=       D          0    16481    mascota 
   TABLE DATA           C   COPY public.mascota (id_mascota, nombre, id_categoria) FROM stdin;
    public          postgres    false    206   >       E          0    16487    servicio 
   TABLE DATA           q   COPY public.servicio (fecha_servicio, id_cliente, estado, id_tipo_servicio, id_servicio, id_mascota) FROM stdin;
    public          postgres    false    207   �>       G          0    16495    tipo_servicio 
   TABLE DATA           J   COPY public.tipo_servicio (id_tipo_servicio, nombre_servicio) FROM stdin;
    public          postgres    false    209   !?       N          0    16557    ventas 
   TABLE DATA           r   COPY public.ventas (id_venta, fecha_venta, id_cliente, monto_total, nro_factura, activo, id_articulo) FROM stdin;
    public          postgres    false    216   �?       \           0    0    articulo_id_articulo_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.articulo_id_articulo_seq', 5, true);
          public          postgres    false    213            ]           0    0    cliente_mascota_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.cliente_mascota_id_seq', 4, true);
          public          postgres    false    205            ^           0    0 	   my_serial    SEQUENCE SET     8   SELECT pg_catalog.setval('public.my_serial', 13, true);
          public          postgres    false    211            _           0    0 
   my_serialc    SEQUENCE SET     8   SELECT pg_catalog.setval('public.my_serialc', 5, true);
          public          postgres    false    212            `           0    0    servicio_id_servicio_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.servicio_id_servicio_seq', 2, true);
          public          postgres    false    208            a           0    0 "   tipo_servicio_id_tipo_servicio_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.tipo_servicio_id_tipo_servicio_seq', 4, true);
          public          postgres    false    210            b           0    0    ventas_id_venta_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.ventas_id_venta_seq', 7, true);
          public          postgres    false    215            �
           2606    16550    articulo articulo_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.articulo
    ADD CONSTRAINT articulo_pkey PRIMARY KEY (id_articulo);
 @   ALTER TABLE ONLY public.articulo DROP CONSTRAINT articulo_pkey;
       public            postgres    false    214            �
           2606    16507 "   cliente_mascota cliente_mascota_pk 
   CONSTRAINT     `   ALTER TABLE ONLY public.cliente_mascota
    ADD CONSTRAINT cliente_mascota_pk PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.cliente_mascota DROP CONSTRAINT cliente_mascota_pk;
       public            postgres    false    204            �
           2606    16509    cliente cliente_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pk PRIMARY KEY (id_cliente);
 <   ALTER TABLE ONLY public.cliente DROP CONSTRAINT cliente_pk;
       public            postgres    false    203            �
           2606    16511    mascota mascota_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.mascota
    ADD CONSTRAINT mascota_pk PRIMARY KEY (id_mascota);
 <   ALTER TABLE ONLY public.mascota DROP CONSTRAINT mascota_pk;
       public            postgres    false    206            �
           2606    16513    servicio servicio_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pk PRIMARY KEY (id_servicio);
 >   ALTER TABLE ONLY public.servicio DROP CONSTRAINT servicio_pk;
       public            postgres    false    207            �
           2606    16515    tipo_servicio tipo_servicio_pk 
   CONSTRAINT     j   ALTER TABLE ONLY public.tipo_servicio
    ADD CONSTRAINT tipo_servicio_pk PRIMARY KEY (id_tipo_servicio);
 H   ALTER TABLE ONLY public.tipo_servicio DROP CONSTRAINT tipo_servicio_pk;
       public            postgres    false    209            �
           2606    16565    ventas ventas_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (id_venta);
 <   ALTER TABLE ONLY public.ventas DROP CONSTRAINT ventas_pkey;
       public            postgres    false    216            L   t   x�M̱@0���� -M�m&��rh���R��J�p����������@��@V�BBg��p�aG�'u�[������@	�v����ih����zb{/�7*��^x.D      @   H   x�ǹ�@��[?Őt:�"c�ǓM+wq':�D/�ܔ3#F�usŜ�>b�C�'�c���[k����      A   �   x�}�=�0���9EN�h��gd)�!&�Q)�+7]zz���^��r��$BC"4B�v_�O���q9��֦�2��L�E��S�9��giM|��O��͖�uE]����'��2<P�u�-Yn��]�y�0���`����-��!��r��uPJ� �>�      B   6   x���  �j{��wj&`�C�%9jzN%����u��Tׂ��p�Q�Sl g	6      D   y   x��K� ����0U��.��$�#C���ݎ�_��S�Y�� �R�.إ�M��U�!w�B7�L�w��ez �|��<ƚG�g��(�[j#d�����y��2��h�;]���版~��'A      E   �   x�U�A� ���*l пT�!�ք���եE	�}ym�Sg]�Q�yե�+	��O�U�!�ϢV#�ȑ�{g��w��S'�-uݟ�ӒY�Z6�k[���ÜG�������65�%p�y܌1_[<�      G   Y   x�-��� ��*���3^�O����K_�h̋s��4��0Pa#��oo�HF���LʏS�)i�1S��6a����e�XIg�wl��)O      N   \   x�M���0���KQ�6�a��E�
x�'���F5
wI���
�'�P��8p�´�X�!&�°��$81
����C�bf'P1"     