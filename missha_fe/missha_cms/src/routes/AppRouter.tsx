import { createBrowserRouter, RouterProvider } from 'react-router-dom';

import Login from '@/pages/Login';
import NotFound from '@/pages/NotFound';
import paths from '@/utils/constants/paths';
import RootLayout from '@/layouts/RootLayout';
import Orders from '@/pages/Order';
import Categories from '@/pages/Categories';

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
    ],
  },
]);

const AppRouter = () => <RouterProvider router={router} />;

export default AppRouter;
