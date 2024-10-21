import { UserType } from "../common/user";

export type UserLoginResponseType = {
  jwt: string;
  user: UserType;
};
