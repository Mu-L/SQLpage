set html = 'It ';
select 'dynamic' as component, sqlpage.run_sql('tests/components/display_text.sql') as properties;
set html = 'works !';
select 'dynamic' as component, sqlpage.run_sql('tests/components/display_text.sql') as properties;