export type UserType = {
  id: number;
  username: string;
  email: string;
  provider: string;
  confirmed: boolean;
  blocked: boolean;
  type: string;
  createdAt: string;
  updatedAt: string;
};

export type UserResponseType = {
  jwt: string;
  user: UserType;
};
