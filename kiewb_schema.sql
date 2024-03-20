--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-1.pgdg110+1)
-- Dumped by pg_dump version 14.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ai_processmetadata; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.ai_processmetadata (
    customerid character varying(200),
    tenantid character varying(200),
    workflow_id character varying(200),
    tower_name character varying(200),
    description character varying(1000),
    img_url character varying(500),
    createdby character varying(100),
    manual_effort numeric(7,2),
    cost_per_hour numeric(7,2)
);


ALTER TABLE public.ai_processmetadata OWNER TO kiewb;

--
-- Name: ai_sharedprocesses; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.ai_sharedprocesses (
    customerid character varying(100),
    tenantid character varying(100),
    processid character varying(100),
    imgurl character varying(100),
    processname character varying(100),
    description character varying(500),
    category character varying(50),
    sharedwith character varying(100)
);


ALTER TABLE public.ai_sharedprocesses OWNER TO kiewb;

--
-- Name: attachment; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.attachment (
    id bigint NOT NULL,
    accesstype integer,
    attachedat timestamp without time zone,
    attachmentcontentid bigint NOT NULL,
    contenttype character varying(255),
    name character varying(255),
    attachment_size integer,
    attachedby_id character varying(255),
    taskdata_attachments_id bigint
);


ALTER TABLE public.attachment OWNER TO kiewb;

--
-- Name: audittaskimpl; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.audittaskimpl (
    id bigint NOT NULL,
    activationtime timestamp without time zone,
    actualowner character varying(255),
    createdby character varying(255),
    createdon timestamp without time zone,
    deploymentid character varying(255),
    description character varying(255),
    duedate timestamp without time zone,
    name character varying(255),
    parentid bigint NOT NULL,
    priority integer NOT NULL,
    processid character varying(255),
    processinstanceid bigint NOT NULL,
    processsessionid bigint NOT NULL,
    status character varying(255),
    taskid bigint,
    workitemid bigint
);


ALTER TABLE public.audittaskimpl OWNER TO kiewb;

--
-- Name: bamtasksummary; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.bamtasksummary (
    pk bigint NOT NULL,
    createddate timestamp without time zone,
    duration bigint,
    enddate timestamp without time zone,
    processinstanceid bigint NOT NULL,
    startdate timestamp without time zone,
    status character varying(255),
    taskid bigint NOT NULL,
    taskname character varying(255),
    userid character varying(255),
    optlock integer
);


ALTER TABLE public.bamtasksummary OWNER TO kiewb;

--
-- Name: booleanexpression; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.booleanexpression (
    id bigint NOT NULL,
    expression text,
    type character varying(255),
    escalation_constraints_id bigint
);


ALTER TABLE public.booleanexpression OWNER TO kiewb;

--
-- Name: content; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.content (
    id bigint NOT NULL,
    content oid
);


ALTER TABLE public.content OWNER TO kiewb;

--
-- Name: contextmappinginfo; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.contextmappinginfo (
    mappingid bigint NOT NULL,
    context_id character varying(255) NOT NULL,
    ksession_id bigint NOT NULL,
    owner_id character varying(255),
    optlock integer
);


ALTER TABLE public.contextmappinginfo OWNER TO kiewb;

--
-- Name: correlationkeyinfo; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.correlationkeyinfo (
    keyid bigint NOT NULL,
    name character varying(255),
    processinstanceid bigint NOT NULL,
    optlock integer
);


ALTER TABLE public.correlationkeyinfo OWNER TO kiewb;

--
-- Name: correlationpropertyinfo; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.correlationpropertyinfo (
    propertyid bigint NOT NULL,
    name character varying(255),
    value character varying(255),
    optlock integer,
    correlationkey_keyid bigint
);


ALTER TABLE public.correlationpropertyinfo OWNER TO kiewb;

--
-- Name: customerkiedata; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.customerkiedata (
    customerid character varying(500),
    tenantid character varying(60),
    kiehttptype character varying(5),
    kieserveraddress character varying(100),
    kieport character varying(6),
    kieauthuser character varying(15),
    kieauthpassword character varying(500),
    kieserverid character varying(15),
    kiedbhost character varying(100),
    kiedbuser character varying(15),
    kiedbpassword character varying(500),
    kiedbname character varying(500)
);


ALTER TABLE public.customerkiedata OWNER TO kiewb;

--
-- Name: deadline; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.deadline (
    id bigint NOT NULL,
    deadline_date timestamp without time zone,
    escalated smallint,
    deadlines_startdeadline_id bigint,
    deadlines_enddeadline_id bigint
);


ALTER TABLE public.deadline OWNER TO kiewb;

--
-- Name: delegation_delegates; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.delegation_delegates (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.delegation_delegates OWNER TO kiewb;

--
-- Name: deploymentstore; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.deploymentstore (
    id bigint NOT NULL,
    attributes character varying(255),
    deployment_id character varying(255),
    deploymentunit text,
    state integer,
    updatedate timestamp without time zone
);


ALTER TABLE public.deploymentstore OWNER TO kiewb;

--
-- Name: email_header; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.email_header (
    id bigint NOT NULL,
    body text,
    fromaddress character varying(255),
    language character varying(255),
    replytoaddress character varying(255),
    subject character varying(255)
);


ALTER TABLE public.email_header OWNER TO kiewb;

--
-- Name: errorinfo; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.errorinfo (
    id bigint NOT NULL,
    message character varying(255),
    stacktrace character varying(5000),
    "timestamp" timestamp without time zone,
    request_id bigint NOT NULL
);


ALTER TABLE public.errorinfo OWNER TO kiewb;

--
-- Name: escalation; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.escalation (
    id bigint NOT NULL,
    name character varying(255),
    deadline_escalation_id bigint
);


ALTER TABLE public.escalation OWNER TO kiewb;

--
-- Name: eventtypes; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.eventtypes (
    instanceid bigint NOT NULL,
    element character varying(255)
);


ALTER TABLE public.eventtypes OWNER TO kiewb;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: kiewb
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO kiewb;

--
-- Name: i18ntext; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.i18ntext (
    id bigint NOT NULL,
    language character varying(255),
    shorttext character varying(255),
    text text,
    task_subjects_id bigint,
    task_names_id bigint,
    task_descriptions_id bigint,
    reassignment_documentation_id bigint,
    notification_subjects_id bigint,
    notification_names_id bigint,
    notification_documentation_id bigint,
    notification_descriptions_id bigint,
    deadline_documentation_id bigint
);


ALTER TABLE public.i18ntext OWNER TO kiewb;

--
-- Name: kiewbauthroles; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.kiewbauthroles (
    userid character varying(100),
    role character varying(50)
);


ALTER TABLE public.kiewbauthroles OWNER TO kiewb;

--
-- Name: kiewbauthusers; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.kiewbauthusers (
    userid character varying(100),
    password character varying(100),
    emailid character varying(100)
);


ALTER TABLE public.kiewbauthusers OWNER TO kiewb;

--
-- Name: nodeinstancelog; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.nodeinstancelog (
    id bigint NOT NULL,
    connection character varying(255),
    log_date timestamp without time zone,
    externalid character varying(255),
    nodeid character varying(255),
    nodeinstanceid character varying(255),
    nodename character varying(255),
    nodetype character varying(255),
    processid character varying(255),
    processinstanceid bigint NOT NULL,
    type integer NOT NULL,
    workitemid bigint
);


ALTER TABLE public.nodeinstancelog OWNER TO kiewb;

--
-- Name: notification; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.notification (
    dtype character varying(31) NOT NULL,
    id bigint NOT NULL,
    priority integer NOT NULL,
    escalation_notifications_id bigint
);


ALTER TABLE public.notification OWNER TO kiewb;

--
-- Name: notification_bas; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.notification_bas (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.notification_bas OWNER TO kiewb;

--
-- Name: notification_email_header; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.notification_email_header (
    notification_id bigint NOT NULL,
    emailheaders_id bigint NOT NULL,
    mapkey character varying(255) NOT NULL
);


ALTER TABLE public.notification_email_header OWNER TO kiewb;

--
-- Name: notification_recipients; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.notification_recipients (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.notification_recipients OWNER TO kiewb;

--
-- Name: organizationalentity; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.organizationalentity (
    dtype character varying(31) NOT NULL,
    id character varying(255) NOT NULL
);


ALTER TABLE public.organizationalentity OWNER TO kiewb;

--
-- Name: peopleassignments_bas; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.peopleassignments_bas (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.peopleassignments_bas OWNER TO kiewb;

--
-- Name: peopleassignments_exclowners; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.peopleassignments_exclowners (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.peopleassignments_exclowners OWNER TO kiewb;

--
-- Name: peopleassignments_potowners; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.peopleassignments_potowners (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.peopleassignments_potowners OWNER TO kiewb;

--
-- Name: peopleassignments_recipients; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.peopleassignments_recipients (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.peopleassignments_recipients OWNER TO kiewb;

--
-- Name: peopleassignments_stakeholders; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.peopleassignments_stakeholders (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.peopleassignments_stakeholders OWNER TO kiewb;

--
-- Name: processexecutionhistory; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.processexecutionhistory (
    customerid character varying(500),
    tenantid character varying(60),
    processid character varying(200),
    executionid character varying(100),
    status character varying(10),
    connectedprocessid character varying(9),
    executedby character varying(100)
);


ALTER TABLE public.processexecutionhistory OWNER TO kiewb;

--
-- Name: processinstanceinfo; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.processinstanceinfo (
    instanceid bigint NOT NULL,
    lastmodificationdate timestamp without time zone,
    lastreaddate timestamp without time zone,
    processid character varying(255),
    processinstancebytearray oid,
    startdate timestamp without time zone,
    state integer NOT NULL,
    optlock integer
);


ALTER TABLE public.processinstanceinfo OWNER TO kiewb;

--
-- Name: processinstancelog; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.processinstancelog (
    id bigint NOT NULL,
    correlationkey character varying(255),
    duration bigint,
    end_date timestamp without time zone,
    externalid character varying(255),
    user_identity character varying(255),
    outcome character varying(255),
    parentprocessinstanceid bigint,
    processid character varying(255),
    processinstancedescription character varying(255),
    processinstanceid bigint NOT NULL,
    processname character varying(255),
    processversion character varying(255),
    start_date timestamp without time zone,
    status integer
);


ALTER TABLE public.processinstancelog OWNER TO kiewb;

--
-- Name: querydefinitionstore; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.querydefinitionstore (
    id bigint NOT NULL,
    qexpression text,
    qname character varying(255),
    qsource character varying(255),
    qtarget character varying(255)
);


ALTER TABLE public.querydefinitionstore OWNER TO kiewb;

--
-- Name: reassignment; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.reassignment (
    id bigint NOT NULL,
    escalation_reassignments_id bigint
);


ALTER TABLE public.reassignment OWNER TO kiewb;

--
-- Name: reassignment_potentialowners; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.reassignment_potentialowners (
    task_id bigint NOT NULL,
    entity_id character varying(255) NOT NULL
);


ALTER TABLE public.reassignment_potentialowners OWNER TO kiewb;

--
-- Name: requestinfo; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.requestinfo (
    id bigint NOT NULL,
    commandname character varying(255),
    deploymentid character varying(255),
    executions integer NOT NULL,
    businesskey character varying(255),
    message character varying(255),
    owner character varying(255),
    requestdata oid,
    responsedata oid,
    retries integer NOT NULL,
    status character varying(255),
    "timestamp" timestamp without time zone
);


ALTER TABLE public.requestinfo OWNER TO kiewb;

--
-- Name: sessioninfo; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.sessioninfo (
    id bigint NOT NULL,
    lastmodificationdate timestamp without time zone,
    rulesbytearray oid,
    startdate timestamp without time zone,
    optlock integer
);


ALTER TABLE public.sessioninfo OWNER TO kiewb;

--
-- Name: task; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.task (
    id bigint NOT NULL,
    archived smallint,
    allowedtodelegate character varying(255),
    description character varying(255),
    formname character varying(255),
    name character varying(255),
    priority integer NOT NULL,
    subtaskstrategy character varying(255),
    subject character varying(255),
    activationtime timestamp without time zone,
    createdon timestamp without time zone,
    deploymentid character varying(255),
    documentaccesstype integer,
    documentcontentid bigint NOT NULL,
    documenttype character varying(255),
    expirationtime timestamp without time zone,
    faultaccesstype integer,
    faultcontentid bigint NOT NULL,
    faultname character varying(255),
    faulttype character varying(255),
    outputaccesstype integer,
    outputcontentid bigint NOT NULL,
    outputtype character varying(255),
    parentid bigint NOT NULL,
    previousstatus integer,
    processid character varying(255),
    processinstanceid bigint NOT NULL,
    processsessionid bigint NOT NULL,
    skipable boolean NOT NULL,
    status character varying(255),
    workitemid bigint NOT NULL,
    tasktype character varying(255),
    optlock integer,
    taskinitiator_id character varying(255),
    actualowner_id character varying(255),
    createdby_id character varying(255)
);


ALTER TABLE public.task OWNER TO kiewb;

--
-- Name: task_comment; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.task_comment (
    id bigint NOT NULL,
    addedat timestamp without time zone,
    text text,
    addedby_id character varying(255),
    taskdata_comments_id bigint
);


ALTER TABLE public.task_comment OWNER TO kiewb;

--
-- Name: taskdef; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.taskdef (
    id bigint NOT NULL,
    name character varying(255),
    priority integer NOT NULL
);


ALTER TABLE public.taskdef OWNER TO kiewb;

--
-- Name: taskevent; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.taskevent (
    id bigint NOT NULL,
    logtime timestamp without time zone,
    message character varying(255),
    processinstanceid bigint,
    taskid bigint,
    type character varying(255),
    userid character varying(255),
    optlock integer,
    workitemid bigint
);


ALTER TABLE public.taskevent OWNER TO kiewb;

--
-- Name: taskexecutionhistory; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.taskexecutionhistory (
    customerid character varying(500),
    tenantid character varying(60),
    processid character varying(100),
    taskid character varying(9),
    executionid character varying(100),
    status character varying(10),
    connectedresponse character varying(200)
);


ALTER TABLE public.taskexecutionhistory OWNER TO kiewb;

--
-- Name: taskvariableimpl; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.taskvariableimpl (
    id bigint NOT NULL,
    modificationdate timestamp without time zone,
    name character varying(255),
    processid character varying(255),
    processinstanceid bigint,
    taskid bigint,
    type integer,
    value character varying(4000)
);


ALTER TABLE public.taskvariableimpl OWNER TO kiewb;

--
-- Name: variableinstancelog; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.variableinstancelog (
    id bigint NOT NULL,
    log_date timestamp without time zone,
    externalid character varying(255),
    oldvalue character varying(255),
    processid character varying(255),
    processinstanceid bigint NOT NULL,
    value character varying(255),
    variableid character varying(255),
    variableinstanceid character varying(255)
);


ALTER TABLE public.variableinstancelog OWNER TO kiewb;

--
-- Name: workiteminfo; Type: TABLE; Schema: public; Owner: kiewb
--

CREATE TABLE public.workiteminfo (
    workitemid bigint NOT NULL,
    creationdate timestamp without time zone,
    name character varying(255),
    processinstanceid bigint NOT NULL,
    state bigint NOT NULL,
    optlock integer,
    workitembytearray oid
);


ALTER TABLE public.workiteminfo OWNER TO kiewb;

--
-- Name: attachment attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT attachment_pkey PRIMARY KEY (id);


--
-- Name: audittaskimpl audittaskimpl_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.audittaskimpl
    ADD CONSTRAINT audittaskimpl_pkey PRIMARY KEY (id);


--
-- Name: bamtasksummary bamtasksummary_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.bamtasksummary
    ADD CONSTRAINT bamtasksummary_pkey PRIMARY KEY (pk);


--
-- Name: booleanexpression booleanexpression_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.booleanexpression
    ADD CONSTRAINT booleanexpression_pkey PRIMARY KEY (id);


--
-- Name: content content_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.content
    ADD CONSTRAINT content_pkey PRIMARY KEY (id);


--
-- Name: contextmappinginfo contextmappinginfo_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.contextmappinginfo
    ADD CONSTRAINT contextmappinginfo_pkey PRIMARY KEY (mappingid);


--
-- Name: correlationkeyinfo correlationkeyinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.correlationkeyinfo
    ADD CONSTRAINT correlationkeyinfo_pkey PRIMARY KEY (keyid);


--
-- Name: correlationpropertyinfo correlationpropertyinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.correlationpropertyinfo
    ADD CONSTRAINT correlationpropertyinfo_pkey PRIMARY KEY (propertyid);


--
-- Name: deadline deadline_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.deadline
    ADD CONSTRAINT deadline_pkey PRIMARY KEY (id);


--
-- Name: deploymentstore deploymentstore_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.deploymentstore
    ADD CONSTRAINT deploymentstore_pkey PRIMARY KEY (id);


--
-- Name: email_header email_header_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.email_header
    ADD CONSTRAINT email_header_pkey PRIMARY KEY (id);


--
-- Name: errorinfo errorinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.errorinfo
    ADD CONSTRAINT errorinfo_pkey PRIMARY KEY (id);


--
-- Name: escalation escalation_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.escalation
    ADD CONSTRAINT escalation_pkey PRIMARY KEY (id);


--
-- Name: i18ntext i18ntext_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.i18ntext
    ADD CONSTRAINT i18ntext_pkey PRIMARY KEY (id);


--
-- Name: nodeinstancelog nodeinstancelog_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.nodeinstancelog
    ADD CONSTRAINT nodeinstancelog_pkey PRIMARY KEY (id);


--
-- Name: notification_email_header notification_email_header_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.notification_email_header
    ADD CONSTRAINT notification_email_header_pkey PRIMARY KEY (notification_id, mapkey);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- Name: organizationalentity organizationalentity_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.organizationalentity
    ADD CONSTRAINT organizationalentity_pkey PRIMARY KEY (id);


--
-- Name: processinstanceinfo processinstanceinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.processinstanceinfo
    ADD CONSTRAINT processinstanceinfo_pkey PRIMARY KEY (instanceid);


--
-- Name: processinstancelog processinstancelog_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.processinstancelog
    ADD CONSTRAINT processinstancelog_pkey PRIMARY KEY (id);


--
-- Name: querydefinitionstore querydefinitionstore_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.querydefinitionstore
    ADD CONSTRAINT querydefinitionstore_pkey PRIMARY KEY (id);


--
-- Name: reassignment reassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.reassignment
    ADD CONSTRAINT reassignment_pkey PRIMARY KEY (id);


--
-- Name: requestinfo requestinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.requestinfo
    ADD CONSTRAINT requestinfo_pkey PRIMARY KEY (id);


--
-- Name: sessioninfo sessioninfo_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.sessioninfo
    ADD CONSTRAINT sessioninfo_pkey PRIMARY KEY (id);


--
-- Name: task_comment task_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.task_comment
    ADD CONSTRAINT task_comment_pkey PRIMARY KEY (id);


--
-- Name: task task_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- Name: taskdef taskdef_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.taskdef
    ADD CONSTRAINT taskdef_pkey PRIMARY KEY (id);


--
-- Name: taskevent taskevent_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.taskevent
    ADD CONSTRAINT taskevent_pkey PRIMARY KEY (id);


--
-- Name: taskvariableimpl taskvariableimpl_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.taskvariableimpl
    ADD CONSTRAINT taskvariableimpl_pkey PRIMARY KEY (id);


--
-- Name: querydefinitionstore uk1dmy087nhbykucpgjipcnyluv; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.querydefinitionstore
    ADD CONSTRAINT uk1dmy087nhbykucpgjipcnyluv UNIQUE (qname);


--
-- Name: deploymentstore uk85rgskt09thd8mkkfl3tb0y81; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.deploymentstore
    ADD CONSTRAINT uk85rgskt09thd8mkkfl3tb0y81 UNIQUE (deployment_id);


--
-- Name: notification_email_header uk_ptaka5kost68h7l3wflv7w6y8; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.notification_email_header
    ADD CONSTRAINT uk_ptaka5kost68h7l3wflv7w6y8 UNIQUE (emailheaders_id);


--
-- Name: variableinstancelog variableinstancelog_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.variableinstancelog
    ADD CONSTRAINT variableinstancelog_pkey PRIMARY KEY (id);


--
-- Name: workiteminfo workiteminfo_pkey; Type: CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.workiteminfo
    ADD CONSTRAINT workiteminfo_pkey PRIMARY KEY (workitemid);


--
-- Name: deadline fk361ggw230po88svgfasg36i2w; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.deadline
    ADD CONSTRAINT fk361ggw230po88svgfasg36i2w FOREIGN KEY (deadlines_startdeadline_id) REFERENCES public.task(id);


--
-- Name: notification_bas fk378pb1cvjv54w4ljqpw99s3wr; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.notification_bas
    ADD CONSTRAINT fk378pb1cvjv54w4ljqpw99s3wr FOREIGN KEY (entity_id) REFERENCES public.organizationalentity(id);


--
-- Name: escalation fk37v8ova8ti6jiblda7n6j298e; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.escalation
    ADD CONSTRAINT fk37v8ova8ti6jiblda7n6j298e FOREIGN KEY (deadline_escalation_id) REFERENCES public.deadline(id);


--
-- Name: task fk48d1bfgwf0jqow1yk8ku4xcpi; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT fk48d1bfgwf0jqow1yk8ku4xcpi FOREIGN KEY (taskinitiator_id) REFERENCES public.organizationalentity(id);


--
-- Name: peopleassignments_exclowners fk5ituvd6t8uvp63hsx6282xo6h; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.peopleassignments_exclowners
    ADD CONSTRAINT fk5ituvd6t8uvp63hsx6282xo6h FOREIGN KEY (entity_id) REFERENCES public.organizationalentity(id);


--
-- Name: i18ntext fk6k8hmfvhko069970eghiy2ifp; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.i18ntext
    ADD CONSTRAINT fk6k8hmfvhko069970eghiy2ifp FOREIGN KEY (notification_descriptions_id) REFERENCES public.notification(id);


--
-- Name: delegation_delegates fk85x3trafk3wfbrv719cafr591; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.delegation_delegates
    ADD CONSTRAINT fk85x3trafk3wfbrv719cafr591 FOREIGN KEY (task_id) REFERENCES public.task(id);


--
-- Name: i18ntext fk8wn7sw34q6bifsi1pvl2b1yyb; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.i18ntext
    ADD CONSTRAINT fk8wn7sw34q6bifsi1pvl2b1yyb FOREIGN KEY (deadline_documentation_id) REFERENCES public.deadline(id);


--
-- Name: peopleassignments_recipients fk9gnbv6bplxkxoedj35vg8n7ir; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.peopleassignments_recipients
    ADD CONSTRAINT fk9gnbv6bplxkxoedj35vg8n7ir FOREIGN KEY (task_id) REFERENCES public.task(id);


--
-- Name: peopleassignments_stakeholders fk9uy76cu650rg1nnkrtjwj1e9t; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.peopleassignments_stakeholders
    ADD CONSTRAINT fk9uy76cu650rg1nnkrtjwj1e9t FOREIGN KEY (entity_id) REFERENCES public.organizationalentity(id);


--
-- Name: peopleassignments_bas fka90cdfgc4km384n1ataqigq67; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.peopleassignments_bas
    ADD CONSTRAINT fka90cdfgc4km384n1ataqigq67 FOREIGN KEY (entity_id) REFERENCES public.organizationalentity(id);


--
-- Name: peopleassignments_stakeholders fkaeyk4nwslvx0jywjomjq7083i; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.peopleassignments_stakeholders
    ADD CONSTRAINT fkaeyk4nwslvx0jywjomjq7083i FOREIGN KEY (task_id) REFERENCES public.task(id);


--
-- Name: notification_bas fkb123fgeomc741s9yc014421yy; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.notification_bas
    ADD CONSTRAINT fkb123fgeomc741s9yc014421yy FOREIGN KEY (task_id) REFERENCES public.notification(id);


--
-- Name: correlationpropertyinfo fkbchyl7kb8i6ghvi3dbr86bgo0; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.correlationpropertyinfo
    ADD CONSTRAINT fkbchyl7kb8i6ghvi3dbr86bgo0 FOREIGN KEY (correlationkey_keyid) REFERENCES public.correlationkeyinfo(keyid);


--
-- Name: i18ntext fkcd6eb4q62d9ab8p0di8pb99ch; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.i18ntext
    ADD CONSTRAINT fkcd6eb4q62d9ab8p0di8pb99ch FOREIGN KEY (task_subjects_id) REFERENCES public.task(id);


--
-- Name: attachment fkd5xpm81gxg8n40167lbu5rbfb; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT fkd5xpm81gxg8n40167lbu5rbfb FOREIGN KEY (attachedby_id) REFERENCES public.organizationalentity(id);


--
-- Name: notification_email_header fkd74pdu41avy2f7a8qyp7wn2n; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.notification_email_header
    ADD CONSTRAINT fkd74pdu41avy2f7a8qyp7wn2n FOREIGN KEY (emailheaders_id) REFERENCES public.email_header(id);


--
-- Name: errorinfo fkdarp6ushq06q39jmij3fdpdbs; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.errorinfo
    ADD CONSTRAINT fkdarp6ushq06q39jmij3fdpdbs FOREIGN KEY (request_id) REFERENCES public.requestinfo(id);


--
-- Name: reassignment fkessy30safh44b30f1cfoujv2k; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.reassignment
    ADD CONSTRAINT fkessy30safh44b30f1cfoujv2k FOREIGN KEY (escalation_reassignments_id) REFERENCES public.escalation(id);


--
-- Name: delegation_delegates fkewkdyi0wrgy9byp6abyglpcxq; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.delegation_delegates
    ADD CONSTRAINT fkewkdyi0wrgy9byp6abyglpcxq FOREIGN KEY (entity_id) REFERENCES public.organizationalentity(id);


--
-- Name: task fkexuboqnbla7jfyyesyo61ucmb; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT fkexuboqnbla7jfyyesyo61ucmb FOREIGN KEY (createdby_id) REFERENCES public.organizationalentity(id);


--
-- Name: notification_email_header fkfdnoyp8rl0kxu29l4pyaa5566; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.notification_email_header
    ADD CONSTRAINT fkfdnoyp8rl0kxu29l4pyaa5566 FOREIGN KEY (notification_id) REFERENCES public.notification(id);


--
-- Name: reassignment_potentialowners fkftegfexshix752bh2jfxf6bnh; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.reassignment_potentialowners
    ADD CONSTRAINT fkftegfexshix752bh2jfxf6bnh FOREIGN KEY (task_id) REFERENCES public.reassignment(id);


--
-- Name: i18ntext fkg2jsybeuc8pbj8ek8xwxutuyo; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.i18ntext
    ADD CONSTRAINT fkg2jsybeuc8pbj8ek8xwxutuyo FOREIGN KEY (notification_names_id) REFERENCES public.notification(id);


--
-- Name: peopleassignments_potowners fkh8oqmk4iuh2pmpgby6g8r3jd1; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.peopleassignments_potowners
    ADD CONSTRAINT fkh8oqmk4iuh2pmpgby6g8r3jd1 FOREIGN KEY (task_id) REFERENCES public.task(id);


--
-- Name: i18ntext fkiogka67sji8fk4cp7a369895i; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.i18ntext
    ADD CONSTRAINT fkiogka67sji8fk4cp7a369895i FOREIGN KEY (task_names_id) REFERENCES public.task(id);


--
-- Name: eventtypes fkj0o3uve2nqo5yrjwrkc9jfttq; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.eventtypes
    ADD CONSTRAINT fkj0o3uve2nqo5yrjwrkc9jfttq FOREIGN KEY (instanceid) REFERENCES public.processinstanceinfo(instanceid);


--
-- Name: attachment fkjj9psk52ifamilliyo16epwpc; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.attachment
    ADD CONSTRAINT fkjj9psk52ifamilliyo16epwpc FOREIGN KEY (taskdata_attachments_id) REFERENCES public.task(id);


--
-- Name: task_comment fkm2mwc1ukcpdsiqwgkoroy6ise; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.task_comment
    ADD CONSTRAINT fkm2mwc1ukcpdsiqwgkoroy6ise FOREIGN KEY (taskdata_comments_id) REFERENCES public.task(id);


--
-- Name: notification_recipients fkn7v944d0hw37bh0auv4gr3hsf; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.notification_recipients
    ADD CONSTRAINT fkn7v944d0hw37bh0auv4gr3hsf FOREIGN KEY (task_id) REFERENCES public.notification(id);


--
-- Name: notification_recipients fkot769nimyq1jvw0m61pgsq5g3; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.notification_recipients
    ADD CONSTRAINT fkot769nimyq1jvw0m61pgsq5g3 FOREIGN KEY (entity_id) REFERENCES public.organizationalentity(id);


--
-- Name: notification fkoxq5uqfg4ylwyijsg2ubyflna; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.notification
    ADD CONSTRAINT fkoxq5uqfg4ylwyijsg2ubyflna FOREIGN KEY (escalation_notifications_id) REFERENCES public.escalation(id);


--
-- Name: i18ntext fkp0m7uhipskrljktvfeubdgfid; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.i18ntext
    ADD CONSTRAINT fkp0m7uhipskrljktvfeubdgfid FOREIGN KEY (notification_documentation_id) REFERENCES public.notification(id);


--
-- Name: deadline fkpeiadnoy228t35213t63c3imm; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.deadline
    ADD CONSTRAINT fkpeiadnoy228t35213t63c3imm FOREIGN KEY (deadlines_enddeadline_id) REFERENCES public.task(id);


--
-- Name: task fkpmkxvqq63aed2y2boruu53a0s; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.task
    ADD CONSTRAINT fkpmkxvqq63aed2y2boruu53a0s FOREIGN KEY (actualowner_id) REFERENCES public.organizationalentity(id);


--
-- Name: task_comment fkqb4mkarf209y9546w7n75lb7a; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.task_comment
    ADD CONSTRAINT fkqb4mkarf209y9546w7n75lb7a FOREIGN KEY (addedby_id) REFERENCES public.organizationalentity(id);


--
-- Name: booleanexpression fkqth56a8k6d8pv6ngsu2vjp4kj; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.booleanexpression
    ADD CONSTRAINT fkqth56a8k6d8pv6ngsu2vjp4kj FOREIGN KEY (escalation_constraints_id) REFERENCES public.escalation(id);


--
-- Name: peopleassignments_exclowners fkqxbjm1b3dl7w8w2f2y6sk0fv8; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.peopleassignments_exclowners
    ADD CONSTRAINT fkqxbjm1b3dl7w8w2f2y6sk0fv8 FOREIGN KEY (task_id) REFERENCES public.task(id);


--
-- Name: i18ntext fkqxgws3fnukyqlaet11tivqg5u; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.i18ntext
    ADD CONSTRAINT fkqxgws3fnukyqlaet11tivqg5u FOREIGN KEY (reassignment_documentation_id) REFERENCES public.reassignment(id);


--
-- Name: peopleassignments_recipients fkrd0h9ud1bhs9waf2mdmiv6j2r; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.peopleassignments_recipients
    ADD CONSTRAINT fkrd0h9ud1bhs9waf2mdmiv6j2r FOREIGN KEY (entity_id) REFERENCES public.organizationalentity(id);


--
-- Name: i18ntext fkrisdlmalotmk64mdeqpo4s5m0; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.i18ntext
    ADD CONSTRAINT fkrisdlmalotmk64mdeqpo4s5m0 FOREIGN KEY (task_descriptions_id) REFERENCES public.task(id);


--
-- Name: peopleassignments_potowners fksa3rrrjsm1qw98ajbbu2s7cjr; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.peopleassignments_potowners
    ADD CONSTRAINT fksa3rrrjsm1qw98ajbbu2s7cjr FOREIGN KEY (entity_id) REFERENCES public.organizationalentity(id);


--
-- Name: reassignment_potentialowners fksqrmpvehlc4qe9i0km22nmkjl; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.reassignment_potentialowners
    ADD CONSTRAINT fksqrmpvehlc4qe9i0km22nmkjl FOREIGN KEY (entity_id) REFERENCES public.organizationalentity(id);


--
-- Name: peopleassignments_bas fkt4xs0glwhbsa0xwg69r6xduv9; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.peopleassignments_bas
    ADD CONSTRAINT fkt4xs0glwhbsa0xwg69r6xduv9 FOREIGN KEY (task_id) REFERENCES public.task(id);


--
-- Name: i18ntext fkthf8ix3t3opf9hya1s04hwsx8; Type: FK CONSTRAINT; Schema: public; Owner: kiewb
--

ALTER TABLE ONLY public.i18ntext
    ADD CONSTRAINT fkthf8ix3t3opf9hya1s04hwsx8 FOREIGN KEY (notification_subjects_id) REFERENCES public.notification(id);


--
-- PostgreSQL database dump complete
--

--
-- Data for Name: kiewbauthroles; Type: TABLE DATA; Schema: public; Owner: kiewb
--

insert into public.kiewbauthusers (userid, password) values ('admin','admin');

--
-- Data for Name: kiewbauthusers; Type: TABLE DATA; Schema: public; Owner: kiewb
--

insert into public.kiewbauthroles (userid, role) values ('admin', 'rest-all');
