DROP TABLE IF EXISTS department CASCADE;
CREATE TABLE department
(
    department_id integer NOT NULL,
    department_name character varying(30) NOT NULL,
    CONSTRAINT department_pkey PRIMARY KEY (department_id)
);

DROP TABLE IF EXISTS employee CASCADE;
CREATE TABLE employee
(
    employee_id integer NOT NULL,
    department_id integer NOT NULL,
    name character varying(30) NOT NULL,
    surname character varying(30) NOT NULL,
    birthday date NOT NULL,
    passport_number character varying(30) NOT NULL,
    passport_valid_date date,
    CONSTRAINT employee_pkey PRIMARY KEY (employee_id)
);

DROP TABLE IF EXISTS employeerole CASCADE;
DROP TABLE IF EXISTS employeeroles CASCADE;
CREATE TABLE employeeroles
(
    employee_roles_id integer NOT NULL,
    employee_id integer NOT NULL,
    roles_id integer NOT NULL,
    CONSTRAINT employeeroles_pkey PRIMARY KEY (employee_roles_id)
);

DROP TABLE IF EXISTS logon CASCADE;
CREATE TABLE logon
(
    logon_id integer NOT NULL,
    logon_id_date date NOT NULL,
    employee_id integer NOT NULL,
    logon character varying(30) NOT NULL,
    password_hash character varying(30) NOT NULL,
    CONSTRAINT logon_pkey PRIMARY KEY (logon_id, logon_id_date)
);

DROP TABLE IF EXISTS role CASCADE;
DROP TABLE IF EXISTS roles CASCADE;
CREATE TABLE roles
(
    roles_id integer NOT NULL,
    roles_name character varying(30) NOT NULL,
    CONSTRAINT roles_pkey PRIMARY KEY (roles_id)
);

ALTER TABLE employee
    ADD CONSTRAINT department_fkey FOREIGN KEY (department_id)
        REFERENCES department (department_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;
CREATE INDEX IF NOT EXISTS "fki_department_id_fkey"
    ON employee(department_id);


ALTER TABLE employeeroles
    ADD CONSTRAINT employee_id_fkey FOREIGN KEY (employee_id)
        REFERENCES employee (employee_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;
CREATE INDEX IF NOT EXISTS fki_employee_id_fkey
    ON employeeroles(employee_id);


ALTER TABLE employeeroles
    ADD CONSTRAINT roles_id_fkey FOREIGN KEY (roles_id)
        REFERENCES roles (roles_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;
CREATE INDEX IF NOT EXISTS fki_roles_id_fkey
    ON employeeroles(roles_id);


ALTER TABLE logon
    ADD CONSTRAINT employee_id_fkey FOREIGN KEY (employee_id)
        REFERENCES employee (employee_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;