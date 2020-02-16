--
-- PostgreSQL database dump
--

-- Dumped from database version 10.7 (Ubuntu 10.7-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.7 (Ubuntu 10.7-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: default$default; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "default$default";


ALTER SCHEMA "default$default" OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Address; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."Address" (
    id character varying(25) NOT NULL,
    street text,
    city text,
    state text,
    country text,
    "postCode" text,
    latitude text,
    longitude text,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE "default$default"."Address" OWNER TO postgres;

--
-- Name: ApInvoice; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."ApInvoice" (
    id character varying(25) NOT NULL,
    status text,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    company character varying(25),
    supplier character varying(25)
);


ALTER TABLE "default$default"."ApInvoice" OWNER TO postgres;

--
-- Name: Asset; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."Asset" (
    id character varying(25) NOT NULL,
    name text,
    "dateOfAquisition" timestamp(3) without time zone,
    "aquisitionPrice" numeric(65,30),
    "netBookValue" numeric(65,30),
    depreciation numeric(65,30),
    "salvageValue" numeric(65,30),
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    company character varying(25),
    "assetGroup" character varying(25)
);


ALTER TABLE "default$default"."Asset" OWNER TO postgres;

--
-- Name: AssetGroup; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."AssetGroup" (
    id character varying(25) NOT NULL,
    name text,
    "depreciationType" text,
    "usefulLife" integer,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    company character varying(25)
);


ALTER TABLE "default$default"."AssetGroup" OWNER TO postgres;

--
-- Name: Attachment; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."Attachment" (
    id character varying(25) NOT NULL,
    description text,
    "fileName" text,
    label text,
    url text,
    "s3Bucket" text,
    "s3Key" text,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE "default$default"."Attachment" OWNER TO postgres;

--
-- Name: BankTransaction; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."BankTransaction" (
    id character varying(25) NOT NULL,
    "transactionDate" timestamp(3) without time zone,
    amount numeric(65,30),
    description text,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    company character varying(25)
);


ALTER TABLE "default$default"."BankTransaction" OWNER TO postgres;

--
-- Name: Company; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."Company" (
    id character varying(25) NOT NULL,
    "bankAccount" text,
    "businessType" text,
    country text,
    "govNumber" text,
    currency text,
    "isArchived" boolean,
    "isDeleted" boolean,
    "legalName" text,
    name text NOT NULL,
    "salesTax" boolean,
    "timeSheetSettings" text,
    "websiteURL" text,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    logo character varying(25)
);


ALTER TABLE "default$default"."Company" OWNER TO postgres;

--
-- Name: CompanyMember; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."CompanyMember" (
    id character varying(25) NOT NULL,
    "isArchived" boolean,
    "isDeleted" boolean,
    role text,
    status text,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "user" character varying(25),
    company character varying(25)
);


ALTER TABLE "default$default"."CompanyMember" OWNER TO postgres;

--
-- Name: Contact; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."Contact" (
    id character varying(25) NOT NULL,
    name text,
    surname text,
    email text,
    "mobileCode" text,
    "mobileNumber" text,
    "landlineCode" text,
    "landlineNumber" text,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE "default$default"."Contact" OWNER TO postgres;

--
-- Name: Customer; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."Customer" (
    id character varying(25) NOT NULL,
    description text,
    "govNumber" text,
    "isArchived" boolean,
    "isDeleted" boolean,
    name text,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    company character varying(25)
);


ALTER TABLE "default$default"."Customer" OWNER TO postgres;

--
-- Name: Integration; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."Integration" (
    id character varying(25) NOT NULL,
    data text,
    type text,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    company character varying(25)
);


ALTER TABLE "default$default"."Integration" OWNER TO postgres;

--
-- Name: Inventory; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."Inventory" (
    id character varying(25) NOT NULL,
    name text,
    "inventoryModel" text,
    uom text,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    company character varying(25)
);


ALTER TABLE "default$default"."Inventory" OWNER TO postgres;

--
-- Name: InventoryOnHand; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."InventoryOnHand" (
    id character varying(25) NOT NULL,
    "onHandQty" numeric(65,30),
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    item character varying(25),
    warehouse character varying(25),
    company character varying(25)
);


ALTER TABLE "default$default"."InventoryOnHand" OWNER TO postgres;

--
-- Name: Invoice; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."Invoice" (
    id character varying(25) NOT NULL,
    title text,
    number integer,
    description text,
    "invoiceDate" timestamp(3) without time zone,
    "dueDate" timestamp(3) without time zone,
    status text,
    type text,
    total numeric(65,30),
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    seller character varying(25),
    buyer character varying(25),
    preview character varying(25)
);


ALTER TABLE "default$default"."Invoice" OWNER TO postgres;

--
-- Name: InvoiceItemEntry; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."InvoiceItemEntry" (
    id character varying(25) NOT NULL,
    "order" integer,
    description text,
    name text,
    price numeric(65,30),
    quantity numeric(65,30),
    tax numeric(65,30),
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "timeSheet" character varying(25),
    "timeSheetEntry" character varying(25),
    project character varying(25),
    service character varying(25),
    invoice character varying(25)
);


ALTER TABLE "default$default"."InvoiceItemEntry" OWNER TO postgres;

--
-- Name: LedgerJournal; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."LedgerJournal" (
    id character varying(25) NOT NULL,
    total numeric(65,30),
    description text,
    currency text,
    "includeConsTax" boolean,
    posted boolean,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    company character varying(25)
);


ALTER TABLE "default$default"."LedgerJournal" OWNER TO postgres;

--
-- Name: LedgerPosting; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."LedgerPosting" (
    id character varying(25) NOT NULL,
    "postingType" text,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "mainAccount" character varying(25)
);


ALTER TABLE "default$default"."LedgerPosting" OWNER TO postgres;

--
-- Name: LedgerTransaction; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."LedgerTransaction" (
    id character varying(25) NOT NULL,
    drcr text,
    amount numeric(65,30),
    currency text,
    date timestamp(3) without time zone,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "mainAccount" character varying(25),
    "ledgerJournal" character varying(25),
    company character varying(25)
);


ALTER TABLE "default$default"."LedgerTransaction" OWNER TO postgres;

--
-- Name: MainAccount; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."MainAccount" (
    id character varying(25) NOT NULL,
    code text,
    name text,
    type text,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    company character varying(25)
);


ALTER TABLE "default$default"."MainAccount" OWNER TO postgres;

--
-- Name: PbsOrganisation; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."PbsOrganisation" (
    id character varying(25) NOT NULL,
    code text,
    title text,
    street text,
    city text,
    "stateAddress" text,
    postcode text,
    phone text,
    "effectiveFrom" timestamp(3) without time zone,
    "effectiveTo" timestamp(3) without time zone,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE "default$default"."PbsOrganisation" OWNER TO postgres;

--
-- Name: PbsTPP; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."PbsTPP" (
    id character varying(25) NOT NULL,
    "snomedCode" text,
    "clinicalPreferredTerm" text,
    "packSize" integer,
    "brandName" text,
    "exManufacturerPrice" numeric(65,30),
    "pricingModel" text,
    mpp_id text,
    "effectiveFrom" timestamp(3) without time zone,
    "effectiveTo" timestamp(3) without time zone,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    organisation_id character varying(25)
);


ALTER TABLE "default$default"."PbsTPP" OWNER TO postgres;

--
-- Name: Plan; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."Plan" (
    id character varying(25) NOT NULL,
    is_active boolean,
    is_archived boolean,
    is_deleted boolean,
    max_users integer,
    name text,
    price numeric(65,30),
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    company character varying(25)
);


ALTER TABLE "default$default"."Plan" OWNER TO postgres;

--
-- Name: PoReceipt; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."PoReceipt" (
    id character varying(25) NOT NULL,
    "receiptNumber" text,
    "receiptDate" timestamp(3) without time zone,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "purchaseOrder" character varying(25)
);


ALTER TABLE "default$default"."PoReceipt" OWNER TO postgres;

--
-- Name: PredictedSalesQuantityOfItemsByCompany; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."PredictedSalesQuantityOfItemsByCompany" (
    id character varying(25) NOT NULL,
    "datePredictionRun" timestamp(3) without time zone,
    "predictedSalesValue" numeric(65,30),
    "predictedDate" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    company character varying(25),
    inventory character varying(25)
);


ALTER TABLE "default$default"."PredictedSalesQuantityOfItemsByCompany" OWNER TO postgres;

--
-- Name: PredictedSalesValueByCompany; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."PredictedSalesValueByCompany" (
    id character varying(25) NOT NULL,
    "datePredictionRun" timestamp(3) without time zone,
    "predictedSalesValue" numeric(65,30),
    "predictedDate" timestamp(3) without time zone,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    company character varying(25)
);


ALTER TABLE "default$default"."PredictedSalesValueByCompany" OWNER TO postgres;

--
-- Name: Project; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."Project" (
    id character varying(25) NOT NULL,
    description text,
    "endsAt" timestamp(3) without time zone,
    "isArchived" boolean,
    "isDeleted" boolean,
    name text,
    "startsAt" timestamp(3) without time zone,
    status text,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    company character varying(25),
    customer character varying(25)
);


ALTER TABLE "default$default"."Project" OWNER TO postgres;

--
-- Name: ProjectService; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."ProjectService" (
    id character varying(25) NOT NULL,
    amount numeric(65,30),
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    project character varying(25),
    service character varying(25)
);


ALTER TABLE "default$default"."ProjectService" OWNER TO postgres;

--
-- Name: ProjectServiceRule; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."ProjectServiceRule" (
    id character varying(25) NOT NULL,
    amount numeric(65,30),
    percent numeric(65,30),
    type text,
    "isPercent" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "projectService" character varying(25)
);


ALTER TABLE "default$default"."ProjectServiceRule" OWNER TO postgres;

--
-- Name: PurchaseOrder; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."PurchaseOrder" (
    id character varying(25) NOT NULL,
    date timestamp(3) without time zone,
    status text,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "pbsOrganisation" text,
    "isPbsPO" boolean,
    orderer character varying(25),
    company character varying(25),
    supplier character varying(25)
);


ALTER TABLE "default$default"."PurchaseOrder" OWNER TO postgres;

--
-- Name: PurchaseOrderLine; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."PurchaseOrderLine" (
    id character varying(25) NOT NULL,
    qty integer,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    unit text,
    "unitPrice" numeric(65,30),
    "pbsDrug" text,
    site character varying(25),
    "poReceipt" character varying(25),
    item character varying(25),
    "purchaseOrder" character varying(25)
);


ALTER TABLE "default$default"."PurchaseOrderLine" OWNER TO postgres;

--
-- Name: SalesOrder; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."SalesOrder" (
    id character varying(25) NOT NULL,
    "transactionDate" timestamp(3) without time zone,
    currency text,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    customer character varying(25),
    company character varying(25)
);


ALTER TABLE "default$default"."SalesOrder" OWNER TO postgres;

--
-- Name: SalesOrderLine; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."SalesOrderLine" (
    id character varying(25) NOT NULL,
    qty integer,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "salesOrder" character varying(25),
    inventory character varying(25)
);


ALTER TABLE "default$default"."SalesOrderLine" OWNER TO postgres;

--
-- Name: Service; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."Service" (
    id character varying(25) NOT NULL,
    "billingType" text NOT NULL,
    "includeConsTax" boolean NOT NULL,
    "isArchived" boolean,
    "isDeleted" boolean,
    "isTemplate" boolean,
    name text NOT NULL,
    "timeBasedType" text NOT NULL,
    "totalAmount" numeric(65,30) NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    company character varying(25)
);


ALTER TABLE "default$default"."Service" OWNER TO postgres;

--
-- Name: Session; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."Session" (
    id character varying(25) NOT NULL,
    expires_at timestamp(3) without time zone,
    is_active boolean,
    is_archived boolean,
    is_deleted boolean,
    signed_at timestamp(3) without time zone,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "user" character varying(25)
);


ALTER TABLE "default$default"."Session" OWNER TO postgres;

--
-- Name: Supplier; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."Supplier" (
    id character varying(25) NOT NULL,
    name text,
    "termsOfPayment" text,
    "bankAccount" text,
    "emailAddressForRemittance" text,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    company character varying(25)
);


ALTER TABLE "default$default"."Supplier" OWNER TO postgres;

--
-- Name: TimeSheet; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."TimeSheet" (
    id character varying(25) NOT NULL,
    "endsAt" timestamp(3) without time zone,
    "isArchived" boolean,
    "isDeleted" boolean,
    number integer,
    "startsAt" timestamp(3) without time zone,
    status text,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    company character varying(25),
    preview character varying(25),
    "user" character varying(25)
);


ALTER TABLE "default$default"."TimeSheet" OWNER TO postgres;

--
-- Name: TimeSheetEntry; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."TimeSheetEntry" (
    id character varying(25) NOT NULL,
    date timestamp(3) without time zone,
    duration numeric(65,30),
    "isArchived" boolean,
    "isDeleted" boolean,
    "isInvoiced" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "timeSheet" character varying(25),
    service character varying(25),
    customer character varying(25),
    project character varying(25)
);


ALTER TABLE "default$default"."TimeSheetEntry" OWNER TO postgres;

--
-- Name: User; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."User" (
    id character varying(25) NOT NULL,
    "contactNumber" text,
    email text,
    "firstName" text,
    "isActive" boolean,
    "isArchived" boolean,
    "isDeleted" boolean,
    "isRoot" boolean,
    "jobTitle" text,
    "lastName" text,
    password text,
    "secondAuthEnabled" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    "activePlan" character varying(25)
);


ALTER TABLE "default$default"."User" OWNER TO postgres;

--
-- Name: WareHouse; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."WareHouse" (
    id character varying(25) NOT NULL,
    name text,
    "isArchived" boolean,
    "isDeleted" boolean,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "createdAt" timestamp(3) without time zone NOT NULL,
    company character varying(25)
);


ALTER TABLE "default$default"."WareHouse" OWNER TO postgres;

--
-- Name: _AddressToCompany; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."_AddressToCompany" (
    "A" character varying(25) NOT NULL,
    "B" character varying(25) NOT NULL
);


ALTER TABLE "default$default"."_AddressToCompany" OWNER TO postgres;

--
-- Name: _AddressToCustomer; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."_AddressToCustomer" (
    "A" character varying(25) NOT NULL,
    "B" character varying(25) NOT NULL
);


ALTER TABLE "default$default"."_AddressToCustomer" OWNER TO postgres;

--
-- Name: _AddressToSupplier; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."_AddressToSupplier" (
    "A" character varying(25) NOT NULL,
    "B" character varying(25) NOT NULL
);


ALTER TABLE "default$default"."_AddressToSupplier" OWNER TO postgres;

--
-- Name: _CompanyToContact; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."_CompanyToContact" (
    "A" character varying(25) NOT NULL,
    "B" character varying(25) NOT NULL
);


ALTER TABLE "default$default"."_CompanyToContact" OWNER TO postgres;

--
-- Name: _ContactToCustomer; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."_ContactToCustomer" (
    "A" character varying(25) NOT NULL,
    "B" character varying(25) NOT NULL
);


ALTER TABLE "default$default"."_ContactToCustomer" OWNER TO postgres;

--
-- Name: _InvoiceAttachments; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."_InvoiceAttachments" (
    "A" character varying(25) NOT NULL,
    "B" character varying(25) NOT NULL
);


ALTER TABLE "default$default"."_InvoiceAttachments" OWNER TO postgres;

--
-- Name: _RelayId; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."_RelayId" (
    id character varying(36) NOT NULL,
    "stableModelIdentifier" character varying(25) NOT NULL
);


ALTER TABLE "default$default"."_RelayId" OWNER TO postgres;

--
-- Name: _TimesheetAttachments; Type: TABLE; Schema: default$default; Owner: postgres
--

CREATE TABLE "default$default"."_TimesheetAttachments" (
    "A" character varying(25) NOT NULL,
    "B" character varying(25) NOT NULL
);


ALTER TABLE "default$default"."_TimesheetAttachments" OWNER TO postgres;

--
-- Data for Name: Address; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."Address" (id, street, city, state, country, "postCode", latitude, longitude, "updatedAt", "createdAt") FROM stdin;
cjub0vuaj00240748yxxecnxt	150 Nowhere street	Melbourne	Victoria	Australia	3040	\N	\N	2019-04-10 09:40:01.316	2019-04-10 09:40:01.316
cjuit44dz00380748mpd7pbqg	test	test	test	test	test	\N	\N	2019-04-15 20:24:40.199	2019-04-15 20:24:40.199
cjurdwipe00550748b51h236v	150 Nowhere	test	test	test	3060	\N	\N	2019-04-21 20:28:46.823	2019-04-21 20:28:46.823
cjuughmxe00bs0748bankyzwo	test	test	test	test	test	\N	\N	2019-04-24 00:04:29.903	2019-04-24 00:04:29.903
cjuuglwl000dx0748k8f3jwaa	test	test	test	test	1045	\N	\N	2019-04-24 00:07:49.035	2019-04-24 00:07:49.035
\.


--
-- Data for Name: ApInvoice; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."ApInvoice" (id, status, "isArchived", "isDeleted", "updatedAt", "createdAt", company, supplier) FROM stdin;
\.


--
-- Data for Name: Asset; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."Asset" (id, name, "dateOfAquisition", "aquisitionPrice", "netBookValue", depreciation, "salvageValue", "isArchived", "isDeleted", "updatedAt", "createdAt", company, "assetGroup") FROM stdin;
\.


--
-- Data for Name: AssetGroup; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."AssetGroup" (id, name, "depreciationType", "usefulLife", "isArchived", "isDeleted", "updatedAt", "createdAt", company) FROM stdin;
\.


--
-- Data for Name: Attachment; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."Attachment" (id, description, "fileName", label, url, "s3Bucket", "s3Key", "updatedAt", "createdAt") FROM stdin;
\.


--
-- Data for Name: BankTransaction; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."BankTransaction" (id, "transactionDate", amount, description, "isArchived", "isDeleted", "updatedAt", "createdAt", company) FROM stdin;
\.


--
-- Data for Name: Company; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."Company" (id, "bankAccount", "businessType", country, "govNumber", currency, "isArchived", "isDeleted", "legalName", name, "salesTax", "timeSheetSettings", "websiteURL", "updatedAt", "createdAt", logo) FROM stdin;
cjv64g6s9001i0748huqx2v3k	\N	HEALTH	AU	232434	AUD	f	f	Kudoo	Kudoo	t	{"groupEvery":"MONTHLY","workingHours":8,"approvalsEnabled":false,"autoSendInvoices":false}	https://kudoo.io	2019-05-02 04:00:41.033	2019-05-02 04:00:41.033	\N
cjv64hva8006f07487ga2o6og	\N	OTHER	AU	243434	AUD	f	f	Project Company	Project Company	t	{"groupEvery":"MONTHLY","workingHours":8,"approvalsEnabled":false,"autoSendInvoices":false}	https://kudoo.io	2019-05-02 04:01:59.453	2019-05-02 04:01:59.453	\N
\.


--
-- Data for Name: CompanyMember; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."CompanyMember" (id, "isArchived", "isDeleted", role, status, "updatedAt", "createdAt", "user", company) FROM stdin;
cjuazskfn002a0748vi2ofxce	f	f	OWNER	ACTIVE	2019-04-10 09:09:29.06	2019-04-10 09:09:29.06	\N	\N
cjud2ehtk000w07483o3ggcn0	f	f	OWNER	ACTIVE	2019-04-11 19:58:03.679	2019-04-11 19:58:03.679	\N	\N
cjuueutyn003j0748fhb77gw5	f	f	OWNER	ACTIVE	2019-04-23 23:18:46.302	2019-04-23 23:18:46.302	\N	\N
cjuuexc6i003v0748ff5kpyun	f	f	OWNER	ACTIVE	2019-04-23 23:20:43.238	2019-04-23 23:20:43.238	\N	\N
cjv64g6sm001j0748bq21w54c	f	f	OWNER	ACTIVE	2019-05-02 04:00:41.043	2019-05-02 04:00:41.043	cjv64a2mg000y07488yoze4nf	cjv64g6s9001i0748huqx2v3k
cjv64hvad006g0748cg011gsk	f	f	OWNER	ACTIVE	2019-05-02 04:01:59.454	2019-05-02 04:01:59.454	cjv64a2mg000y07488yoze4nf	cjv64hva8006f07487ga2o6og
\.


--
-- Data for Name: Contact; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."Contact" (id, name, surname, email, "mobileCode", "mobileNumber", "landlineCode", "landlineNumber", "updatedAt", "createdAt") FROM stdin;
cjub0vu9z002207486bbzitbm	Chucky	Cheese	test@test.com	61	0468967210	61	046896721	2019-04-10 09:40:01.315	2019-04-10 09:40:01.315
cjuuglwku00dv0748xw2kac7d	Test	Test	test@test.com	61	0468967210	61	046896721	2019-04-24 00:07:49.035	2019-04-24 00:07:49.035
\.


--
-- Data for Name: Customer; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."Customer" (id, description, "govNumber", "isArchived", "isDeleted", name, "updatedAt", "createdAt", company) FROM stdin;
cjub0vu7t00210748tu6jpakl	\N		f	f	Chuck E Cheese	2019-04-10 09:40:01.278	2019-04-10 09:40:01.278	\N
cjuuglwks00du07481m64mcwq	\N	328372	f	f	Test	2019-04-24 00:07:49.034	2019-04-24 00:07:49.034	\N
\.


--
-- Data for Name: Integration; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."Integration" (id, data, type, "updatedAt", "createdAt", company) FROM stdin;
\.


--
-- Data for Name: Inventory; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."Inventory" (id, name, "inventoryModel", uom, "isArchived", "isDeleted", "updatedAt", "createdAt", company) FROM stdin;
10001	Seretide	\N	\N	\N	\N	2019-04-29 00:00:00	2019-04-29 00:00:00	cjv64g6s9001i0748huqx2v3k
10002	Plendil	\N	\N	\N	\N	2019-04-29 00:00:00	2019-04-29 00:00:00	cjv64g6s9001i0748huqx2v3k
10003	Diane	\N	\N	\N	\N	2019-04-29 00:00:00	2019-04-29 00:00:00	cjv64g6s9001i0748huqx2v3k
10004	Zimstat	\N	\N	\N	\N	2019-04-29 00:00:00	2019-04-29 00:00:00	cjv64g6s9001i0748huqx2v3k
10005	Amoxycillin	\N	\N	\N	\N	2019-04-29 00:00:00	2019-04-29 00:00:00	cjv64g6s9001i0748huqx2v3k
10006	Oxycontin	\N	\N	\N	\N	2019-04-29 00:00:00	2019-04-29 00:00:00	cjv64g6s9001i0748huqx2v3k
10007	Cilamox	\N	\N	\N	\N	2019-04-29 00:00:00	2019-04-29 00:00:00	cjv64g6s9001i0748huqx2v3k
10008	Mabthera	\N	\N	\N	\N	2019-04-29 00:00:00	2019-04-29 00:00:00	cjv64g6s9001i0748huqx2v3k
10009	Natrilix	\N	\N	\N	\N	2019-04-29 00:00:00	2019-04-29 00:00:00	cjv64g6s9001i0748huqx2v3k
10010	Isoptin	\N	\N	\N	\N	2019-04-29 00:00:00	2019-04-29 00:00:00	cjv64g6s9001i0748huqx2v3k
\.


--
-- Data for Name: InventoryOnHand; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."InventoryOnHand" (id, "onHandQty", "isArchived", "isDeleted", "updatedAt", "createdAt", item, warehouse, company) FROM stdin;
\.


--
-- Data for Name: Invoice; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."Invoice" (id, title, number, description, "invoiceDate", "dueDate", status, type, total, "updatedAt", "createdAt", seller, buyer, preview) FROM stdin;
\.


--
-- Data for Name: InvoiceItemEntry; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."InvoiceItemEntry" (id, "order", description, name, price, quantity, tax, "updatedAt", "createdAt", "timeSheet", "timeSheetEntry", project, service, invoice) FROM stdin;
\.


--
-- Data for Name: LedgerJournal; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."LedgerJournal" (id, total, description, currency, "includeConsTax", posted, "isArchived", "isDeleted", "updatedAt", "createdAt", company) FROM stdin;
\.


--
-- Data for Name: LedgerPosting; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."LedgerPosting" (id, "postingType", "isArchived", "isDeleted", "updatedAt", "createdAt", "mainAccount") FROM stdin;
cjuazslc4004c07485gge0yad	REVENUE	f	f	2019-04-10 09:09:30.244	2019-04-10 09:09:30.244	\N
cjuazslm6004s0748qsackub7	BANK	f	f	2019-04-10 09:09:30.605	2019-04-10 09:09:30.605	\N
cjuazslrn00560748w871hzzi	TAXRECEIVABLE	f	f	2019-04-10 09:09:30.803	2019-04-10 09:09:30.803	\N
cjuazslwy005k0748ue4tsvry	DRCONTROL	f	f	2019-04-10 09:09:30.994	2019-04-10 09:09:30.994	\N
cjuazsm1n005y0748eu7qu5jl	TAXPAYABLE	f	f	2019-04-10 09:09:31.163	2019-04-10 09:09:31.163	\N
cjud2eidk002v07485rtguisa	REVENUE	f	f	2019-04-11 19:58:04.423	2019-04-11 19:58:04.423	\N
cjud2eihp00390748zw4itwmi	BANK	f	f	2019-04-11 19:58:04.573	2019-04-11 19:58:04.573	\N
cjud2eimi003s0748scg8gxly	TAXRECEIVABLE	f	f	2019-04-11 19:58:04.746	2019-04-11 19:58:04.746	\N
cjud2eiq300460748ea8t7n6q	DRCONTROL	f	f	2019-04-11 19:58:04.875	2019-04-11 19:58:04.875	\N
cjud2eitf004k07486y66w6iu	TAXPAYABLE	f	f	2019-04-11 19:58:04.995	2019-04-11 19:58:04.995	\N
cjuuexcnr005u0748rlma6385	REVENUE	f	f	2019-04-23 23:20:43.863	2019-04-23 23:20:43.863	\N
cjuuexcrd006807489ufwb59y	BANK	f	f	2019-04-23 23:20:43.993	2019-04-23 23:20:43.993	\N
cjuuexcuw006m07486n37eerh	TAXRECEIVABLE	f	f	2019-04-23 23:20:44.12	2019-04-23 23:20:44.12	\N
cjuuexcye00730748cchwb9qy	DRCONTROL	f	f	2019-04-23 23:20:44.246	2019-04-23 23:20:44.246	\N
cjuuexd2r007j074811fmdafu	TAXPAYABLE	f	f	2019-04-23 23:20:44.403	2019-04-23 23:20:44.403	\N
cjv64g7j7003f0748vna58edr	REVENUE	f	f	2019-05-02 04:00:42.018	2019-05-02 04:00:42.018	cjv64g707001t07484swtpbfv
cjv64g7oa003t07484uimwkyt	BANK	f	f	2019-05-02 04:00:42.202	2019-05-02 04:00:42.202	cjv64g74h00260748evrl4c6s
cjv64g7so004607489vufc73w	TAXRECEIVABLE	f	f	2019-05-02 04:00:42.359	2019-05-02 04:00:42.359	cjv64g77v002g07485yhda5lo
cjv64g7wt004j0748y8dfdxhm	DRCONTROL	f	f	2019-05-02 04:00:42.508	2019-05-02 04:00:42.508	cjv64g7ak002p0748p90deaul
cjv64g80w004w0748dx4sd2wy	TAXPAYABLE	f	f	2019-05-02 04:00:42.656	2019-05-02 04:00:42.656	cjv64g7d7002y0748vr2sbgm2
cjv64hvqw00880748jw4cepap	REVENUE	f	f	2019-05-02 04:02:00.055	2019-05-02 04:02:00.055	cjv64hvdm006q0748dtsr8zlh
cjv64hvvo008q07489qphxp1m	BANK	f	f	2019-05-02 04:02:00.228	2019-05-02 04:02:00.228	cjv64hvfu00720748do0uidik
cjv64hw0o00930748azr346il	TAXRECEIVABLE	f	f	2019-05-02 04:02:00.407	2019-05-02 04:02:00.407	cjv64hvib007d07480gzaive1
cjv64hw4v009g074820cczi0a	DRCONTROL	f	f	2019-05-02 04:02:00.558	2019-05-02 04:02:00.558	cjv64hvl4007m0748j2gtujhb
cjv64hw90009t074837d7hihr	TAXPAYABLE	f	f	2019-05-02 04:02:00.708	2019-05-02 04:02:00.708	cjv64hvmw007v074885srzkti
\.


--
-- Data for Name: LedgerTransaction; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."LedgerTransaction" (id, drcr, amount, currency, date, "isArchived", "isDeleted", "updatedAt", "createdAt", "mainAccount", "ledgerJournal", company) FROM stdin;
\.


--
-- Data for Name: MainAccount; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."MainAccount" (id, code, name, type, "isArchived", "isDeleted", "updatedAt", "createdAt", company) FROM stdin;
cjuazskls002m0748cdhzmvyg	1001	Revenue	REVENUE	f	f	2019-04-10 09:09:29.295	2019-04-10 09:09:29.295	\N
cjuazsku000310748fqiyzt8q	3001	Bank account	ASSET	f	f	2019-04-10 09:09:29.592	2019-04-10 09:09:29.592	\N
cjuazsl05003b0748ccmff8qz	3002	Tax receivable	ASSET	f	f	2019-04-10 09:09:29.812	2019-04-10 09:09:29.812	\N
cjuazsl3e003l0748jwgpd3ub	3003	Debtors control	ASSET	f	f	2019-04-10 09:09:29.93	2019-04-10 09:09:29.93	\N
cjuazsl64003v0748xebyxq7s	4001	Tax payable	LIABILITY	f	f	2019-04-10 09:09:30.028	2019-04-10 09:09:30.028	\N
cjud2ehye00180748gdnk3gab	1001	Revenue	REVENUE	f	f	2019-04-11 19:58:03.877	2019-04-11 19:58:03.877	\N
cjud2ei1r001l0748zmljxx39	3001	Bank account	ASSET	f	f	2019-04-11 19:58:03.999	2019-04-11 19:58:03.999	\N
cjud2ei4r001x0748rbkvx409	3002	Tax receivable	ASSET	f	f	2019-04-11 19:58:04.107	2019-04-11 19:58:04.107	\N
cjud2ei6s00270748d7xdmeca	3003	Debtors control	ASSET	f	f	2019-04-11 19:58:04.18	2019-04-11 19:58:04.18	\N
cjud2ei8t002h0748j3d2f1to	4001	Tax payable	LIABILITY	f	f	2019-04-11 19:58:04.252	2019-04-11 19:58:04.252	\N
cjuuexc9z0047074886lty8jq	1001	Revenue	REVENUE	f	f	2019-04-23 23:20:43.367	2019-04-23 23:20:43.367	\N
cjuuexccf004h0748lc0id8r0	3001	Bank account	ASSET	f	f	2019-04-23 23:20:43.454	2019-04-23 23:20:43.454	\N
cjuuexcf3004u074800fr3pku	3002	Tax receivable	ASSET	f	f	2019-04-23 23:20:43.55	2019-04-23 23:20:43.55	\N
cjuuexchz00560748gcako4ri	3003	Debtors control	ASSET	f	f	2019-04-23 23:20:43.654	2019-04-23 23:20:43.654	\N
cjuuexcjr005g0748up55bj5w	4001	Tax payable	LIABILITY	f	f	2019-04-23 23:20:43.718	2019-04-23 23:20:43.718	\N
cjv64g707001t07484swtpbfv	1001	Revenue	REVENUE	f	f	2019-05-02 04:00:41.334	2019-05-02 04:00:41.334	cjv64g6s9001i0748huqx2v3k
cjv64g74h00260748evrl4c6s	3001	Bank account	ASSET	f	f	2019-05-02 04:00:41.488	2019-05-02 04:00:41.488	cjv64g6s9001i0748huqx2v3k
cjv64g77v002g07485yhda5lo	3002	Tax receivable	ASSET	f	f	2019-05-02 04:00:41.61	2019-05-02 04:00:41.61	cjv64g6s9001i0748huqx2v3k
cjv64g7ak002p0748p90deaul	3003	Debtors control	ASSET	f	f	2019-05-02 04:00:41.707	2019-05-02 04:00:41.707	cjv64g6s9001i0748huqx2v3k
cjv64g7d7002y0748vr2sbgm2	4001	Tax payable	LIABILITY	f	f	2019-05-02 04:00:41.802	2019-05-02 04:00:41.802	cjv64g6s9001i0748huqx2v3k
cjv64hvdm006q0748dtsr8zlh	1001	Revenue	REVENUE	f	f	2019-05-02 04:01:59.578	2019-05-02 04:01:59.578	cjv64hva8006f07487ga2o6og
cjv64hvfu00720748do0uidik	3001	Bank account	ASSET	f	f	2019-05-02 04:01:59.658	2019-05-02 04:01:59.658	cjv64hva8006f07487ga2o6og
cjv64hvib007d07480gzaive1	3002	Tax receivable	ASSET	f	f	2019-05-02 04:01:59.746	2019-05-02 04:01:59.746	cjv64hva8006f07487ga2o6og
cjv64hvl4007m0748j2gtujhb	3003	Debtors control	ASSET	f	f	2019-05-02 04:01:59.847	2019-05-02 04:01:59.847	cjv64hva8006f07487ga2o6og
cjv64hvmw007v074885srzkti	4001	Tax payable	LIABILITY	f	f	2019-05-02 04:01:59.912	2019-05-02 04:01:59.912	cjv64hva8006f07487ga2o6og
\.


--
-- Data for Name: PbsOrganisation; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."PbsOrganisation" (id, code, title, street, city, "stateAddress", postcode, phone, "effectiveFrom", "effectiveTo", "isArchived", "isDeleted", "updatedAt", "createdAt") FROM stdin;
\.


--
-- Data for Name: PbsTPP; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."PbsTPP" (id, "snomedCode", "clinicalPreferredTerm", "packSize", "brandName", "exManufacturerPrice", "pricingModel", mpp_id, "effectiveFrom", "effectiveTo", "isArchived", "isDeleted", "updatedAt", "createdAt", organisation_id) FROM stdin;
\.


--
-- Data for Name: Plan; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."Plan" (id, is_active, is_archived, is_deleted, max_users, name, price, "updatedAt", "createdAt", company) FROM stdin;
\.


--
-- Data for Name: PoReceipt; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."PoReceipt" (id, "receiptNumber", "receiptDate", "isArchived", "isDeleted", "updatedAt", "createdAt", "purchaseOrder") FROM stdin;
\.


--
-- Data for Name: PredictedSalesQuantityOfItemsByCompany; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."PredictedSalesQuantityOfItemsByCompany" (id, "datePredictionRun", "predictedSalesValue", "predictedDate", "createdAt", "updatedAt", company, inventory) FROM stdin;
\.


--
-- Data for Name: PredictedSalesValueByCompany; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."PredictedSalesValueByCompany" (id, "datePredictionRun", "predictedSalesValue", "predictedDate", "createdAt", "updatedAt", company) FROM stdin;
\.


--
-- Data for Name: Project; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."Project" (id, description, "endsAt", "isArchived", "isDeleted", name, "startsAt", status, "updatedAt", "createdAt", company, customer) FROM stdin;
\.


--
-- Data for Name: ProjectService; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."ProjectService" (id, amount, "isArchived", "isDeleted", "updatedAt", "createdAt", project, service) FROM stdin;
\.


--
-- Data for Name: ProjectServiceRule; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."ProjectServiceRule" (id, amount, percent, type, "isPercent", "updatedAt", "createdAt", "projectService") FROM stdin;
\.


--
-- Data for Name: PurchaseOrder; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."PurchaseOrder" (id, date, status, "isArchived", "isDeleted", "updatedAt", "createdAt", "pbsOrganisation", "isPbsPO", orderer, company, supplier) FROM stdin;
cjv2amnli001j0748h61tvjvk	2019-04-29 11:41:59.082	OPEN	f	f	2019-04-29 11:42:35.742	2019-04-29 11:42:35.742	\N	f	\N	\N	\N
cjv2anvj400420748olxel95n	2019-04-29 11:43:00.491	OPEN	f	f	2019-04-29 11:43:32.704	2019-04-29 11:43:32.704	a17789	t	\N	\N	\N
cjv2anvj400400748cko2rftd	2019-04-29 11:43:00.491	OPEN	f	f	2019-04-29 11:43:32.704	2019-04-29 11:43:32.704	a17825	t	\N	\N	\N
\.


--
-- Data for Name: PurchaseOrderLine; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."PurchaseOrderLine" (id, qty, "isArchived", "isDeleted", "updatedAt", "createdAt", unit, "unitPrice", "pbsDrug", site, "poReceipt", item, "purchaseOrder") FROM stdin;
cjv2amnuo001z0748f4ez8xz0	20	f	f	2019-04-29 11:42:36.095	2019-04-29 11:42:36.095	EA	10.000000000000000000000000000000	\N	\N	\N	\N	\N
cjv2anvny004g0748fre9irri	25	f	f	2019-04-29 11:43:32.878	2019-04-29 11:43:32.878	\N	\N	{"id":"a5681", "brandName":"Iclusig", "pbsOrganisation": "a17825"}	\N	\N	\N	\N
cjv2anvua004w07484auzp95o	20	f	f	2019-04-29 11:43:33.106	2019-04-29 11:43:33.106	\N	\N	{"id":"a6411", "brandName":"Viagra", "pbsOrganisation": "a17789"}	\N	\N	\N	\N
\.


--
-- Data for Name: SalesOrder; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."SalesOrder" (id, "transactionDate", currency, "isArchived", "isDeleted", "updatedAt", "createdAt", customer, company) FROM stdin;
cjub0zs1s004507488dm42h8t	2019-04-10 09:42:46.938	AUD	f	f	2019-04-10 09:43:19.241	2019-04-10 09:43:05.152	\N	\N
cjuugon7b00ez0748x9hwobbi	2019-04-24 00:09:15.678	AUD	f	f	2019-04-24 00:09:56.855	2019-04-24 00:09:56.855	\N	\N
\.


--
-- Data for Name: SalesOrderLine; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."SalesOrderLine" (id, qty, "isArchived", "isDeleted", "updatedAt", "createdAt", "salesOrder", inventory) FROM stdin;
cjub0zs7q004h0748pyr1m5v3	20	f	f	2019-04-10 09:43:05.365	2019-04-10 09:43:05.365	\N	\N
cjub1033w005n0748jxiasqai	40	f	f	2019-04-10 09:43:19.484	2019-04-10 09:43:19.484	\N	\N
cjuugoncp00fb0748is5rgcqv	20	f	f	2019-04-24 00:09:57.049	2019-04-24 00:09:57.049	\N	\N
\.


--
-- Data for Name: Service; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."Service" (id, "billingType", "includeConsTax", "isArchived", "isDeleted", "isTemplate", name, "timeBasedType", "totalAmount", "updatedAt", "createdAt", company) FROM stdin;
\.


--
-- Data for Name: Session; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."Session" (id, expires_at, is_active, is_archived, is_deleted, signed_at, "updatedAt", "createdAt", "user") FROM stdin;
\.


--
-- Data for Name: Supplier; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."Supplier" (id, name, "termsOfPayment", "bankAccount", "emailAddressForRemittance", "isArchived", "isDeleted", "updatedAt", "createdAt", company) FROM stdin;
cjuit44d3003707487qygy7m8	John	COD	\N	test@test.com	f	f	2019-04-15 20:24:40.183	2019-04-15 20:24:40.183	\N
cjurdwinz00540748ejmtkqxs	Testing	DAYS_30	\N	test@test.com	f	f	2019-04-21 20:28:46.81	2019-04-21 20:28:46.81	\N
cjuughmxb00br0748xb7f9kde	Chuck E Cheese	DAYS_14	\N	test@test.com	f	f	2019-04-24 00:04:29.903	2019-04-24 00:04:29.903	\N
\.


--
-- Data for Name: TimeSheet; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."TimeSheet" (id, "endsAt", "isArchived", "isDeleted", number, "startsAt", status, "updatedAt", "createdAt", company, preview, "user") FROM stdin;
\.


--
-- Data for Name: TimeSheetEntry; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."TimeSheetEntry" (id, date, duration, "isArchived", "isDeleted", "isInvoiced", "updatedAt", "createdAt", "timeSheet", service, customer, project) FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."User" (id, "contactNumber", email, "firstName", "isActive", "isArchived", "isDeleted", "isRoot", "jobTitle", "lastName", password, "secondAuthEnabled", "updatedAt", "createdAt", "activePlan") FROM stdin;
cjv64a2mg000y07488yoze4nf	\N	jtrollip@gmail.com	Justin	t	f	f	f	\N	Trollip	$2b$10$gDInMjjYPIv.7q06BJDcmOvfSVJtJsywVSmCuPtsMinh08gOZz6Di	f	2019-05-02 03:56:30.092	2019-05-02 03:55:55.661	\N
\.


--
-- Data for Name: WareHouse; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."WareHouse" (id, name, "isArchived", "isDeleted", "updatedAt", "createdAt", company) FROM stdin;
cjud2ve0i007e0748sb04irpa	Melbourne	f	f	2019-04-11 20:11:11.92	2019-04-11 20:11:11.92	\N
cjuugjuz400cu0748d8ihowcu	Melbourne	f	f	2019-04-24 00:06:13.648	2019-04-24 00:06:13.648	\N
cjuw1t2ac00qe0748qxzsug8h	Melbourne	f	f	2019-04-25 02:49:01.128	2019-04-25 02:49:01.128	\N
\.


--
-- Data for Name: _AddressToCompany; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."_AddressToCompany" ("A", "B") FROM stdin;
\.


--
-- Data for Name: _AddressToCustomer; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."_AddressToCustomer" ("A", "B") FROM stdin;
cjub0vuaj00240748yxxecnxt	cjub0vu7t00210748tu6jpakl
cjuuglwl000dx0748k8f3jwaa	cjuuglwks00du07481m64mcwq
\.


--
-- Data for Name: _AddressToSupplier; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."_AddressToSupplier" ("A", "B") FROM stdin;
cjuit44dz00380748mpd7pbqg	cjuit44d3003707487qygy7m8
cjurdwipe00550748b51h236v	cjurdwinz00540748ejmtkqxs
cjuughmxe00bs0748bankyzwo	cjuughmxb00br0748xb7f9kde
\.


--
-- Data for Name: _CompanyToContact; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."_CompanyToContact" ("A", "B") FROM stdin;
\.


--
-- Data for Name: _ContactToCustomer; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."_ContactToCustomer" ("A", "B") FROM stdin;
cjub0vu9z002207486bbzitbm	cjub0vu7t00210748tu6jpakl
cjuuglwku00dv0748xw2kac7d	cjuuglwks00du07481m64mcwq
\.


--
-- Data for Name: _InvoiceAttachments; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."_InvoiceAttachments" ("A", "B") FROM stdin;
\.


--
-- Data for Name: _RelayId; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."_RelayId" (id, "stableModelIdentifier") FROM stdin;
cjuazqpns001s0748018yquki	cjuazlpao0006074894dzt07t
cjuazskfc00290748hwq9rbj6	cjuazlpb200090748xd5c1m0y
cjuazskfn002a0748vi2ofxce	cjuazlpb3000a0748jv4ct8pc
cjuazskls002m0748cdhzmvyg	cjuazlpb7000o07485w35snpx
cjuazsku000310748fqiyzt8q	cjuazlpb7000o07485w35snpx
cjuazsl05003b0748ccmff8qz	cjuazlpb7000o07485w35snpx
cjuazsl3e003l0748jwgpd3ub	cjuazlpb7000o07485w35snpx
cjuazsl64003v0748xebyxq7s	cjuazlpb7000o07485w35snpx
cjuazslc4004c07485gge0yad	cjuazlpb8000r0748yyptk9kj
cjuazslm6004s0748qsackub7	cjuazlpb8000r0748yyptk9kj
cjuazslrn00560748w871hzzi	cjuazlpb8000r0748yyptk9kj
cjuazslwy005k0748ue4tsvry	cjuazlpb8000r0748yyptk9kj
cjuazsm1n005y0748eu7qu5jl	cjuazlpb8000r0748yyptk9kj
cjuazu59z00650748c4j2mzh7	cjuazlpao0006074894dzt07t
cjub0vu7t00210748tu6jpakl	cjuazlpb3000b07488wpns4z8
cjub0vu9z002207486bbzitbm	cjuazlpb200080748g9gxtp26
cjub0vuaj00240748yxxecnxt	cjuazlpb200070748b1excvlg
cjub0zaz9003a07487rbewff4	cjuazlpb8000u0748oeonexn2
cjub0zs1s004507488dm42h8t	cjuazlpba00150748z5rafx6c
cjub0zs7q004h0748pyr1m5v3	cjuazlpba0016074884ez1mq3
cjub1033w005n0748jxiasqai	cjuazlpba0016074884ez1mq3
cjud2ck7n000a0748m33vi2np	cjuazlpao0006074894dzt07t
cjud2ehtd000v0748a1itn4gp	cjuazlpb200090748xd5c1m0y
cjud2ehtk000w07483o3ggcn0	cjuazlpb3000a0748jv4ct8pc
cjud2ehye00180748gdnk3gab	cjuazlpb7000o07485w35snpx
cjud2ei1r001l0748zmljxx39	cjuazlpb7000o07485w35snpx
cjud2ei4r001x0748rbkvx409	cjuazlpb7000o07485w35snpx
cjud2ei6s00270748d7xdmeca	cjuazlpb7000o07485w35snpx
cjud2ei8t002h0748j3d2f1to	cjuazlpb7000o07485w35snpx
cjud2eidk002v07485rtguisa	cjuazlpb8000r0748yyptk9kj
cjud2eihp00390748zw4itwmi	cjuazlpb8000r0748yyptk9kj
cjud2eimi003s0748scg8gxly	cjuazlpb8000r0748yyptk9kj
cjud2eiq300460748ea8t7n6q	cjuazlpb8000r0748yyptk9kj
cjud2eitf004k07486y66w6iu	cjuazlpb8000r0748yyptk9kj
cjud2ve0i007e0748sb04irpa	cjuazlpb8000t07487tg4epo2
cjud2vp9h007w0748il940e84	cjuazlpb8000u0748oeonexn2
cjuit44d3003707487qygy7m8	cjuazlpb9000v074873l2gtgv
cjuit44dz00380748mpd7pbqg	cjuazlpb200070748b1excvlg
cjurdwinz00540748ejmtkqxs	cjuazlpb9000v074873l2gtgv
cjurdwipe00550748b51h236v	cjuazlpb200070748b1excvlg
cjure3tyu005i074864gjepgf	cjuazlpao0006074894dzt07t
cjureetuc00600748dt3f50hj	cjuazlpao0006074894dzt07t
cjuudjuj6002t07483i2ubfwi	cjuazlpao0006074894dzt07t
cjuue55e400300748jxfo79ia	cjuazlpao0006074894dzt07t
cjuueutya003i07482wnxarfm	cjuazlpb200090748xd5c1m0y
cjuueutyn003j0748fhb77gw5	cjuazlpb3000a0748jv4ct8pc
cjuuexc6f003u0748dzs1s4bb	cjuazlpb200090748xd5c1m0y
cjuuexc6i003v0748ff5kpyun	cjuazlpb3000a0748jv4ct8pc
cjuuexc9z0047074886lty8jq	cjuazlpb7000o07485w35snpx
cjuuexccf004h0748lc0id8r0	cjuazlpb7000o07485w35snpx
cjuuexcf3004u074800fr3pku	cjuazlpb7000o07485w35snpx
cjuuexchz00560748gcako4ri	cjuazlpb7000o07485w35snpx
cjuuexcjr005g0748up55bj5w	cjuazlpb7000o07485w35snpx
cjuuexcnr005u0748rlma6385	cjuazlpb8000r0748yyptk9kj
cjuuexcrd006807489ufwb59y	cjuazlpb8000r0748yyptk9kj
cjuuexcuw006m07486n37eerh	cjuazlpb8000r0748yyptk9kj
cjuuexcye00730748cchwb9qy	cjuazlpb8000r0748yyptk9kj
cjuuexd2r007j074811fmdafu	cjuazlpb8000r0748yyptk9kj
cjuuf7jed00940748996ayido	cjuazlpao0006074894dzt07t
cjuughmxb00br0748xb7f9kde	cjuazlpb9000v074873l2gtgv
cjuughmxe00bs0748bankyzwo	cjuazlpb200070748b1excvlg
cjuugiud500cc0748aqz472al	cjuazlpb8000u0748oeonexn2
cjuugjuz400cu0748d8ihowcu	cjuazlpb8000t07487tg4epo2
cjuuglwks00du07481m64mcwq	cjuazlpb3000b07488wpns4z8
cjuuglwku00dv0748xw2kac7d	cjuazlpb200080748g9gxtp26
cjuuglwl000dx0748k8f3jwaa	cjuazlpb200070748b1excvlg
cjuugon7b00ez0748x9hwobbi	cjuazlpba00150748z5rafx6c
cjuugoncp00fb0748is5rgcqv	cjuazlpba0016074884ez1mq3
cjuw1t2ac00qe0748qxzsug8h	cjuazlpb8000t07487tg4epo2
cjv2amnli001j0748h61tvjvk	cjuazlpb9000y07486jnjgjky
cjv2amnuo001z0748f4ez8xz0	cjuazlpba00110748n6ku2iho
cjv2anvj400420748olxel95n	cjuazlpb9000y07486jnjgjky
cjv2anvj400400748cko2rftd	cjuazlpb9000y07486jnjgjky
cjv2anvny004g0748fre9irri	cjuazlpba00110748n6ku2iho
cjv2anvua004w07484auzp95o	cjuazlpba00110748n6ku2iho
\.


--
-- Data for Name: _TimesheetAttachments; Type: TABLE DATA; Schema: default$default; Owner: postgres
--

COPY "default$default"."_TimesheetAttachments" ("A", "B") FROM stdin;
\.


--
-- Name: Address Address_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Address"
    ADD CONSTRAINT "Address_pkey" PRIMARY KEY (id);


--
-- Name: ApInvoice ApInvoice_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."ApInvoice"
    ADD CONSTRAINT "ApInvoice_pkey" PRIMARY KEY (id);


--
-- Name: AssetGroup AssetGroup_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."AssetGroup"
    ADD CONSTRAINT "AssetGroup_pkey" PRIMARY KEY (id);


--
-- Name: Asset Asset_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Asset"
    ADD CONSTRAINT "Asset_pkey" PRIMARY KEY (id);


--
-- Name: Attachment Attachment_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Attachment"
    ADD CONSTRAINT "Attachment_pkey" PRIMARY KEY (id);


--
-- Name: BankTransaction BankTransaction_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."BankTransaction"
    ADD CONSTRAINT "BankTransaction_pkey" PRIMARY KEY (id);


--
-- Name: CompanyMember CompanyMember_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."CompanyMember"
    ADD CONSTRAINT "CompanyMember_pkey" PRIMARY KEY (id);


--
-- Name: Company Company_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Company"
    ADD CONSTRAINT "Company_pkey" PRIMARY KEY (id);


--
-- Name: Contact Contact_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Contact"
    ADD CONSTRAINT "Contact_pkey" PRIMARY KEY (id);


--
-- Name: Customer Customer_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY (id);


--
-- Name: Integration Integration_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Integration"
    ADD CONSTRAINT "Integration_pkey" PRIMARY KEY (id);


--
-- Name: InventoryOnHand InventoryOnHand_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."InventoryOnHand"
    ADD CONSTRAINT "InventoryOnHand_pkey" PRIMARY KEY (id);


--
-- Name: Inventory Inventory_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Inventory"
    ADD CONSTRAINT "Inventory_pkey" PRIMARY KEY (id);


--
-- Name: InvoiceItemEntry InvoiceItemEntry_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."InvoiceItemEntry"
    ADD CONSTRAINT "InvoiceItemEntry_pkey" PRIMARY KEY (id);


--
-- Name: Invoice Invoice_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Invoice"
    ADD CONSTRAINT "Invoice_pkey" PRIMARY KEY (id);


--
-- Name: LedgerJournal LedgerJournal_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."LedgerJournal"
    ADD CONSTRAINT "LedgerJournal_pkey" PRIMARY KEY (id);


--
-- Name: LedgerPosting LedgerPosting_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."LedgerPosting"
    ADD CONSTRAINT "LedgerPosting_pkey" PRIMARY KEY (id);


--
-- Name: LedgerTransaction LedgerTransaction_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."LedgerTransaction"
    ADD CONSTRAINT "LedgerTransaction_pkey" PRIMARY KEY (id);


--
-- Name: MainAccount MainAccount_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."MainAccount"
    ADD CONSTRAINT "MainAccount_pkey" PRIMARY KEY (id);


--
-- Name: PbsOrganisation PbsOrganisation_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PbsOrganisation"
    ADD CONSTRAINT "PbsOrganisation_pkey" PRIMARY KEY (id);


--
-- Name: PbsTPP PbsTPP_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PbsTPP"
    ADD CONSTRAINT "PbsTPP_pkey" PRIMARY KEY (id);


--
-- Name: Plan Plan_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Plan"
    ADD CONSTRAINT "Plan_pkey" PRIMARY KEY (id);


--
-- Name: PoReceipt PoReceipt_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PoReceipt"
    ADD CONSTRAINT "PoReceipt_pkey" PRIMARY KEY (id);


--
-- Name: PredictedSalesQuantityOfItemsByCompany PredictedSalesQuantityOfItemsByCompany_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PredictedSalesQuantityOfItemsByCompany"
    ADD CONSTRAINT "PredictedSalesQuantityOfItemsByCompany_pkey" PRIMARY KEY (id);


--
-- Name: PredictedSalesValueByCompany PredictedSalesValueByCompany_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PredictedSalesValueByCompany"
    ADD CONSTRAINT "PredictedSalesValueByCompany_pkey" PRIMARY KEY (id);


--
-- Name: ProjectServiceRule ProjectServiceRule_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."ProjectServiceRule"
    ADD CONSTRAINT "ProjectServiceRule_pkey" PRIMARY KEY (id);


--
-- Name: ProjectService ProjectService_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."ProjectService"
    ADD CONSTRAINT "ProjectService_pkey" PRIMARY KEY (id);


--
-- Name: Project Project_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Project"
    ADD CONSTRAINT "Project_pkey" PRIMARY KEY (id);


--
-- Name: PurchaseOrderLine PurchaseOrderLine_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PurchaseOrderLine"
    ADD CONSTRAINT "PurchaseOrderLine_pkey" PRIMARY KEY (id);


--
-- Name: PurchaseOrder PurchaseOrder_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PurchaseOrder"
    ADD CONSTRAINT "PurchaseOrder_pkey" PRIMARY KEY (id);


--
-- Name: SalesOrderLine SalesOrderLine_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."SalesOrderLine"
    ADD CONSTRAINT "SalesOrderLine_pkey" PRIMARY KEY (id);


--
-- Name: SalesOrder SalesOrder_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."SalesOrder"
    ADD CONSTRAINT "SalesOrder_pkey" PRIMARY KEY (id);


--
-- Name: Service Service_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Service"
    ADD CONSTRAINT "Service_pkey" PRIMARY KEY (id);


--
-- Name: Session Session_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Session"
    ADD CONSTRAINT "Session_pkey" PRIMARY KEY (id);


--
-- Name: Supplier Supplier_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Supplier"
    ADD CONSTRAINT "Supplier_pkey" PRIMARY KEY (id);


--
-- Name: TimeSheetEntry TimeSheetEntry_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."TimeSheetEntry"
    ADD CONSTRAINT "TimeSheetEntry_pkey" PRIMARY KEY (id);


--
-- Name: TimeSheet TimeSheet_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."TimeSheet"
    ADD CONSTRAINT "TimeSheet_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: WareHouse WareHouse_pkey; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."WareHouse"
    ADD CONSTRAINT "WareHouse_pkey" PRIMARY KEY (id);


--
-- Name: _RelayId pk_RelayId; Type: CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."_RelayId"
    ADD CONSTRAINT "pk_RelayId" PRIMARY KEY (id);


--
-- Name: _AddressToCompany_A; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE INDEX "_AddressToCompany_A" ON "default$default"."_AddressToCompany" USING btree ("A");


--
-- Name: _AddressToCompany_AB_unique; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE UNIQUE INDEX "_AddressToCompany_AB_unique" ON "default$default"."_AddressToCompany" USING btree ("A", "B");


--
-- Name: _AddressToCompany_B; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE INDEX "_AddressToCompany_B" ON "default$default"."_AddressToCompany" USING btree ("B");


--
-- Name: _AddressToCustomer_A; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE INDEX "_AddressToCustomer_A" ON "default$default"."_AddressToCustomer" USING btree ("A");


--
-- Name: _AddressToCustomer_AB_unique; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE UNIQUE INDEX "_AddressToCustomer_AB_unique" ON "default$default"."_AddressToCustomer" USING btree ("A", "B");


--
-- Name: _AddressToCustomer_B; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE INDEX "_AddressToCustomer_B" ON "default$default"."_AddressToCustomer" USING btree ("B");


--
-- Name: _AddressToSupplier_A; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE INDEX "_AddressToSupplier_A" ON "default$default"."_AddressToSupplier" USING btree ("A");


--
-- Name: _AddressToSupplier_AB_unique; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE UNIQUE INDEX "_AddressToSupplier_AB_unique" ON "default$default"."_AddressToSupplier" USING btree ("A", "B");


--
-- Name: _AddressToSupplier_B; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE INDEX "_AddressToSupplier_B" ON "default$default"."_AddressToSupplier" USING btree ("B");


--
-- Name: _CompanyToContact_A; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE INDEX "_CompanyToContact_A" ON "default$default"."_CompanyToContact" USING btree ("A");


--
-- Name: _CompanyToContact_AB_unique; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE UNIQUE INDEX "_CompanyToContact_AB_unique" ON "default$default"."_CompanyToContact" USING btree ("A", "B");


--
-- Name: _CompanyToContact_B; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE INDEX "_CompanyToContact_B" ON "default$default"."_CompanyToContact" USING btree ("B");


--
-- Name: _ContactToCustomer_A; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE INDEX "_ContactToCustomer_A" ON "default$default"."_ContactToCustomer" USING btree ("A");


--
-- Name: _ContactToCustomer_AB_unique; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE UNIQUE INDEX "_ContactToCustomer_AB_unique" ON "default$default"."_ContactToCustomer" USING btree ("A", "B");


--
-- Name: _ContactToCustomer_B; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE INDEX "_ContactToCustomer_B" ON "default$default"."_ContactToCustomer" USING btree ("B");


--
-- Name: _InvoiceAttachments_A; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE INDEX "_InvoiceAttachments_A" ON "default$default"."_InvoiceAttachments" USING btree ("A");


--
-- Name: _InvoiceAttachments_AB_unique; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE UNIQUE INDEX "_InvoiceAttachments_AB_unique" ON "default$default"."_InvoiceAttachments" USING btree ("A", "B");


--
-- Name: _InvoiceAttachments_B; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE INDEX "_InvoiceAttachments_B" ON "default$default"."_InvoiceAttachments" USING btree ("B");


--
-- Name: _TimesheetAttachments_A; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE INDEX "_TimesheetAttachments_A" ON "default$default"."_TimesheetAttachments" USING btree ("A");


--
-- Name: _TimesheetAttachments_AB_unique; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE UNIQUE INDEX "_TimesheetAttachments_AB_unique" ON "default$default"."_TimesheetAttachments" USING btree ("A", "B");


--
-- Name: _TimesheetAttachments_B; Type: INDEX; Schema: default$default; Owner: postgres
--

CREATE INDEX "_TimesheetAttachments_B" ON "default$default"."_TimesheetAttachments" USING btree ("B");


--
-- Name: ApInvoice ApInvoice_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."ApInvoice"
    ADD CONSTRAINT "ApInvoice_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: ApInvoice ApInvoice_supplier_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."ApInvoice"
    ADD CONSTRAINT "ApInvoice_supplier_fkey" FOREIGN KEY (supplier) REFERENCES "default$default"."Supplier"(id) ON DELETE SET NULL;


--
-- Name: AssetGroup AssetGroup_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."AssetGroup"
    ADD CONSTRAINT "AssetGroup_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: Asset Asset_assetGroup_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Asset"
    ADD CONSTRAINT "Asset_assetGroup_fkey" FOREIGN KEY ("assetGroup") REFERENCES "default$default"."AssetGroup"(id) ON DELETE SET NULL;


--
-- Name: Asset Asset_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Asset"
    ADD CONSTRAINT "Asset_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: BankTransaction BankTransaction_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."BankTransaction"
    ADD CONSTRAINT "BankTransaction_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: CompanyMember CompanyMember_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."CompanyMember"
    ADD CONSTRAINT "CompanyMember_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: CompanyMember CompanyMember_user_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."CompanyMember"
    ADD CONSTRAINT "CompanyMember_user_fkey" FOREIGN KEY ("user") REFERENCES "default$default"."User"(id) ON DELETE SET NULL;


--
-- Name: Company Company_logo_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Company"
    ADD CONSTRAINT "Company_logo_fkey" FOREIGN KEY (logo) REFERENCES "default$default"."Attachment"(id) ON DELETE SET NULL;


--
-- Name: Customer Customer_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Customer"
    ADD CONSTRAINT "Customer_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: Integration Integration_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Integration"
    ADD CONSTRAINT "Integration_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: InventoryOnHand InventoryOnHand_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."InventoryOnHand"
    ADD CONSTRAINT "InventoryOnHand_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: InventoryOnHand InventoryOnHand_item_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."InventoryOnHand"
    ADD CONSTRAINT "InventoryOnHand_item_fkey" FOREIGN KEY (item) REFERENCES "default$default"."Inventory"(id) ON DELETE SET NULL;


--
-- Name: InventoryOnHand InventoryOnHand_warehouse_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."InventoryOnHand"
    ADD CONSTRAINT "InventoryOnHand_warehouse_fkey" FOREIGN KEY (warehouse) REFERENCES "default$default"."WareHouse"(id) ON DELETE SET NULL;


--
-- Name: Inventory Inventory_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Inventory"
    ADD CONSTRAINT "Inventory_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: InvoiceItemEntry InvoiceItemEntry_invoice_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."InvoiceItemEntry"
    ADD CONSTRAINT "InvoiceItemEntry_invoice_fkey" FOREIGN KEY (invoice) REFERENCES "default$default"."Invoice"(id) ON DELETE SET NULL;


--
-- Name: InvoiceItemEntry InvoiceItemEntry_project_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."InvoiceItemEntry"
    ADD CONSTRAINT "InvoiceItemEntry_project_fkey" FOREIGN KEY (project) REFERENCES "default$default"."Project"(id) ON DELETE SET NULL;


--
-- Name: InvoiceItemEntry InvoiceItemEntry_service_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."InvoiceItemEntry"
    ADD CONSTRAINT "InvoiceItemEntry_service_fkey" FOREIGN KEY (service) REFERENCES "default$default"."Service"(id) ON DELETE SET NULL;


--
-- Name: InvoiceItemEntry InvoiceItemEntry_timeSheetEntry_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."InvoiceItemEntry"
    ADD CONSTRAINT "InvoiceItemEntry_timeSheetEntry_fkey" FOREIGN KEY ("timeSheetEntry") REFERENCES "default$default"."TimeSheetEntry"(id) ON DELETE SET NULL;


--
-- Name: InvoiceItemEntry InvoiceItemEntry_timeSheet_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."InvoiceItemEntry"
    ADD CONSTRAINT "InvoiceItemEntry_timeSheet_fkey" FOREIGN KEY ("timeSheet") REFERENCES "default$default"."TimeSheet"(id) ON DELETE SET NULL;


--
-- Name: Invoice Invoice_buyer_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Invoice"
    ADD CONSTRAINT "Invoice_buyer_fkey" FOREIGN KEY (buyer) REFERENCES "default$default"."Customer"(id) ON DELETE SET NULL;


--
-- Name: Invoice Invoice_preview_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Invoice"
    ADD CONSTRAINT "Invoice_preview_fkey" FOREIGN KEY (preview) REFERENCES "default$default"."Attachment"(id) ON DELETE SET NULL;


--
-- Name: Invoice Invoice_seller_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Invoice"
    ADD CONSTRAINT "Invoice_seller_fkey" FOREIGN KEY (seller) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: LedgerJournal LedgerJournal_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."LedgerJournal"
    ADD CONSTRAINT "LedgerJournal_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: LedgerPosting LedgerPosting_mainAccount_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."LedgerPosting"
    ADD CONSTRAINT "LedgerPosting_mainAccount_fkey" FOREIGN KEY ("mainAccount") REFERENCES "default$default"."MainAccount"(id) ON DELETE SET NULL;


--
-- Name: LedgerTransaction LedgerTransaction_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."LedgerTransaction"
    ADD CONSTRAINT "LedgerTransaction_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: LedgerTransaction LedgerTransaction_ledgerJournal_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."LedgerTransaction"
    ADD CONSTRAINT "LedgerTransaction_ledgerJournal_fkey" FOREIGN KEY ("ledgerJournal") REFERENCES "default$default"."LedgerJournal"(id) ON DELETE SET NULL;


--
-- Name: LedgerTransaction LedgerTransaction_mainAccount_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."LedgerTransaction"
    ADD CONSTRAINT "LedgerTransaction_mainAccount_fkey" FOREIGN KEY ("mainAccount") REFERENCES "default$default"."MainAccount"(id) ON DELETE SET NULL;


--
-- Name: MainAccount MainAccount_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."MainAccount"
    ADD CONSTRAINT "MainAccount_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: PbsTPP PbsTPP_organisation_id_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PbsTPP"
    ADD CONSTRAINT "PbsTPP_organisation_id_fkey" FOREIGN KEY (organisation_id) REFERENCES "default$default"."PbsOrganisation"(id) ON DELETE SET NULL;


--
-- Name: Plan Plan_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Plan"
    ADD CONSTRAINT "Plan_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: PoReceipt PoReceipt_purchaseOrder_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PoReceipt"
    ADD CONSTRAINT "PoReceipt_purchaseOrder_fkey" FOREIGN KEY ("purchaseOrder") REFERENCES "default$default"."PurchaseOrder"(id) ON DELETE SET NULL;


--
-- Name: PredictedSalesQuantityOfItemsByCompany PredictedSalesQuantityOfItemsByCompany_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PredictedSalesQuantityOfItemsByCompany"
    ADD CONSTRAINT "PredictedSalesQuantityOfItemsByCompany_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: PredictedSalesQuantityOfItemsByCompany PredictedSalesQuantityOfItemsByCompany_inventory_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PredictedSalesQuantityOfItemsByCompany"
    ADD CONSTRAINT "PredictedSalesQuantityOfItemsByCompany_inventory_fkey" FOREIGN KEY (inventory) REFERENCES "default$default"."Inventory"(id) ON DELETE SET NULL;


--
-- Name: PredictedSalesValueByCompany PredictedSalesValueByCompany_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PredictedSalesValueByCompany"
    ADD CONSTRAINT "PredictedSalesValueByCompany_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: ProjectServiceRule ProjectServiceRule_projectService_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."ProjectServiceRule"
    ADD CONSTRAINT "ProjectServiceRule_projectService_fkey" FOREIGN KEY ("projectService") REFERENCES "default$default"."ProjectService"(id) ON DELETE SET NULL;


--
-- Name: ProjectService ProjectService_project_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."ProjectService"
    ADD CONSTRAINT "ProjectService_project_fkey" FOREIGN KEY (project) REFERENCES "default$default"."Project"(id) ON DELETE SET NULL;


--
-- Name: ProjectService ProjectService_service_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."ProjectService"
    ADD CONSTRAINT "ProjectService_service_fkey" FOREIGN KEY (service) REFERENCES "default$default"."Service"(id) ON DELETE SET NULL;


--
-- Name: Project Project_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Project"
    ADD CONSTRAINT "Project_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: Project Project_customer_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Project"
    ADD CONSTRAINT "Project_customer_fkey" FOREIGN KEY (customer) REFERENCES "default$default"."Customer"(id) ON DELETE SET NULL;


--
-- Name: PurchaseOrderLine PurchaseOrderLine_item_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PurchaseOrderLine"
    ADD CONSTRAINT "PurchaseOrderLine_item_fkey" FOREIGN KEY (item) REFERENCES "default$default"."Inventory"(id) ON DELETE SET NULL;


--
-- Name: PurchaseOrderLine PurchaseOrderLine_poReceipt_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PurchaseOrderLine"
    ADD CONSTRAINT "PurchaseOrderLine_poReceipt_fkey" FOREIGN KEY ("poReceipt") REFERENCES "default$default"."PoReceipt"(id) ON DELETE SET NULL;


--
-- Name: PurchaseOrderLine PurchaseOrderLine_purchaseOrder_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PurchaseOrderLine"
    ADD CONSTRAINT "PurchaseOrderLine_purchaseOrder_fkey" FOREIGN KEY ("purchaseOrder") REFERENCES "default$default"."PurchaseOrder"(id) ON DELETE SET NULL;


--
-- Name: PurchaseOrderLine PurchaseOrderLine_site_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PurchaseOrderLine"
    ADD CONSTRAINT "PurchaseOrderLine_site_fkey" FOREIGN KEY (site) REFERENCES "default$default"."WareHouse"(id) ON DELETE SET NULL;


--
-- Name: PurchaseOrder PurchaseOrder_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PurchaseOrder"
    ADD CONSTRAINT "PurchaseOrder_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: PurchaseOrder PurchaseOrder_orderer_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PurchaseOrder"
    ADD CONSTRAINT "PurchaseOrder_orderer_fkey" FOREIGN KEY (orderer) REFERENCES "default$default"."User"(id) ON DELETE SET NULL;


--
-- Name: PurchaseOrder PurchaseOrder_supplier_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."PurchaseOrder"
    ADD CONSTRAINT "PurchaseOrder_supplier_fkey" FOREIGN KEY (supplier) REFERENCES "default$default"."Supplier"(id) ON DELETE SET NULL;


--
-- Name: SalesOrderLine SalesOrderLine_inventory_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."SalesOrderLine"
    ADD CONSTRAINT "SalesOrderLine_inventory_fkey" FOREIGN KEY (inventory) REFERENCES "default$default"."Inventory"(id) ON DELETE SET NULL;


--
-- Name: SalesOrderLine SalesOrderLine_salesOrder_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."SalesOrderLine"
    ADD CONSTRAINT "SalesOrderLine_salesOrder_fkey" FOREIGN KEY ("salesOrder") REFERENCES "default$default"."SalesOrder"(id) ON DELETE SET NULL;


--
-- Name: SalesOrder SalesOrder_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."SalesOrder"
    ADD CONSTRAINT "SalesOrder_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: SalesOrder SalesOrder_customer_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."SalesOrder"
    ADD CONSTRAINT "SalesOrder_customer_fkey" FOREIGN KEY (customer) REFERENCES "default$default"."Customer"(id) ON DELETE SET NULL;


--
-- Name: Service Service_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Service"
    ADD CONSTRAINT "Service_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: Session Session_user_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Session"
    ADD CONSTRAINT "Session_user_fkey" FOREIGN KEY ("user") REFERENCES "default$default"."User"(id) ON DELETE SET NULL;


--
-- Name: Supplier Supplier_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."Supplier"
    ADD CONSTRAINT "Supplier_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: TimeSheetEntry TimeSheetEntry_customer_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."TimeSheetEntry"
    ADD CONSTRAINT "TimeSheetEntry_customer_fkey" FOREIGN KEY (customer) REFERENCES "default$default"."Customer"(id) ON DELETE SET NULL;


--
-- Name: TimeSheetEntry TimeSheetEntry_project_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."TimeSheetEntry"
    ADD CONSTRAINT "TimeSheetEntry_project_fkey" FOREIGN KEY (project) REFERENCES "default$default"."Project"(id) ON DELETE SET NULL;


--
-- Name: TimeSheetEntry TimeSheetEntry_service_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."TimeSheetEntry"
    ADD CONSTRAINT "TimeSheetEntry_service_fkey" FOREIGN KEY (service) REFERENCES "default$default"."Service"(id) ON DELETE SET NULL;


--
-- Name: TimeSheetEntry TimeSheetEntry_timeSheet_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."TimeSheetEntry"
    ADD CONSTRAINT "TimeSheetEntry_timeSheet_fkey" FOREIGN KEY ("timeSheet") REFERENCES "default$default"."TimeSheet"(id) ON DELETE SET NULL;


--
-- Name: TimeSheet TimeSheet_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."TimeSheet"
    ADD CONSTRAINT "TimeSheet_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: TimeSheet TimeSheet_preview_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."TimeSheet"
    ADD CONSTRAINT "TimeSheet_preview_fkey" FOREIGN KEY (preview) REFERENCES "default$default"."Attachment"(id) ON DELETE SET NULL;


--
-- Name: TimeSheet TimeSheet_user_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."TimeSheet"
    ADD CONSTRAINT "TimeSheet_user_fkey" FOREIGN KEY ("user") REFERENCES "default$default"."User"(id) ON DELETE SET NULL;


--
-- Name: User User_activePlan_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."User"
    ADD CONSTRAINT "User_activePlan_fkey" FOREIGN KEY ("activePlan") REFERENCES "default$default"."Plan"(id) ON DELETE SET NULL;


--
-- Name: WareHouse WareHouse_company_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."WareHouse"
    ADD CONSTRAINT "WareHouse_company_fkey" FOREIGN KEY (company) REFERENCES "default$default"."Company"(id) ON DELETE SET NULL;


--
-- Name: _AddressToCompany _AddressToCompany_A_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."_AddressToCompany"
    ADD CONSTRAINT "_AddressToCompany_A_fkey" FOREIGN KEY ("A") REFERENCES "default$default"."Address"(id) ON DELETE CASCADE;


--
-- Name: _AddressToCompany _AddressToCompany_B_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."_AddressToCompany"
    ADD CONSTRAINT "_AddressToCompany_B_fkey" FOREIGN KEY ("B") REFERENCES "default$default"."Company"(id) ON DELETE CASCADE;


--
-- Name: _AddressToCustomer _AddressToCustomer_A_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."_AddressToCustomer"
    ADD CONSTRAINT "_AddressToCustomer_A_fkey" FOREIGN KEY ("A") REFERENCES "default$default"."Address"(id) ON DELETE CASCADE;


--
-- Name: _AddressToCustomer _AddressToCustomer_B_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."_AddressToCustomer"
    ADD CONSTRAINT "_AddressToCustomer_B_fkey" FOREIGN KEY ("B") REFERENCES "default$default"."Customer"(id) ON DELETE CASCADE;


--
-- Name: _AddressToSupplier _AddressToSupplier_A_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."_AddressToSupplier"
    ADD CONSTRAINT "_AddressToSupplier_A_fkey" FOREIGN KEY ("A") REFERENCES "default$default"."Address"(id) ON DELETE CASCADE;


--
-- Name: _AddressToSupplier _AddressToSupplier_B_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."_AddressToSupplier"
    ADD CONSTRAINT "_AddressToSupplier_B_fkey" FOREIGN KEY ("B") REFERENCES "default$default"."Supplier"(id) ON DELETE CASCADE;


--
-- Name: _CompanyToContact _CompanyToContact_A_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."_CompanyToContact"
    ADD CONSTRAINT "_CompanyToContact_A_fkey" FOREIGN KEY ("A") REFERENCES "default$default"."Company"(id) ON DELETE CASCADE;


--
-- Name: _CompanyToContact _CompanyToContact_B_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."_CompanyToContact"
    ADD CONSTRAINT "_CompanyToContact_B_fkey" FOREIGN KEY ("B") REFERENCES "default$default"."Contact"(id) ON DELETE CASCADE;


--
-- Name: _ContactToCustomer _ContactToCustomer_A_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."_ContactToCustomer"
    ADD CONSTRAINT "_ContactToCustomer_A_fkey" FOREIGN KEY ("A") REFERENCES "default$default"."Contact"(id) ON DELETE CASCADE;


--
-- Name: _ContactToCustomer _ContactToCustomer_B_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."_ContactToCustomer"
    ADD CONSTRAINT "_ContactToCustomer_B_fkey" FOREIGN KEY ("B") REFERENCES "default$default"."Customer"(id) ON DELETE CASCADE;


--
-- Name: _InvoiceAttachments _InvoiceAttachments_A_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."_InvoiceAttachments"
    ADD CONSTRAINT "_InvoiceAttachments_A_fkey" FOREIGN KEY ("A") REFERENCES "default$default"."Attachment"(id) ON DELETE CASCADE;


--
-- Name: _InvoiceAttachments _InvoiceAttachments_B_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."_InvoiceAttachments"
    ADD CONSTRAINT "_InvoiceAttachments_B_fkey" FOREIGN KEY ("B") REFERENCES "default$default"."Invoice"(id) ON DELETE CASCADE;


--
-- Name: _TimesheetAttachments _TimesheetAttachments_A_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."_TimesheetAttachments"
    ADD CONSTRAINT "_TimesheetAttachments_A_fkey" FOREIGN KEY ("A") REFERENCES "default$default"."Attachment"(id) ON DELETE CASCADE;


--
-- Name: _TimesheetAttachments _TimesheetAttachments_B_fkey; Type: FK CONSTRAINT; Schema: default$default; Owner: postgres
--

ALTER TABLE ONLY "default$default"."_TimesheetAttachments"
    ADD CONSTRAINT "_TimesheetAttachments_B_fkey" FOREIGN KEY ("B") REFERENCES "default$default"."TimeSheet"(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

