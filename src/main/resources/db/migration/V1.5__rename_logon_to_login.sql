DROP TABLE IF EXISTS logon CASCADE;
CREATE TABLE login
(
    login_id integer NOT NULL,
    login_id_date date NOT NULL,
    employee_id integer NOT NULL,
    login character varying(30) NOT NULL,
    password_hash character varying(30) NOT NULL,
    CONSTRAINT login_pkey PRIMARY KEY (login_id, login_id_date)
);

ALTER TABLE login
    ADD CONSTRAINT employee_id_fkey FOREIGN KEY (employee_id)
        REFERENCES employee (employee_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID;