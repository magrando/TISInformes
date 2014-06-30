create table profesor (
us_rut varchar(9) not null,
constraint pk_profesor primary key (us_rut),
constraint fk_pr_us foreign key (us_rut) references usuario (us_rut)
)