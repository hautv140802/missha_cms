import { BaseID } from '@/types/base/baseID';

export const formatValue = (values?: number[]): BaseID[] | undefined => {
  if (!values || values.length === 0) return undefined;
  const result = values.map(value => ({ id: value }));
  return result;
};
