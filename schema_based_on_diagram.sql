create table medical_histories(
    id integer generated always as identity,
    admited_at TIMESTAMP,
    patient_id INT REFERENCES patients(id),
    status varchar(40),
    PRIMARY KEY (id)
);

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

-- more tables 
create table invoices(
    id int generated always as identity,
    total_amount decimal 
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id int REFERENCES medical_histories(id)
)

create table invoice_items(
    id int generated always as identity,
    unit_price decimal,
    quantity int,
    total_price decimal,
    invoice_id int REFERENCES invoices(id),
    treatment_id int REFERENCES treatments(id)
)