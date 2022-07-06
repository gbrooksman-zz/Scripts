BEGIN

DELETE FROM T_PROD_DATA WHERE F_PRODUCT='@' AND F_DATA_CODE='JPPDLBH';

INSERT INTO t_prod_data (f_product,f_data_code,f_user_updated,f_date_stamp, f_data) 
    SELECT '@', 'JPPDLBH', 'RW-10664', {fn now()}, DATAOUT 
    FROM ( SELECT utl_raw.cast_to_nvarchar2(LISTAGG(utl_raw.cast_to_raw(NVL2(
        (SELECT 1 FROM  t_components_alias WHERE f.f_cas_number || f.f_component_id = f_cas_number || f_component_id AND f_language = 'JP'),
        (SELECT f_chem_name FROM  t_components_alias WHERE f.f_cas_number || f.f_component_id = f_cas_number || f_component_id AND f_language = 'JP'), 
        (SELECT f_chem_name FROM  t_components_alias WHERE f.f_cas_number || f.f_component_id = f_cas_number || f_component_id AND f_language = 'EN')
        ) || ' ' ||
    CASE
        WHEN f.F_PERCENT >= 0 AND f.F_PERCENT < .01 
            THEN  TO_NCHAR(f.F_PERCENT, 'FMD990') || '%'
        WHEN f.F_PERCENT >= .01 AND f.F_PERCENT < .1 
            THEN  TO_NCHAR(f.F_PERCENT, 'FM9D990') || '%'
        WHEN f.F_PERCENT >= .1 AND f.F_PERCENT < 1 
            THEN  TO_NCHAR(f.F_PERCENT, 'FM9D90') || '%'
        WHEN f.F_PERCENT >= 1 AND f.F_PERCENT < 10 
            THEN TO_NCHAR(f.F_PERCENT, 'FM99D0') || '%'
        ELSE 
            TO_NCHAR(f.F_PERCENT, 'FM999') || '%'
    END), HEXTORAW('2F')) WITHIN GROUP (ORDER BY 1)) AS DATAOUT
FROM t_prod_comp f
INNER JOIN t_form_text c ON c.f_product = f.f_product 
AND f.f_cas_number || f.f_component_id = c.f_cas_number || c.f_component_id
WHERE 1 = 1
AND f.f_product = '@'  
AND c.f_data_code = 'JPPDF'); 

END;