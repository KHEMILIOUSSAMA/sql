/*** create tables **/
/* Sql script */
CREATE TABLE regions
    ( region_id      int  NOT NULL 
    , region_name    VARCHAR(50) 
    );
ALTER TABLE regions
ADD  CONSTRAINT reg_id_pk        		 PRIMARY KEY (region_id)     ;
/*****************************************************/
CREATE TABLE countries 
    ( country_id      CHAR(2)  NOT NULL 
    , country_name    VARCHAR(40) 
    , region_id       int 
    , CONSTRAINT     country_c_id_pk 
        	     PRIMARY KEY (country_id) 
    ) ;
	 ALTER TABLE countries
ADD  CONSTRAINT countr_reg_fk
        	 FOREIGN KEY (region_id)
          	  REFERENCES regions(region_id) 
     ;

	 CREATE TABLE locations
    ( location_id    int NOT NULL
    , street_address VARCHAR(40)
    , postal_code    VARCHAR(12)
    , city       VARCHAR(30)  NOT NULL
    , state_province VARCHAR(25)
    , country_id     CHAR(2)
    ) ;


	alter table locations 
	 add   country_id     CHAR(2) not null;

	ALTER TABLE locations
ADD  CONSTRAINT loc_id_pk        		 PRIMARY KEY (location_id)     
   , CONSTRAINT loc_c_id_fk        		 FOREIGN KEY (country_id)        	  REFERENCES countries(country_id) 
     ;

	 CREATE TABLE departments
    ( department_id    int NOT NULL
    , department_name  VARCHAR(30) NOT NULL
    , manager_id       int NOT NULL
    , location_id      int NOT NULL
    ) ;


ALTER TABLE departments
ADD  CONSTRAINT dept_id_pk
       		 PRIMARY KEY (department_id)
    , CONSTRAINT dept_loc_fk
       		 FOREIGN KEY (location_id)
        	  REFERENCES locations (location_id)
      ;


	  CREATE TABLE jobs
    ( job_id         VARCHAR(10)  not null 
    , job_title      VARCHAR(35)  NOT NULL
    , min_salary     int
    , max_salary     int
    ) ;


ALTER TABLE jobs
ADD  CONSTRAINT job_id_pk
      		 PRIMARY KEY(job_id)
     ;


	 CREATE TABLE employees
    ( employee_id    int  NOT NULL
    , first_name     VARCHAR(20)
    , last_name      VARCHAR(25)  NOT NULL
    , email          VARCHAR(25) NOT NULL
    , phone_number   VARCHAR(20)
    , hire_date      DATE  NOT NULL
    , job_id         VARCHAR(10) NOT NULL
    , salary         int
    , commission_pct int
    , manager_id     int
    , department_id  int
    , CONSTRAINT     emp_salary_min
                     CHECK (salary > 0) 
    , CONSTRAINT     emp_email_uk
                     UNIQUE (email)
    ) ;


	
ALTER TABLE employees
ADD  CONSTRAINT     emp_emp_id_pk
                     PRIMARY KEY (employee_id)
    , CONSTRAINT     emp_dept_fk
                     FOREIGN KEY (department_id)
                      REFERENCES departments
    , CONSTRAINT     emp_job_fk
                     FOREIGN KEY (job_id)
                      REFERENCES jobs (job_id)
    , CONSTRAINT     emp_manager_fk
                     FOREIGN KEY (manager_id)
                      REFERENCES employees
     ;


	 CREATE TABLE job_history
    ( employee_id   int  NOT NULL
    , start_date    DATE NOT NULL
    , end_date      DATE  NOT NULL
    , job_id        VARCHAR(10)  NOT NULL
    , department_id int
    , CONSTRAINT    jhist_date_interval
                    CHECK (end_date > start_date)
    ) ;



ALTER TABLE job_history
ADD  CONSTRAINT jhist_emp_id_st_date_pk
      PRIMARY KEY (employee_id, start_date)
    , CONSTRAINT     jhist_job_fk
                     FOREIGN KEY (job_id)
                     REFERENCES jobs
    , CONSTRAINT     jhist_emp_fk
                     FOREIGN KEY (employee_id)
                     REFERENCES employees
    , CONSTRAINT     jhist_dept_fk
                     FOREIGN KEY (department_id)
                     REFERENCES departments
     ;


	 CREATE  VIEW emp_details_view
  (employee_id,
   job_id,
   manager_id,
   department_id,
   location_id,
   country_id,
   first_name,
   last_name,
   salary,
   commission_pct,
   department_name,
   job_title,
   city,
   state_province,
   country_name,
   region_name)
AS SELECT
  e.employee_id, 
  e.job_id, 
  e.manager_id, 
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id ;