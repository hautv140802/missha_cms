import { create } from "zustand";
import { CartType } from "../types/common/cart";

export interface CartState {
  items: CartType[];
  addItem: (item: CartType) => void;
  deleteItem: (item: CartType) => void;
  removeItem: (id: number) => void;
  clearCart: () => void;
  getTotalPrice: () => number; // Method to calculate total price
  getTotalQuantity: () => number; // Method to calculate total quantity
  getTotalSaveMoney: () => number;
}

const useCartStore = create<CartState>((set) => {
  const loadCartFromStorage = (): CartType[] => {
    const storedCart = localStorage.getItem("cart");
    if (storedCart) {
      return JSON.parse(storedCart) as CartType[];
    }
    return [];
  };

  const initialItems = loadCartFromStorage();

  set({ items: initialItems });

  return {
    items: initialItems,

    addItem: (item: CartType): void => {
      set((state) => {
        const existingItem = state.items.find((i) => i.id === item.id);

        if (existingItem) {
          const updatedItems = state.items.map((i) =>
            i.id === item.id
              ? { ...i, quantity: i.quantity + item?.quantity }
              : i
          );

          localStorage.setItem("cart", JSON.stringify(updatedItems));

          return { items: updatedItems };
        } else {
          const newItems = [
            ...state.items,
            { ...item, quantity: item?.quantity },
          ];

          localStorage.setItem("cart", JSON.stringify(newItems));

          return { items: newItems };
        }
      });
    },

    deleteItem: (item: CartType): void => {
      set((state) => {
        const existingItem = state.items.find((i) => i.id === item.id);

        if (existingItem) {
          const updatedItems = state.items.map((i) =>
            i.id === item.id ? { ...i, quantity: i.quantity - 1 } : i
          );

          localStorage.setItem("cart", JSON.stringify(updatedItems));

          return { items: updatedItems };
        } else {
          const newItems = [...state.items, { ...item, quantity: 1 }];

          localStorage.setItem("cart", JSON.stringify(newItems));

          return { items: newItems };
        }
      });
    },

    removeItem: (id: number): void =>
      set((state) => {
        const updatedItems = state.items.filter((item) => item.id !== id);
        localStorage.setItem("cart", JSON.stringify(updatedItems));

        return { items: updatedItems };
      }),

    clearCart: (): void => {
      set({ items: [] });
      localStorage.removeItem("cart");
    },

    getTotalPrice: (): number => {
      const { items } = useCartStore.getState();
      return items.reduce((total: number, item: CartType) => {
        const price =
          Number(item.sale_price) > 0
            ? Number(item.sale_price)
            : Number(item.price);
        return total + price * item.quantity;
      }, 0);
    },

    getTotalQuantity: (): number => {
      const { items } = useCartStore.getState();
      return items.reduce(
        (total: number, item: CartType) => total + item.quantity,
        0
      );
    },
    getTotalSaveMoney: (): number => {
      const { items } = useCartStore.getState();
      return items.reduce((total: number, item: CartType) => {
        const saveMoney =
          item.sale_price > 0 && item.sale_price < item.price
            ? item.price - item.sale_price
            : 0;
        return total + item.quantity * saveMoney;
      }, 0);
    },
  };
});

export default useCartStore;
