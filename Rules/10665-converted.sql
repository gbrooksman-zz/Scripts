--{fn now()}

BEGIN 

DELETE FROM T_PROD_DATA WHERE F_PRODUCT='@' AND F_DATA_CODE='JPLBH';  

INSERT INTO t_prod_data (f_product, f_data_code, f_user_updated, f_date_stamp, f_data)
   SELECT '@', 'JPLBH', 'RW-10665',sysdate , DATAOUT
   FROM( SELECT
        NVL(
            (
                SELECT f_chem_name
                FROM t_components_alias
                WHERE
                    f.f_cas_number || f.f_component_id = f_cas_number || f_component_id AND f_language = 'JP'
            ),(
                SELECT f_chem_name
                FROM t_components_alias
                WHERE f.f_cas_number || f.f_component_id = f_cas_number || f_component_id AND f_language = 'EN'
            )
        ) AS DATAOUT
    FROM
        t_prod_comp f
        INNER JOIN t_form_data c ON c.f_product = f.f_product
        AND f.f_cas_number || f.f_component_id = c.f_cas_number || c.f_component_id
    WHERE
        f.f_product = '@'    
        AND c.f_data_code = 'JPLBOF');
 END;