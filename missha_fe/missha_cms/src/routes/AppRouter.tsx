import { createBrowserRouter, RouterProvider } from 'react-router-dom';

import Login from '@/pages/Login';
import NotFound from '@/pages/NotFound';
import paths from '@/utils/constants/paths';
import RootLayout from '@/layouts/RootLayout';
import Orders from '@/pages/Order';
import Categories from '@/pages/Categories';
import ProductLines from '@/pages/ProductLines';
import SkinProperties from '@/pages/SkinProperties';
import Products from '@/pages/Products';
import Customers from '@/pages/Customers';
import Vouchers from '@/pages/Vouchers';
import Bookings from '@/pages/Bookings';

const router = createBrowserRouter([
  {
    path: '*',
    element: <NotFound />,
  },
  {
    path: paths.LOGIN,
    element: <Login />,
  },
  {
    path: paths.HOME,
    element: <RootLayout />,
    children: [
      {
        path: paths.ORDERS,
        element: <Orders />,
      },
      { path: paths.CATEGORIES, element: <Categories /> },
      { path: paths.PRODUCT_LINES, element: <ProductLines /> },
      { path: paths.SKIN_PROPERTIES, element: <SkinProperties /> },
      { path: paths.PRODUCTS, element: <Products /> },
      { path: paths.CUSTOMERS, element: <Customers /> },
      { path: paths.VOUCHERS, element: <Vouchers /> },
      { path: paths.BOOKINGS, element: <Bookings /> },
    ],
  },
]);

const AppRouter = () => <RouterProvider router={router} />;

export default AppRouter;
