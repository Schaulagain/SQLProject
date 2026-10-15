-- Runs the whole project in order. From SQL*Plus or SQLcl, in this folder:
--   @run.sql
-- (@@ resolves each script relative to this file, so it works from any machine.)

SET SERVEROUTPUT ON

@@create_5.sql
@@seq_5.sql
@@alter_5.sql
@@insert_5.sql
@@queriesDB_5.sql
@@unnamedblock_5.sql
@@functionsandprocedures_5.sql
@@package_5.sql
@@cursor_5.sql
@@triggers_5.sql
@@records_5.sql

-- Optional test scripts:
-- @@test_script_function.sql
-- @@test_script_cursors.sql
-- @@test_script_triggers.sql
-- @@test_script_records.sql

-- To remove everything again:
-- @@drop_5.sql
