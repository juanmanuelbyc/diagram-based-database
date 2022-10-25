create table medical_histories(
    id integer generated always as identity,
    admited_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status varchar(40),
    PRIMARY KEY (id)
);

-- index for patient_id
create index medical_histories_patient_id_index ON medical_histories(patient_id);

create table patients(
    id integer generated always as identity,
    name varchar(40),
    date_of_birth TIMESTAMP,
    PRIMARY KEY (id)
);

create table treatments(
    id integer generated always as identity,
    type varchar(40),
    name varchar(40),
    PRIMARY KEY (id)
);

create table procedures(
    medical_history_id int REFERENCES medical_histories(id),
    treatment_id int REFERENCES treatments(id),
    PRIMARY KEY (medical_history_id, treatment_id)
);

-- create index for medical history id and treatment id
create index procedure_medical_history_id_index on procedures(medical_history_id);
create index procedure_treatment_id_index on procedures(treatment_id);

-- more tables 
create table invoices(
    id int generated always as identity,
    total_amount decimal 
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id int REFERENCES medical_histories(id)
)

-- create medical history index invoices
create index invoices_medical_history_id_index on invoices(medical_history_id);

create table invoice_items(
    id int generated always as identity,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int REFERENCES invoices(id),
    treatment_id int REFERENCES treatments(id)
)

-- creating indices for invoice id and treamtment id
create index invoice_items_invoice_id_index on invoice_items(invoice_id);
create index invoice_items_treatment_id_index on invoice_items(treatment_id);