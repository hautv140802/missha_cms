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
  address: string;
  full_name: string;
  phone: string;
  gender: string;
  role: UserRole;
};

export type UserLoginResponseType = {
  jwt: string;
  user: UserType;
};

export type UserRole = {
  id: number;
  name: string;
  description: string;
  type: string;
  createdAt: string;
  updatedAt: string;
};

export type UserResponseType = {
  id: number;
} & UserType;
