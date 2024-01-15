-- CreateEnum
CREATE TYPE "BankAccountType" AS ENUM ('CHECKING', 'INVESTMENT', 'EXPENSE');

-- CreateTable
CREATE TABLE "bank_accountd" (
    "id" UUID NOT NULL,
    "uderId" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "initial_balance" DOUBLE PRECISION NOT NULL,
    "type" "BankAccountType" NOT NULL,
    "color" TEXT NOT NULL,

    CONSTRAINT "bank_accountd_pkey" PRIMARY KEY ("id")
);
