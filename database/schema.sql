set client_min_messages to warning;

-- DANGER: this is NOT how to do it in the real world.
-- `drop schema` INSTANTLY ERASES EVERYTHING.
drop schema "clients" cascade;

create schema "clients";
CREATE TABLE "users" (
	"userId" serial NOT NULL,
	"email" TEXT NOT NULL,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("userId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "clients" (
	"clientId" serial NOT NULL,
	"firstName" TEXT NOT NULL,
	"lastName" TEXT NOT NULL,
	"birthDay" TEXT NOT NULL,
	"mobile" TEXT NOT NULL,
	"userId" serial NOT NULL,
	"totalVisits" integer NULL,
	CONSTRAINT "clients_pk" PRIMARY KEY ("clientId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "address" (
	"clientId" serial NOT NULL,
	"street" TEXT NOT NULL,
	"city" TEXT NOT NULL,
	"county" TEXT  NULL,
	"state" TEXT NOT NULL,
	"country" TEXT NOT NULL,
	"addressId" serial NOT NULL,
	CONSTRAINT "address_pk" PRIMARY KEY ("addressId")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "notes" (
	"userId" serial NOT NULL,
	"noteId" serial NOT NULL,
	"clientId" serial NOT NULL,
	"details" TEXT NOT NULL,
	CONSTRAINT "notes_pk" PRIMARY KEY ("noteId")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "clients" ADD CONSTRAINT "clients_fk0" FOREIGN KEY ("userId") REFERENCES "users"("userId");

ALTER TABLE "address" ADD CONSTRAINT "address_fk0" FOREIGN KEY ("clientId") REFERENCES "clients"("clientId");

ALTER TABLE "notes" ADD CONSTRAINT "notes_fk0" FOREIGN KEY ("userId") REFERENCES "users"("userId");
