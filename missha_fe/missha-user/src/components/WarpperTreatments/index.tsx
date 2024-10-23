import { BaseData } from "../../types/base/baseData";
import { ServiceType } from "../../types/response/service";
import TreatmentComponent from "../Treatments";

export type PageTreatmentType = "product" | "booking";
interface IWrapperTreatment {
  treatments: BaseData<ServiceType>[];
  page: PageTreatmentType;
}

const WrapperTreatment = (props: IWrapperTreatment) => {
  const { treatments, page } = props;

  // // Helper function to chunk the treatments array
  // const chunkArray = (array: BaseData<ServiceType>[], size: number) => {
  //   const result = [];
  //   for (let i = 0; i < array.length; i += size) {
  //     result.push(array.slice(i, i + size));
  //   }
  //   return result;
  // };

  // // Chunk the treatments into groups of 6
  // const chunkTreatment = chunkArray(treatments, 6);

  return <TreatmentComponent treatments={treatments.slice(0, 6)} page={page} />;
};

export default WrapperTreatment;
