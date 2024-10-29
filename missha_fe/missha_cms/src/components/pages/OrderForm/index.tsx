import ButtonComponent from '@/components/common/Button';
import InputComponent from '@/components/common/Input';
import OrderDetails from '@/components/common/OrderDetails';
import SelectComponent from '@/components/common/Select';
import useUpdateOrder from '@/libs/axios/order/useUpdateOrder';
import { BaseData } from '@/types/base/baseData';
import { FormOrderType } from '@/types/request/form/formOrder';
import { OrderResponseType } from '@/types/response/order';
import formType from '@/utils/constants/formType';
import { OrderStatus } from '@/utils/constants/orderStatus';
import { useEffect } from 'react';
import { SubmitHandler, useForm } from 'react-hook-form';
import toast from 'react-hot-toast';

interface IOrderFormProps {
  type: string;
  record?: BaseData<OrderResponseType>;
  onCloseModal?: () => void;
  openTime?: string;
  handleComplete?: () => void;
}
const OrderForm = (props: IOrderFormProps) => {
  const { type, record, onCloseModal, openTime, handleComplete } = props;

  const { control, handleSubmit, reset } = useForm<FormOrderType>({
    mode: 'onChange',
  });
  useEffect(() => {
    reset({
      ...record?.attributes,
      voucher: record?.attributes?.voucher?.data?.attributes?.code,
    });
  }, [record?.id, openTime]);

  const onSubmit: SubmitHandler<FormOrderType> = async data => {
    const body = {
      status: data.status,
    };

    if (!record) return;
    if (type === formType.FORM_UPDATE) {
      const productLineRes = await useUpdateOrder(record?.id, body);
      console.log(productLineRes);
      if (productLineRes.data && productLineRes.data.id) {
        toast.success('Cập nhật thông tin thành công!');
        handleComplete?.();
      } else {
        toast.error('Cập nhật thông tin thất bại!');
      }
    }
  };

  return (
    <form
      className="flex flex-col gap-[16px]"
      onSubmit={handleSubmit(onSubmit)}
    >
      <div className="grid grid-cols-1 md:grid-cols-2 gap-[1.2rem]">
        <InputComponent
          label="Tên  khách hàng:"
          name="customer_full_name"
          placeholder="Tên  khách hàng"
          control={control}
          disabled
        />
        <InputComponent
          label="Email:"
          name="customer_email"
          placeholder="Email"
          control={control}
          disabled
        />
      </div>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-[1.2rem]">
        <InputComponent
          label="Số điển thoại:"
          name="customer_phone"
          placeholder="Số điển thoại"
          control={control}
          disabled
        />
        <InputComponent
          label="Địa chỉ nhận hàng:"
          name="shipping_address"
          placeholder="Địa chỉ nhận hàng"
          control={control}
          disabled
        />
      </div>
      <div className="flex flex-col gap-[0.8rem]">
        <label className="font-[500] text-[1.4rem] leading-[2rem] text-[#484848]">
          Đơn hàng chi tiết:
        </label>
        {record?.id && <OrderDetails orderID={record.id} />}
      </div>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-[1.2rem]">
        <InputComponent
          label="Tổng đơn hàng:"
          name="total"
          placeholder="Tổng đơn hàng"
          control={control}
          disabled
        />
        <InputComponent
          label="Phí vận chuyển:"
          name="transport_fee"
          placeholder="Phí vận chuyển"
          control={control}
          disabled
        />
      </div>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-[1.2rem]">
        <InputComponent
          label="Phương thức thanh toán:"
          name="payment_method"
          placeholder="Phương thức thanh toán"
          control={control}
          disabled
        />
        <InputComponent
          label="Phương thức vận chuyển:"
          name="shipping_method"
          placeholder="Phương thức vận chuyển"
          control={control}
          disabled
        />
      </div>
      <SelectComponent
        label="Trạng thái đơn hàng:"
        name="status"
        placeholder="Trạng thái đơn hàng"
        control={control}
        options={Object.keys(OrderStatus).map(key => ({
          label: OrderStatus[key],
          value: key,
        }))}
        disabled={formType.FORM_VIEW === type}
      />

      <div className="flex justify-end items-end gap-[1.2rem]">
        <ButtonComponent text="Hủy" onClick={onCloseModal} />
        {type !== formType.FORM_VIEW && (
          <ButtonComponent type="primary" htmlType="submit" text="Lưu" />
        )}
      </div>
    </form>
  );
};

export default OrderForm;
