export default {
  async afterCreate(event) {
    try {
      const { result, params } = event;
      const { name, id } = result;
      const order = await strapi.entityService.findOne("api::order.order", id, {
        populate: "*"
      });
      const { voucher, user } = order;

      if (voucher?.id) {
        const userVoucher = await strapi.entityService.findMany("api::user-voucher.user-voucher", {
          filters: {
            voucher: {
              id: voucher.id,
            },
            user: {
              id: user?.id
            },
            status: "UNUSED"
          }
        });

        if (userVoucher.length > 0) {
          await strapi.entityService.update("api::user-voucher.user-voucher", userVoucher[0].id, {
            data: {
              status: "USED"
            }
          })
        }
      }
    } catch (e) {
      strapi.log.error(`fail after create advertisement ${e}`);
    }
  },
}
