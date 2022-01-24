create or replace procedure arribo(int,int,int,varchar,int)
as
$$
declare
	res int;
	begin
		insert into registro(registro_id,cliente_id, supervisor_id, unid_control_id,estadia_id) values($1,$2,$3,$4,$5);	
	exception
		when sqlstate '23514' then
		raise exception 'No se realizo la transaccion debido a que el id que ingresaste no son validos o estan vacios';
		rollback;
	commit;
end;
$$
language plpgsql;