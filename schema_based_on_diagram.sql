CREATE TABLE "medical_histories"(
    "id" INTEGER NOT NULL,
    "admited_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "patient_id" INTEGER NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    ADD PRIMARY KEY("id")
);
CREATE TABLE "patients"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL,
    ADD PRIMARY KEY("id")
);
CREATE TABLE "treatments"(
    "id" INTEGER NOT NULL,
    "type" VARCHAR(255) NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    ADD PRIMARY KEY("id")
);
CREATE TABLE "invoices"(
    "id" INTEGER NOT NULL,
    "total_amount" DECIMAL(8, 2) NOT NULL,
    "generated_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "paid_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "medical_history_id" INTEGER NOT NULL,
    "column_6" INTEGER NOT NULL,
    ADD PRIMARY KEY("id")
);
    
CREATE TABLE "invoice_items"(
    "id" INTEGER NOT NULL,
    "unit_price" DECIMAL(8, 2) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "total_price" DECIMAL(8, 2) NOT NULL,
    "invoice_id" INTEGER NOT NULL,
    "treatment_id" INTEGER NOT NULL,
    ADD PRIMARY KEY("id")
);

ALTER TABLE
    "invoices" ADD CONSTRAINT "invoices_medical_history_id_foreign" FOREIGN KEY("medical_history_id") REFERENCES "medical_histories"("id");
ALTER TABLE
    "medical_histories" ADD CONSTRAINT "medical_histories_patient_id_foreign" FOREIGN KEY("patient_id") REFERENCES "patients"("id");
ALTER TABLE
    "invoice_items" ADD CONSTRAINT "invoice_items_treatment_id_foreign" FOREIGN KEY("treatment_id") REFERENCES "treatments"("id");
ALTER TABLE
    "invoice_items" ADD CONSTRAINT "invoice_items_invoice_id_foreign" FOREIGN KEY("invoice_id") REFERENCES "invoices"("id");

CREATE TABLE "medical_treatments" (
    "treatment_id" INTEGER,
    "medical_history_id" INTEGER,
    ADD CONSTRAINT "invoice_items_treatment_id_foreign" FOREIGN KEY("treatment_id") REFERENCES "treatments"("id");
    ADD CONSTRAINT "invoices_medical_history_id_foreign" FOREIGN KEY("medical_history_id") REFERENCES "medical_histories"("id");
);
