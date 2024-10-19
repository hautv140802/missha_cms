import { createBrowserRouter, RouterProvider } from "react-router-dom";
import paths from "../utils/constants/paths";
import RootLayout from "../layouts/RootLayout";
import Home from "../pages/Home";
import Products from "../pages/Products";
import AboutUs from "../pages/AboutUs";
import Login from "../pages/Login";
import Register from "../pages/Register";
import Support from "../pages/Support";
import Cart from "../pages/Carts/Cart";
import Booking from "../pages/Booking";
import ProductDetail from "../pages/ProductDetail";
import ProfileLayout from "../layouts/ProfileLayout";
import Information from "../pages/Profiles/Information";
import Orders from "../pages/Profiles/Orders";
import Bookings from "../pages/Profiles/Bookings";

const router = createBrowserRouter([
  {
    path: "*",
    // element: <NotFound />,
  },
  {
    path: paths.HOME,
    element: <RootLayout />,
    children: [
      {
        path: paths.HOME,
        element: <Home />,
      },
      {
        path: paths.PRODUCTS,
        element: <Products />,
      },
      {
        path: paths.ABOUT_US,
        element: <AboutUs />,
      },

      {
        path: paths.SUPPORT,
        element: <Support />,
      },
      {
        path: paths.CART,
        element: <Cart />,
      },
      {
        path: paths.BOOKING,
        element: <Booking />,
      },
      {
        path: `${paths.PRODUCTS}/:slug`,
        element: <ProductDetail />,
      },
    ],
  },
  {
    path: paths.PROFILE,
    element: <ProfileLayout />,
    children: [
      {
        path: paths.PROFILE_INFORMATION,
        element: <Information />,
      },
      {
        path: paths.PROFILE_ORDERS,
        element: <Orders />,
      },
      {
        path: `${paths.PROFILE_ORDERS}/:status`,
        element: <Orders />,
      },
      {
        path: paths.PROFILE_BOOKINGS,
        element: <Bookings />,
      },
    ],
  },
  {
    path: paths.LOGIN,
    element: <Login />,
  },
  {
    path: paths.REGISTER,
    element: <Register />,
  },
]);

const AppRouter = () => <RouterProvider router={router} />;

export default AppRouter;
