/*
  Warnings:

  - You are about to drop the `bank_accountd` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "bank_account_type" AS ENUM ('CHECKING', 'INVESTMENT', 'EXPENSE');

-- DropTable
DROP TABLE "bank_accountd";

-- DropEnum
DROP TYPE "BankAccountType";

-- CreateTable
CREATE TABLE "bank_accounts" (
    "id" UUID NOT NULL,
    "uderId" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "initial_balance" DOUBLE PRECISION NOT NULL,
    "type" "bank_account_type" NOT NULL,
    "color" TEXT NOT NULL,

    CONSTRAINT "bank_accounts_pkey" PRIMARY KEY ("id")
);
