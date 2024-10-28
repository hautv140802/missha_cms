export default {
  async afterCreate(event) {
    const { result, params } = event;
    const { name, id } = result;

    const order = await strapi.entityService.findOne('api::order.order', id, {
      populate: '*',
    });

    const { voucher } = order;

    if (voucher?.id) {
      const voucherId = voucher.id;
      await strapi.entityService.update('api::voucher.voucher', voucherId, {
        data: {
          status: 'USED',
        },
      });
    }

  }
}
