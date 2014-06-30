create table USUARIO (
  us_rut varchar (9) not null,
  us_nombres varchar (50),
  us_apellidos varchar (50),
  us_mail varchar (50),
  us_direccion varchar (100),
  us_fono numeric(10),
  us_contraseña varchar (20),
  constraint pk_usuario primary key (us_rut)
);

create table EMPLEADOR (
  us_rut varchar (9) not null,
  constraint pk_empleador primary key (us_rut),
  constraint fk_us_em foreign key (us_rut) references USUARIO (us_rut)
);

create table REGION (
  re_identificador integer not null auto_increment,
  re_nombre varchar (40),
  constraint pk_region primary key (re_identificador)
);

create table COMUNA (
  co_identificador integer not null auto_increment,
  co_nombre varchar(40),
  re_identificador integer,
  constraint pk_comuna primary key (co_identificador),
  constraint fk_re_co foreign key (re_identificador) references REGION (re_identificador)
);

create table EMPRESA (
  em_rut varchar(9) not null,
  em_nombre varchar(50),
  em_rubro varchar(50),
  em_direccion varchar(100),
  em_fono numeric(10),
  co_identificador integer,
  constraint pk_empresa primary key (em_rut),
  constraint fk_co_em foreign key (co_identificador) references COMUNA (co_identificador)
);

create table TRABAJA_EMPRESA (
  em_rut varchar (9) not null,
  us_rut varchar (9) not null,
  tr_fecha_inicio date,
  tr_fecha_fin date,
  constraint pk_trabaja_empresa_2 primary key (us_rut, em_rut),
  constraint fk_tr_us foreign key (us_rut) references USUARIO (us_rut),
  constraint fk_tr_em foreign key (em_rut) references EMPRESA (em_rut)
);

create table INSCRIBE_PRACTICA (
   pr_identificador integer not null,
   us_rut varchar(9) not null,
   pr_fecha_inicio date,
   pr_fecha_fin date,
   pr_evaluación_profesor varchar(20),
   pr_evaluación_empleador varchar(20),
   constraint pk_inscribe_practica primary key (pr_identificador, us_rut),
   constraint fk_ins_pr foreign key (pr_identificador) references OFERTA_PRACTICA (pr_identificador),
   constraint fk_ins_al foreign key (us_rut) references ALUMNO (us_rut)
)

