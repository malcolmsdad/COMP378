	CREATE TABLE physicians (
		phid		NUMBER(5) GENERATED ALWAYS AS IDENTITY,
		name		VARCHAR2(150),
		pager_number	VARCHAR2(50),
		specialization	VARCHAR2(50),
		salary		NUMBER(10),

		CONSTRAINT pk_phid PRIMARY KEY (phid)
	);


	CREATE TABLE care_centers (
		cid		NUMBER(5) GENERATED ALWAYS AS IDENTITY, 
		name		VARCHAR2(150),
		location	VARCHAR2(150),
		nurse_charge_id	NUMBER(5),

		CONSTRAINT pk_cid PRIMARY KEY (cid),
	);

	CREATE TABLE patients (
	    pid     		NUMBER(5) GENERATED ALWAYS AS IDENTITY,
	    name		VARCHAR2(150),
	    address 		VARCHAR2(150),
	    telephone 		VARCHAR2(15),
	    care_center_id 	NUMBER(5),

	    CONSTRAINT pk_pid PRIMARY KEY (pid),
	    CONSTRAINT fk_patients_care_center_id FOREIGN KEY (care_center_id) 
		REFERENCES care_centers(cid)
	);

	CREATE TABLE treatments (
		tid		NUMBER(5) GENERATED ALWAYS AS IDENTITY,
		patient_id	NUMBER(5),
		physician_id	NUMBER(5),
		treatment_name	VARCHAR2(150),
		date		DATE,

		CONSTRAINT pk_tid PRIMARY KEY (tid),
		CONSTRAINT fk_treatment_patient FOREIGN KEY (patient_id)
			REFERENCES patients(pid),
		CONSTRAINT fk_treatment_physician FOREIGN KEY (physician_id)
			REFERENCES physicians(phid)
	);

	CREATE TABLE nurses (
		nid			NUMBER(5) GENERATED ALWAYS AS IDENTITY,
		name			VARCHAR2(150),
		care_center_id		NUMBER(5),
		certificate_type	VARCHAR2(10),
		telephone		VARCHAR2(10),
		salary			NUMBER(10),

		CONSTRAINT pk_nid PRIMARY KEY (nid),
		CONSTRAINT fk_nurse_care_center FOREIGN KEY (care_center_id)
			REFERENCES care_centers(cid)
	);

	ALTER TABLE care_centers 
		ADD CONSTRAINT fk_care_center_nurse_ic FOREIGN KEY (nurse_charge_id) 
			REFERENCES nurses(nid);
			
	--- * Indexes:  Oracle creates indexes for primary keys automatically, so we'll just create look-up or behavior related
	CREATE INDEX idx_patient_care_center on
		patients(care_center_id);
	
	CREATE INDEX idx_treatments_patient_id on
		treatments(patient_id);
	CREATE INDEX idx_treatment_physician_id on
		treatments(physician_id);
	CREATE INDEX idx_treatment_date on
		treatments(date);
	
	CREATE INDEX idx_nurses_care_center_id on 
		nurses(care_center_id);
	CREATE INDEX idx_nurses_cert_type on
		nurses(certificate_type);
	