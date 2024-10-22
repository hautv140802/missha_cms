export type BaseRequest = {
  sort?: string;
  "pagination[page]"?: number;
  "pagination[pageSize]"?: number;
  populate?: string;
};
