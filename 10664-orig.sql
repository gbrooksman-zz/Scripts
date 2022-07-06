BEGIN DELETE FROM T_PROD_DATA WHERE F_PRODUCT='@' AND F_DATA_CODE='JPPDLBH'; INSERT
    INTO t_prod_data (
        f_product,
        f_data_code,
        f_user_updated,
        f_date_stamp,
        f_data
    ) SELECT '@', 'JPPDLBH', 'RW-10664', {fn now()}, STUFF(( SELECT N'/' + Z.T + ' ' + convert(varchar, z.p) + '%' FROM (
    SELECT
        isnull(
            (
                SELECT
                    f_chem_name
                FROM
                    t_components_alias
                WHERE
                    f.f_cas_number + f.f_component_id = f_cas_number + f_component_id
                    AND f_language = 'JP'
            ),(
                SELECT
                    f_chem_name
                FROM
                    t_components_alias
                WHERE
                    f.f_cas_number + f.f_component_id = f_cas_number + f_component_id
                    AND f_language = 'EN'
            )
        )   t,
        CASE
        WHEN convert(
            decimal(
                20, 10
            ), f_percent
        ) = 0.0 THEN
        '0.0'
        ELSE
        ltrim(
            rtrim(
                to_char(
                       round(
                            convert(
                                   decimal(
                                          20,
                                          10
                                   ),
                                   f_percent
                            ),
                            1 - floor(log(
                                         10,
                                         abs(convert(
                                                    decimal(
                                                           20,
                                                           10
                                                    ),
                                                    f_percent
                                             ))
                                      ))
                       ),
                       38,
                       CAST(
                           CASE
                           WHEN 1 - floor(
                               log(
                                   10, abs(
                                       convert(
                                           decimal(
                                               20, 10
                                           ), round(
                                               convert(
                                                   decimal(
                                                       20, 10
                                                   ), f_percent
                                               ), 1 - floor(
                                                   log(
                                                       10, abs(
                                                           convert(
                                                               decimal(
                                                                   20, 10
                                                               ), f_percent
                                                           )
                                                       )
                                                   )
                                               )
                                           )
                                       )
                                   )
                               )
                           ) < 0 THEN
                           0
                           ELSE
                           1 - floor(
                               log(
                                   10, abs(
                                       convert(
                                           decimal(
                                               20, 10
                                           ), round(
                                               convert(
                                                   decimal(
                                                       20, 10
                                                   ), f_percent
                                               ), 1 - floor(
                                                   log(
                                                       10, abs(
                                                           convert(
                                                               decimal(
                                                                   20, 10
                                                               ), f_percent
                                                           )
                                                       )
                                                   )
                                               )
                                           )
                                       )
                                   )
                               )
                           )
                           END
                       AS INT)
                )
            )
        )
        END p
    FROM
        t_prod_comp f
        INNER JOIN t_form_text c ON c.f_product = f.f_product
                                    AND f.f_cas_number + f.f_component_id = c.f_cas_number + c.f_component_id
    WHERE
        f.f_product = '@'
        AND c.f_data_code = 'JPPDF'
) z for xml path(
    ''
)), 1, 1, '' ); END;