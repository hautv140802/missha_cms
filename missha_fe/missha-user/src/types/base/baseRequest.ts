export type BaseRequest = {
  "sort[0]"?: string;
  "sort[1]"?: string;
  "pagination[page]"?: number;
  "pagination[pageSize]"?: number;
  populate?: string;
  "fields[0]"?: string;
  "fields[1]"?: string;
  "fields[2]"?: string;
};
