DROP TABLE if EXISTS employee;

CREATE TABLE IF NOT EXISTS public.employee
(
    employee_id integer NOT NULL,
    department_id integer NOT NULL,
    name character varying(30) NOT NULL,
    surname character varying(30) NOT NULL,
    birthday date NOT NULL,
    passport_number character varying(30) NOT NULL,
    passport_valid_date date,
    PRIMARY KEY (employee_id)
);

CREATE TABLE IF NOT EXISTS public.department
(
    department_id integer NOT NULL,
    department_name character varying(30) NOT NULL,
    PRIMARY KEY (department_id)
);

CREATE TABLE IF NOT EXISTS public.role
(
    role_id integer NOT NULL,
    role_name character varying(30) NOT NULL,
    PRIMARY KEY (role_id)
);

CREATE TABLE IF NOT EXISTS public.employeerole
(
    employee_role_id integer NOT NULL,
    role_id integer NOT NULL,
    employee_id integer NOT NULL,
    PRIMARY KEY (employee_role_id)
);

CREATE TABLE IF NOT EXISTS public.logon
(
    logon_id integer NOT NULL,
    logon_id_date date NOT NULL,
    employee_id integer NOT NULL,
    logon character varying(30) NOT NULL,
    password_hash character varying(30) NOT NULL,
    PRIMARY KEY (logon_id, logon_id_date)
);