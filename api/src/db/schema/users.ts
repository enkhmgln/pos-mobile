import {
  date,
  integer,
  pgTable,
  smallint,
  text,
  timestamp,
  uuid,
} from "drizzle-orm/pg-core";
import { baseColumns } from "../base";
import {
  ACCOUNT_STATUS,
  USER_ROLES,
  type AccountStatus,
  type UserRole,
} from "@/constants/constant";

export const users = pgTable("users_app_users", {
  ...baseColumns,
  email: text().notNull().unique(),
  username: text().unique(),
  password: text(),
  account_status: smallint()
    .$type<AccountStatus>()
    .notNull()
    .default(ACCOUNT_STATUS.ACTIVE),
  role: smallint().$type<UserRole>().notNull().default(USER_ROLES.USER),
});
export const userProfiles = pgTable("users_profiles", {
  ...baseColumns,
  user_id: uuid()
    .notNull()
    .references(() => users.id, { onDelete: "cascade" }),
  bio: text(),
  avatar_url: text(),
  location: text(),
  birthdate: date(),
});
