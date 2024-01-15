/*
  Warnings:

  - You are about to drop the column `uderId` on the `bank_accounts` table. All the data in the column will be lost.
  - Added the required column `userId` to the `bank_accounts` table without a default value. This is not possible if the table is not empty.
  - Added the required column `user_id` to the `bank_accounts` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "bank_accounts" DROP COLUMN "uderId",
ADD COLUMN     "userId" UUID NOT NULL,
ADD COLUMN     "user_id" UUID NOT NULL;

-- AddForeignKey
ALTER TABLE "bank_accounts" ADD CONSTRAINT "bank_accounts_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
