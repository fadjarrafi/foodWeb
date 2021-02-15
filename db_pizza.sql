
CREATE
    /*[ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
    [DEFINER = { user | CURRENT_USER }]
    [SQL SECURITY { DEFINER | INVOKER }]*/
    VIEW `db_pizza`.`view_totalorder` 
    AS
SELECT
	`tbl_menu`.`id_menu`
	,`tbl_menu`.`nama_menu`
	,`tbl_menu`.`deskripsi`
	,`tbl_menu`.`url_gambar`
	,`tbl_menu`.`jenis`
	,COALESCE(SUM(`tbl_order`.`jumlah_pemesan`),0) AS total_order
FROM
	`db_pizza`.`tbl_order`
	RIGHT JOIN `db_pizza`.`tbl_menu`
	ON (`tbl_order`.`id_menu` = `tbl_menu`.`id_menu`) GROUP BY id_menu ;
