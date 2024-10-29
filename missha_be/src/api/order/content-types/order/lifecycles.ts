export default {
  async afterCreate(event) {
    try {
      const { result, params } = event;
      const { name, id } = result;
      const order = await strapi.entityService.findOne("api::order.order", id, {
        populate: "*"
      });
      const { voucher } = order;

      if (voucher?.id) {
        await strapi.entityService.update("api::voucher.voucher", voucher.id, {
          data: {
            status: "USED"
          }
        })
      }
    } catch (e) {
      strapi.log.error(`fail after create advertisement ${e}`);
    }
  },
}
