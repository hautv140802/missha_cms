import { createBrowserRouter, RouterProvider } from 'react-router-dom';
import NotFound from '../pages/NotFound';
import paths from '../utils/constants/paths';
import RootLayout from '../layouts/RootLayout';

const router = createBrowserRouter([
  {
    path: '*',
    element: <NotFound />,
  },
  {
    path: paths.HOME,
    element: <RootLayout />,
    children: [],
  },
]);

const AppRouter = () => <RouterProvider router={router} />;

export default AppRouter;
