alter table registro_familiar add check(registro_id=cliente_id);
create or replace procedure registro(int,int,int, varchar)
as
$$
declare
	res int;
	begin
		insert into registro_familiar(registro_fam_id,registro_id,cliente_id, registro_fam_nombre) values($1,$2,$3,$4);	
	exception
		when sqlstate '23514' then
		raise exception 'No se realizo la transaccion debido a que el id de registro y el cliente id no son iguales';
		rollback;
	commit;
end;
$$
language plpgsql;