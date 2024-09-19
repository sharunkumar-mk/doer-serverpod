BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "service" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" json NOT NULL,
    "subServices" json NOT NULL,
    "image" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "sub_services" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "description" json NOT NULL,
    "image" text NOT NULL
);


--
-- MIGRATION VERSION FOR doer
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('doer', '20240718124136214', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240718124136214', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
