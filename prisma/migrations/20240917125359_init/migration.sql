-- CreateTable
CREATE TABLE "suppliers" (
    "id" SERIAL NOT NULL,
    "suplier_number" TEXT NOT NULL,
    "suplier_name" TEXT NOT NULL,
    "vat_number" TEXT NOT NULL,

    CONSTRAINT "suppliers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "companies" (
    "id" SERIAL NOT NULL,
    "company_name" TEXT NOT NULL,
    "vat_number" TEXT NOT NULL,
    "phone_number_general" TEXT NOT NULL,
    "mail_general" TEXT NOT NULL,
    "bank_name" TEXT NOT NULL,
    "bank_iban" TEXT NOT NULL,
    "bank_bic" TEXT NOT NULL,

    CONSTRAINT "companies_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "company_contact" (
    "id" SERIAL NOT NULL,
    "phone_number_pro" TEXT NOT NULL,
    "mail_pro" TEXT NOT NULL,
    "company_id" INTEGER NOT NULL,
    "contact_id" INTEGER NOT NULL,

    CONSTRAINT "company_contact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contact_customer" (
    "id" SERIAL NOT NULL,
    "phone_number_pro" TEXT NOT NULL,
    "mail_pro" TEXT NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "contact_id" INTEGER NOT NULL,

    CONSTRAINT "contact_customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contact_supplier" (
    "id" SERIAL NOT NULL,
    "phone_number_pro" TEXT NOT NULL,
    "mail_pro" TEXT NOT NULL,
    "supplier_id" INTEGER NOT NULL,
    "contact_id" INTEGER NOT NULL,

    CONSTRAINT "contact_supplier_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "contacts" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "fisrtname" TEXT NOT NULL,
    "phone_number_private" TEXT NOT NULL,
    "mail_private" TEXT NOT NULL,
    "address_id" INTEGER NOT NULL,

    CONSTRAINT "contacts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "addresses" (
    "id" SERIAL NOT NULL,
    "address" TEXT NOT NULL,
    "address_number" TEXT NOT NULL,
    "address_box" TEXT NOT NULL,
    "address_complement" TEXT NOT NULL,
    "longitude" DOUBLE PRECISION NOT NULL,
    "latitude" DOUBLE PRECISION NOT NULL,
    "city_id" INTEGER NOT NULL,

    CONSTRAINT "addresses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cities" (
    "id" SERIAL NOT NULL,
    "city" TEXT NOT NULL,
    "zip_code" TEXT NOT NULL,
    "country_id" INTEGER NOT NULL,

    CONSTRAINT "cities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "countries" (
    "id" SERIAL NOT NULL,
    "country" TEXT NOT NULL,
    "iso_code" VARCHAR(2) NOT NULL,

    CONSTRAINT "countries_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "categories" (
    "id" SERIAL NOT NULL,
    "category" VARCHAR(255) NOT NULL,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "customers" (
    "id" SERIAL NOT NULL,
    "customer_number" TEXT NOT NULL,
    "customer_name" TEXT NOT NULL,
    "phone_number" TEXT NOT NULL,
    "fax_number" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "vat_number" TEXT NOT NULL,
    "registered_vat" TEXT NOT NULL,
    "is_active" BOOLEAN NOT NULL,
    "category_id" INTEGER NOT NULL,
    "payment_term_id" INTEGER NOT NULL,

    CONSTRAINT "customers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "payment_terms" (
    "id" SERIAL NOT NULL,
    "payment_term" TEXT NOT NULL,
    "payment_term_code" INTEGER NOT NULL,

    CONSTRAINT "payment_terms_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "invoices" (
    "id" SERIAL NOT NULL,
    "invoice_number" TEXT NOT NULL,
    "invoice_date" TIMESTAMP(3) NOT NULL,
    "due_date" TIMESTAMP(3) NOT NULL,
    "total_amount_exc_tva" DOUBLE PRECISION NOT NULL,
    "total_amount_tva" DOUBLE PRECISION NOT NULL,
    "flag_accounting" BOOLEAN NOT NULL,
    "communication" TEXT NOT NULL,
    "customer_id" INTEGER NOT NULL,

    CONSTRAINT "invoices_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "invoice_item" (
    "id" SERIAL NOT NULL,
    "vat_value" DOUBLE PRECISION NOT NULL,
    "quantity" INTEGER NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "purchase_price" DOUBLE PRECISION NOT NULL,
    "discount" DOUBLE PRECISION NOT NULL,
    "invoice_id" INTEGER NOT NULL,
    "item_id" INTEGER NOT NULL,
    "vat_type_id" INTEGER NOT NULL,

    CONSTRAINT "invoice_item_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "vat_types" (
    "id" SERIAL NOT NULL,
    "vat_type" TEXT NOT NULL,

    CONSTRAINT "vat_types_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "items" (
    "id" SERIAL NOT NULL,
    "item_number" TEXT NOT NULL,
    "supplier_number" TEXT NOT NULL,
    "barcode" TEXT NOT NULL,
    "product_description" TEXT NOT NULL,
    "price" DOUBLE PRECISION NOT NULL,
    "purchase_price" DOUBLE PRECISION NOT NULL,
    "vat_type_id" INTEGER NOT NULL,
    "supplier_id" INTEGER NOT NULL,

    CONSTRAINT "items_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "vat_values" (
    "id" SERIAL NOT NULL,
    "vat_value" DOUBLE PRECISION NOT NULL,
    "vat_type_id" INTEGER NOT NULL,
    "country_id" INTEGER NOT NULL,

    CONSTRAINT "vat_values_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "address_types" (
    "id" SERIAL NOT NULL,
    "address_type" TEXT NOT NULL,

    CONSTRAINT "address_types_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "address_address_type_customer" (
    "id" SERIAL NOT NULL,
    "address_id" INTEGER NOT NULL,
    "address_type_id" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,

    CONSTRAINT "address_address_type_customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "address_address_type_company" (
    "id" SERIAL NOT NULL,
    "address_id" INTEGER NOT NULL,
    "address_type_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,

    CONSTRAINT "address_address_type_company_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "address_address_type_supplier" (
    "id" SERIAL NOT NULL,
    "address_id" INTEGER NOT NULL,
    "address_type_id" INTEGER NOT NULL,
    "supplier_id" INTEGER NOT NULL,

    CONSTRAINT "address_address_type_supplier_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "suppliers_suplier_number_key" ON "suppliers"("suplier_number");

-- CreateIndex
CREATE UNIQUE INDEX "contacts_phone_number_private_key" ON "contacts"("phone_number_private");

-- CreateIndex
CREATE UNIQUE INDEX "contacts_mail_private_key" ON "contacts"("mail_private");

-- CreateIndex
CREATE UNIQUE INDEX "cities_zip_code_key" ON "cities"("zip_code");

-- CreateIndex
CREATE UNIQUE INDEX "countries_iso_code_key" ON "countries"("iso_code");

-- CreateIndex
CREATE UNIQUE INDEX "customers_customer_number_key" ON "customers"("customer_number");

-- CreateIndex
CREATE UNIQUE INDEX "invoices_invoice_number_key" ON "invoices"("invoice_number");

-- CreateIndex
CREATE UNIQUE INDEX "items_item_number_key" ON "items"("item_number");

-- AddForeignKey
ALTER TABLE "company_contact" ADD CONSTRAINT "company_contact_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "companies"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "company_contact" ADD CONSTRAINT "company_contact_contact_id_fkey" FOREIGN KEY ("contact_id") REFERENCES "contacts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contact_customer" ADD CONSTRAINT "contact_customer_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contact_customer" ADD CONSTRAINT "contact_customer_contact_id_fkey" FOREIGN KEY ("contact_id") REFERENCES "contacts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contact_supplier" ADD CONSTRAINT "contact_supplier_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "suppliers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contact_supplier" ADD CONSTRAINT "contact_supplier_contact_id_fkey" FOREIGN KEY ("contact_id") REFERENCES "contacts"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "contacts" ADD CONSTRAINT "contacts_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "addresses"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "addresses" ADD CONSTRAINT "addresses_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "cities"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cities" ADD CONSTRAINT "cities_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "customers" ADD CONSTRAINT "customers_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "customers" ADD CONSTRAINT "customers_payment_term_id_fkey" FOREIGN KEY ("payment_term_id") REFERENCES "payment_terms"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "invoices" ADD CONSTRAINT "invoices_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "invoice_item" ADD CONSTRAINT "invoice_item_invoice_id_fkey" FOREIGN KEY ("invoice_id") REFERENCES "invoices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "invoice_item" ADD CONSTRAINT "invoice_item_item_id_fkey" FOREIGN KEY ("item_id") REFERENCES "items"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "invoice_item" ADD CONSTRAINT "invoice_item_vat_type_id_fkey" FOREIGN KEY ("vat_type_id") REFERENCES "vat_types"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "items" ADD CONSTRAINT "items_vat_type_id_fkey" FOREIGN KEY ("vat_type_id") REFERENCES "vat_types"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "items" ADD CONSTRAINT "items_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "suppliers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vat_values" ADD CONSTRAINT "vat_values_vat_type_id_fkey" FOREIGN KEY ("vat_type_id") REFERENCES "vat_types"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "vat_values" ADD CONSTRAINT "vat_values_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "address_address_type_customer" ADD CONSTRAINT "address_address_type_customer_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "addresses"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "address_address_type_customer" ADD CONSTRAINT "address_address_type_customer_address_type_id_fkey" FOREIGN KEY ("address_type_id") REFERENCES "address_types"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "address_address_type_customer" ADD CONSTRAINT "address_address_type_customer_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "customers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "address_address_type_company" ADD CONSTRAINT "address_address_type_company_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "addresses"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "address_address_type_company" ADD CONSTRAINT "address_address_type_company_address_type_id_fkey" FOREIGN KEY ("address_type_id") REFERENCES "address_types"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "address_address_type_company" ADD CONSTRAINT "address_address_type_company_company_id_fkey" FOREIGN KEY ("company_id") REFERENCES "companies"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "address_address_type_supplier" ADD CONSTRAINT "address_address_type_supplier_address_id_fkey" FOREIGN KEY ("address_id") REFERENCES "addresses"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "address_address_type_supplier" ADD CONSTRAINT "address_address_type_supplier_address_type_id_fkey" FOREIGN KEY ("address_type_id") REFERENCES "address_types"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "address_address_type_supplier" ADD CONSTRAINT "address_address_type_supplier_supplier_id_fkey" FOREIGN KEY ("supplier_id") REFERENCES "suppliers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
