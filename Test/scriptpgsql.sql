create table USUARIO (

  us_rut varchar (9),
  us_nombres varchar (30),
  us_apellidos varchar (30),
  us_mail varchar (30),
  us_direccion varchar (100),
  us_fono numeric (10),
  us_contraseña varchar (20),
  constraint pk_usuario primary key (us_rut)
);

create table ALUMNO (
  
   al_situacion varchar (40),
   ca_codigo numeric (6),
   constraint fk_al_ca foreign key (ca_codigo) references CARRERA (ca_codigo)
) INHERITS (USUARIO);

create table CARRERA (
  
  ca_codigo numeric (6),
  ca_nombre varchar (50),
  constraint pk_carrera primary key (ca_codigo)
);