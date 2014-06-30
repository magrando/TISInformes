create trigger elimina_empleador after delete on empleador
	for each row
	delete from usuario where us_rut = old.us_rut