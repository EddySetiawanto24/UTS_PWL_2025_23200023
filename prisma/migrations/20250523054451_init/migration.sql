/*
  Warnings:

  - You are about to drop the column `description` on the `paket` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `paket` table. All the data in the column will be lost.
  - Added the required column `deskripsi` to the `paket` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nama` to the `paket` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_paket" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "kode" TEXT NOT NULL,
    "nama" TEXT NOT NULL,
    "deskripsi" TEXT NOT NULL
);
INSERT INTO "new_paket" ("id", "kode") SELECT "id", "kode" FROM "paket";
DROP TABLE "paket";
ALTER TABLE "new_paket" RENAME TO "paket";
CREATE UNIQUE INDEX "paket_kode_key" ON "paket"("kode");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
