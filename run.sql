SET search_path TO LOINC;
DROP TABLE IF EXISTS SourceOrganization;
CREATE TABLE SourceOrganization (
  id  integer,
  copyright_id varchar(255) not null,
  name varchar(255),
  copyright text,
  terms_of_use text,
  url text,
  primary key (copyright_id)
);

DROP TABLE IF EXISTS Loinc;
CREATE TABLE Loinc (
  loinc_num varchar(10) not null,
  component varchar(255),
  property varchar(255),
  time_aspct varchar(255),
  system varchar(255),
  scale_typ varchar(255),
  method_typ varchar(255),
  class varchar(255),
  VersionLastChanged varchar(255),
  chng_type varchar(255),
  DefinitionDescription text,
  status varchar(255),
  consumer_name varchar(255),
  classtype integer,
  formula text,
  exmpl_answers text,
  survey_quest_text text,
  survey_quest_src varchar(50),
  unitsrequired varchar(1),
  submitted_units varchar(30),
  relatednames2 text,
  shortname varchar(255),
  order_obs varchar(15),
  cdisc_common_tests varchar(1),
  hl7_field_subfield_id varchar(50),
  external_copyright_notice text,
  example_units varchar(255),
  long_common_name varchar(255),
  UnitsAndRange text,
  example_ucum_units varchar(255),
  example_si_ucum_units varchar(255),
  status_reason varchar(9),
  status_text text,
  change_reason_public text,
  common_test_rank integer,
  common_order_rank integer,
  common_si_test_rank integer,
  hl7_attachment_structure varchar(15),
  ExternalCopyrightLink varchar(255),
  PanelType varchar(50),
  AskAtOrderEntry varchar(255),
  AssociatedObservations varchar(255),
  VersionFirstReleased varchar(255),
  ValidHL7AttachmentRequest varchar(50),
  DisplayName varchar(255),
  
  primary key (loinc_num)

);

DROP TABLE IF EXISTS MapTo;
CREATE TABLE MapTo (
  loinc varchar(10) NOT NULL,
  map_to varchar(10) NOT NULL,
  comment text,
  primary key (loinc, map_to)

);

COPY Loinc (loinc_num, component, property, time_aspct, system, scale_typ, method_typ, class, VersionLastChanged, chng_type, DefinitionDescription, status, consumer_name, classtype, formula, exmpl_answers, survey_quest_text, survey_quest_src, unitsrequired, submitted_units, relatednames2, shortname, order_obs, cdisc_common_tests, hl7_field_subfield_id, external_copyright_notice, example_units, long_common_name, UnitsAndRange, example_ucum_units, example_si_ucum_units, status_reason, status_text, change_reason_public, common_test_rank, common_order_rank, common_si_test_rank, hl7_attachment_structure, ExternalCopyrightLink, PanelType, AskAtOrderEntry, AssociatedObservations, VersionFirstReleased, ValidHL7AttachmentRequest, DisplayName ) FROM '/Users/mpatel/Desktop/Loinc_2.69_Text_2.69/Loinc.csv' CSV HEADER;

COPY MapTo (loinc, map_to, comment) FROM '/Users/mpatel/Desktop/Loinc_2.69_Text_2.69/MapTo.csv' CSV HEADER;


COPY SourceOrganization (id, copyright_id, name, copyright, terms_of_use, url) FROM '/Users/mpatel/Desktop/Loinc_2.69_Text_2.69/SourceOrganization.csv' CSV HEADER;

select count(*) from Loinc;
select count(*) from MapTo;
select count(*) from SourceOrganization;
