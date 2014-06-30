
create type usuario (
  
  us_rut varchar (9),
  us_nombres varchar (30),
  us_apellidos varchar (30),
  us_mail varchar (30),
  us_direccion varchar (100),
  us_fono numeric (10),
  us_contraseña varchar (20),
  constraint pk_usuario primary key (us_rut)
);

create type alumno under USUARIO (
  
   al_situacion varchar (40),
   ca_codigo numeric (6),
   constraint fk_al_ca foreign key (ca_codigo) references CARRERA (ca_codigo)
);

create type secretaria under USUARIO ();

create type profesor_guia under USUARIO ();

create type empleador under USUARIO (
   
   em_rut varchar (30),
   constraint fk_em_em foreign key (em_rut) references EMPRESA (em_rut)
);

create table USUARIO OF usuario;

create table ALUMNO OF alumno under usuario;

create table SECRETARIA OF secretaria under usuario;

create table PROFESOR_GUIA OF profesor_guia under usuario;

create table EMPLEADOR OF empleador under usuario; 	

create table CARRERA (
  
  ca_codigo numeric (6),
  ca_nombre varchar (50),
  constraint pk_carrera primary key (ca_codigo)
);

create table EMPRESA (
   
   em_rut varchar (9),
   em_nombre varchar (30),
   em_rubro varchar (30),
   em_direccion varchar (100),
   em_fono numeric (10),
   constraint pk_empresa primary key (em_rut)
);

create table EVALUACION (
   
   ev_identificador numeric (6),
   us_rut varchar (9),
   ev_calificacion varchar (20),
   constraint pk_evaluacion primary key (ev_identificador),
   constraint fk_ev_emp foreign key (us_rut) references EMPLEADOR (us_rut)
);

create table INFORME (
   
   in_identificador numeric (6),
   in_direccion varchar (40),
   in_evaluacion varchar(20),
   us_rut varchar (9),
   constraint pk_informe primary key (in_identificador),
   constraint fk_in_al foreign key (us_rut) references ALUMNO(us_rut)
);

create table PRACTICA (
   
   pr_identificador numeric (6),
   pr_nombre varchar (30),
   pr_descripcion varchar (600),
   pr_estado varchar (40),
   pr_vacantes numeric(6),
   pr_inscritos numeric (6),
   pr_tipo varchar (20),
   us_rut varchar (9),
   em_us_rut varchar (9),
   constraint pk_practica primary key (pr_identificador),
   constraint fk_pr_us foreign key (us_rut) references USUARIO (us_rut),
   constraint fk_pr_em_us foreign key (em_us_rut) references EMPLEADOR (us_rut)
);

create table POSTULACION_PRACTICA (
   
   us_rut varchar (9),
   pr_identificador numeric (6),
   post_fecha datetime,
   constraint pk_postulacion_practica primary key (us_rut, pr_identificador),
   constraint fk_post_us foreign key (us_rut) references USUARIO (us_rut),
   constraint fk_post_pr foreign (pr_identificador) references PRACTICA (pr_identificador)
);

create table INSCRIBE_PRACTICA (
   
   us_rut varchar (9),
   pr_identificador numeric (6),
   in_pr_fecha date,
   constraint pk_postulacion_practica primary key (us_rut, pr_identificador),
   constraint fk_post_us foreign key (us_rut) references USUARIO (us_rut),
   constraint fk_post_pr foreign (pr_identificador) references PRACTICA (pr_identificador)
);