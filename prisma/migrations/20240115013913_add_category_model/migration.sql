/*
  Warnings:

  - The values [EXPENSE] on the enum `bank_account_type` will be removed. If these variants are still used in the database, this will fail.

*/
-- CreateEnum
CREATE TYPE "transaction_type" AS ENUM ('INCOME', 'EXPENSE');

-- AlterEnum
BEGIN;
CREATE TYPE "bank_account_type_new" AS ENUM ('CHECKING', 'INVESTMENT', 'CASH');
ALTER TABLE "bank_accounts" ALTER COLUMN "type" TYPE "bank_account_type_new" USING ("type"::text::"bank_account_type_new");
ALTER TYPE "bank_account_type" RENAME TO "bank_account_type_old";
ALTER TYPE "bank_account_type_new" RENAME TO "bank_account_type";
DROP TYPE "bank_account_type_old";
COMMIT;

-- CreateTable
CREATE TABLE "categories" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "email" TEXT NOT NULL,
    "icon" TEXT NOT NULL,
    "type" "transaction_type" NOT NULL,

    CONSTRAINT "categories_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "transctions" (
    "id" UUID NOT NULL,
    "user_id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "type" "transaction_type" NOT NULL,

    CONSTRAINT "transctions_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "categories" ADD CONSTRAINT "categories_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "transctions" ADD CONSTRAINT "transctions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
