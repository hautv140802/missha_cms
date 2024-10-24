import { CartType } from "../../types/common/cart";
import useCartStore from "../../stores/useCartStore";
export const addToCart = (item: CartType) => {
  const addItem = useCartStore.getState().addItem;

  addItem(item);

  const currentCart = useCartStore.getState().items;
  localStorage.setItem("cart", JSON.stringify(currentCart));
};

export const deleteToCart = (item: CartType) => {
  const deleteItem = useCartStore.getState().deleteItem;

  deleteItem(item);

  const currentCart = useCartStore.getState().items;
  localStorage.setItem("cart", JSON.stringify(currentCart));
};
