SPOOL C:\ORATEMP\PHRASES.LOG

/*

  RCRA, RCRA, 0
  SYM, SYM, 00


*/


ACCEPT oldcode CHAR PROMPT 'Enter old Text Family Code to be replaced: >'

ACCEPT newcode CHAR PROMPT 'Enter New Text Family Code : >'

ACCEPT zeroes CHAR PROMPT 'Enter zeroes for appending onto New Text Family Code : >'



      ------------------------------------------------
      -- UPDATE REG TABLES
      ------------------------------------------------

      ------------------------------------------------
      -- UPDATE SARA TABLES
      ------------------------------------------------



      ------------------------------------------------
      -- UPDATE RULES TABLES
      ------------------------------------------------


      UPDATE T_A_RULES
	SET F_VALUE = replace(F_VALUE,'&oldcode','&newcode' || '&zeroes')
	WHERE F_SUBSECTION_ID = '&oldcode';

      UPDATE T_A_RULES
	SET F_VALUE = replace(F_VALUE,'&oldcode' || '|','&newcode' || '|' || '&zeroes')
	WHERE F_VALUE like '%' || '&oldcode' || '|%' ;


      UPDATE T_A_RULES
	SET F_SUBSECTION_ID = '&newcode'
	WHERE F_SUBSECTION_ID = '&oldcode';




      UPDATE T_B_RULES
	SET F_PHRASE_FROM_1 = replace(F_PHRASE_FROM_1,'&oldcode','&newcode' || '&zeroes')
	WHERE F_SUBSECTION_ID_FROM = '&oldcode';


      UPDATE T_B_RULES
	SET F_PHRASE_FROM_2 = replace(F_PHRASE_FROM_2,'&oldcode','&newcode' || '&zeroes')
	WHERE F_SUBSECTION_ID_FROM = '&oldcode';

     UPDATE T_B_RULES
	SET F_SUBSECTION_ID_FROM = '&newcode'
	WHERE F_SUBSECTION_ID_FROM = '&oldcode';



      UPDATE T_B_RULES
      SET F_PHRASE_TO = replace(F_PHRASE_TO,'&oldcode','&newcode' || '&zeroes')
      WHERE F_SUBSECTION_ID_TO = '&oldcode';

      UPDATE T_B_RULES
	SET F_PHRASE_TO = replace(F_PHRASE_TO,'&oldcode' || '|','&newcode' || '|' || '&zeroes')
	WHERE F_PHRASE_TO like '%' || '&oldcode' || '|%' ;

     UPDATE T_B_RULES
	SET F_SUBSECTION_ID_TO = '&newcode'
	WHERE F_SUBSECTION_ID_TO = '&oldcode';



      UPDATE T_B_RULES_EXT
	SET F_PHRASE_FROM_1 = replace(F_PHRASE_FROM_1,'&oldcode','&newcode' || '&zeroes')
	WHERE F_SUBSECTION_ID_FROM = '&oldcode';


      UPDATE T_B_RULES_EXT
	SET F_PHRASE_FROM_2 = replace(F_PHRASE_FROM_2,'&oldcode','&newcode' || '&zeroes')
	WHERE F_SUBSECTION_ID_FROM = '&oldcode';

     UPDATE T_B_RULES_EXT
	SET F_SUBSECTION_ID_FROM = '&newcode'
	WHERE F_SUBSECTION_ID_FROM = '&oldcode';




      UPDATE T_C_RULES
	SET F_VALUE = replace(F_VALUE,'&oldcode','&newcode' || '&zeroes')
	WHERE F_SUBSECTION_ID = '&oldcode';

      UPDATE T_C_RULES
	SET F_VALUE = replace(F_VALUE,'&oldcode' || '|','&newcode' || '|' || '&zeroes')
	WHERE F_VALUE like '%' || '&oldcode' || '|%' ;


      UPDATE T_C_RULES
	SET F_SUBSECTION_ID = '&newcode'
	WHERE F_SUBSECTION_ID = '&oldcode';




      UPDATE T_D_RULES
	SET F_SUBSECTION_A = '&newcode'
	WHERE F_SUBSECTION_A = '&oldcode';

      UPDATE T_D_RULES
	SET F_SUBSECTION_B = '&newcode'
	WHERE F_SUBSECTION_B = '&oldcode';

      UPDATE T_D_RULES
	SET F_SUBSECTION_C = '&newcode'
	WHERE F_SUBSECTION_C = '&oldcode';

      UPDATE T_D_RULES
	SET F_SUBSECTION_D = '&newcode'
	WHERE F_SUBSECTION_D = '&oldcode';

      UPDATE T_D_RULES
	SET F_SUBSECTION_ID_TO = '&newcode'
	WHERE F_SUBSECTION_ID_TO = '&oldcode';





      UPDATE T_E_RULES
	SET F_PHRASE_FROM_1 = replace(F_PHRASE_FROM_1,'&oldcode','&newcode' || '&zeroes')
	WHERE F_SUBSECTION_ID_FROM = '&oldcode';


      UPDATE T_E_RULES
	SET F_PHRASE_FROM_2 = replace(F_PHRASE_FROM_2,'&oldcode','&newcode' || '&zeroes')
	WHERE F_SUBSECTION_ID_FROM = '&oldcode';

      UPDATE T_E_RULES
	SET F_SUBSECTION_ID_FROM = '&newcode'
	WHERE F_SUBSECTION_ID_FROM = '&oldcode';



      UPDATE T_E_RULES
      SET F_PHRASE_TO = replace(F_PHRASE_TO,'&oldcode','&newcode' || '&zeroes')
      WHERE F_SUBSECTION_ID_TO = '&oldcode';

      UPDATE T_E_RULES
	SET F_PHRASE_TO = replace(F_PHRASE_TO,'&oldcode' || '|','&newcode' || '|' || '&zeroes')
	WHERE F_PHRASE_TO like '%' || '&oldcode' || '|%' ;

      UPDATE T_E_RULES
	SET F_SUBSECTION_ID_TO = '&newcode'
	WHERE F_SUBSECTION_ID_TO = '&oldcode';





      UPDATE T_F_RULES
	SET F_SUBSECTION_ID_FROM = '&newcode'
	WHERE F_SUBSECTION_ID_FROM = '&oldcode';


     UPDATE T_F_RULES
      SET F_PHRASE_TO = replace(F_PHRASE_TO,'&oldcode','&newcode' || '&zeroes')
      WHERE F_SUBSECTION_ID_TO = '&oldcode';

      UPDATE T_F_RULES
	SET F_PHRASE_TO = replace(F_PHRASE_TO,'&oldcode' || '|','&newcode' || '|' || '&zeroes')
	WHERE F_PHRASE_TO like '%' || '&oldcode' || '|%' ;

     UPDATE T_F_RULES
	SET F_SUBSECTION_ID_TO = '&newcode'
	WHERE F_SUBSECTION_ID_TO = '&oldcode';



      UPDATE T_G_RULES
	SET F_SUBSECTION_ID_FROM = '&newcode'
	WHERE F_SUBSECTION_ID_FROM = '&oldcode';


     UPDATE T_G_RULES
	SET F_DATA_CODE_X = '&newcode'
	WHERE F_DATA_CODE_X = '&oldcode';

     UPDATE T_G_RULES
	SET F_DATA_CODE_Y = '&newcode'
	WHERE F_DATA_CODE_Y = '&oldcode';

      UPDATE T_G_RULES
	SET F_VALUE_TO = replace(F_VALUE_TO,'&oldcode','&newcode' || '&zeroes')
	WHERE F_SUBSECTION_ID_TO = '&oldcode';


     UPDATE T_G_RULES
	SET F_SUBSECTION_ID_TO = '&newcode'
	WHERE F_SUBSECTION_ID_TO = '&oldcode';





      ------------------------------------------------
      -- UPDATE LETTER ASSOCIATION TABLE
      ------------------------------------------------

      UPDATE T_LETR_ASSOC_TEXT_CODES
	SET F_TEXT_CODE = replace(F_TEXT_CODE,'&oldcode','&newcode' || '&zeroes')
	WHERE F_TEXT_CODE like '%' || '&oldcode' || '%';


      ------------------------------------------------
      -- UPDATE PRODUCT AND COMPONENT ASSOCIATIONS
      ------------------------------------------------

      UPDATE T_PROD_TEXT
	SET F_TEXT_CODE = replace(F_TEXT_CODE,'&oldcode','&newcode' || '&zeroes'),
	F_DATA_CODE = '&newcode'
      WHERE F_DATA_CODE = '&oldcode';


      UPDATE T_COMP_TEXT
	SET F_TEXT_CODE = replace(F_TEXT_CODE,'&oldcode','&newcode' || '&zeroes'),
	F_DATA_CODE = '&newcode'
      WHERE F_DATA_CODE = '&oldcode';

      UPDATE T_PROD_ALIAS_TEXT
	SET F_TEXT_CODE = replace(F_TEXT_CODE,'&oldcode','&newcode' || '&zeroes'),
	F_DATA_CODE = '&newcode'
      WHERE F_DATA_CODE = '&oldcode';

      UPDATE T_FORM_TEXT
	SET F_TEXT_CODE = replace(F_TEXT_CODE,'&oldcode','&newcode' || '&zeroes'),
	F_DATA_CODE = '&newcode'
      WHERE F_DATA_CODE = '&oldcode';


      UPDATE T_INPUT_PROD_TEXT
	SET F_TEXT_CODE = replace(F_TEXT_CODE,'&oldcode','&newcode' || '&zeroes'),
	F_DATA_CODE = '&newcode'
      WHERE F_DATA_CODE = '&oldcode';

      UPDATE T_REP_PROD_ALIAS_TEXT
	SET F_TEXT_CODE = replace(F_TEXT_CODE,'&oldcode','&newcode' || '&zeroes'),
	F_DATA_CODE = '&newcode'
      WHERE F_DATA_CODE = '&oldcode';

      UPDATE T_REP_COMP_TEXT
	SET F_TEXT_CODE = replace(F_TEXT_CODE,'&oldcode','&newcode' || '&zeroes'),
	F_DATA_CODE = '&newcode'
      WHERE F_DATA_CODE = '&oldcode';


      ------------------------------------------------
      -- UPDATE LOLI MAPPINGS
      ------------------------------------------------


     UPDATE T_LOLI_WERCS_XREF_2
	SET F_WERCS_SS = '&newcode'
	WHERE F_WERCS_SS = '&oldcode';


      ------------------------------------------------
      -- UPDATE FORMATS
      ------------------------------------------------

      UPDATE T_DATATYPES
	SET F_DEFAULT_CODE = replace(F_DEFAULT_CODE,'&oldcode','&newcode' || '&zeroes'),
	F_DATA_CODE = '&newcode'
      WHERE F_DATA_CODE = '&oldcode';


      ------------------------------------------------
      -- UPDATE WERCS TEXT LIBRARY
      ------------------------------------------------

--      UPDATE T_TEXT_DETAILS
--	SET F_TEXT_CODE = replace(F_TEXT_CODE,'&oldcode','&newcode' || '&zeroes'),
--	F_PREFIX = '&newcode',
--	F_TEXT_KEY = replace(F_TEXT_KEY,'&oldcode','&newcode' || '&zeroes')
--	WHERE F_PREFIX = '&oldcode' AND F_TEXT_TYPE = 'TX';

      UPDATE T_TEXT_DETAILS
	SET F_TEXT_CODE = replace(F_TEXT_CODE,'&oldcode','&newcode' || '&zeroes'),
	F_PREFIX = '&newcode'
	WHERE F_PREFIX = '&oldcode' AND F_TEXT_TYPE = 'TX';

      UPDATE T_TEXT_DETAILS
	SET F_TEXT_KEY = F_LANGUAGE || F_TEXT_CODE
	WHERE F_PREFIX = '&newcode' AND F_TEXT_TYPE = 'TX';


      UPDATE T_TEXT_DETAILS
	SET F_TEXT_CODE = '&newcode',
	F_PREFIX = '&newcode',
	F_TEXT_KEY = F_LANGUAGE || '&newcode'
	WHERE F_PREFIX = '&oldcode' AND F_TEXT_TYPE = 'DT';


      UPDATE T_TEXT_HEADERS
	SET F_TEXT_CODE = '&newcode'
      WHERE F_TEXT_CODE ='&oldcode';


      UPDATE T_TEXT_HEADERS
	SET F_TEXT_CODE = replace(F_TEXT_CODE,'&oldcode','&newcode' || '&zeroes')
      WHERE F_TEXT_CODE like '&oldcode' || '%';

--      COMMIT;

SPOOL OFF;

