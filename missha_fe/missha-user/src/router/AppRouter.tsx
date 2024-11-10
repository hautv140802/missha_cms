import { createBrowserRouter, RouterProvider } from "react-router-dom";
import paths from "../utils/constants/paths";
import RootLayout from "../layouts/RootLayout";
import Home from "../pages/Home";
import Products from "../pages/Products";
import AboutUs from "../pages/AboutUs";
import Login from "../pages/Login";
import Register from "../pages/Register";
import Cart from "../pages/Cart";
import Booking from "../pages/Booking";
import ProductDetail from "../pages/ProductDetail";
import ProfileLayout from "../layouts/ProfileLayout";
import Information from "../pages/Profiles/Information";
import Orders from "../pages/Profiles/Orders";
import Bookings from "../pages/Profiles/Bookings";
import OrderDetail from "../pages/Profiles/OrderDetail";
import Vouchers from "../pages/Profiles/Vouchers";
import OrderFail from "../pages/OrderFail";
import OrderSuccess from "../pages/OrderSuccess";
import ForgotPassword from "../pages/Supports/ForgotPassword";
import PolicyReturn from "../pages/Supports/PolicyReturn";
import Support from "../pages/Supports/Support";

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
      {
        path: `${paths.LOGIN}`,
        element: <Login />,
      },
      {
        path: paths.REGISTER,
        element: <Register />,
      },
      { path: `${paths.ORDER_FAIL}/:id`, element: <OrderFail /> },
      { path: `${paths.ORDER_SUCCESS}/:id`, element: <OrderSuccess /> },
      {
        path: paths.SUPPORT,
        element: <Support />,
      },
      {
        path: paths.SUPPORT_FORGOT_PASSWORD,
        element: <ForgotPassword />,
      },
      {
        path: paths.SUPPORT_POLICY_RETURN,
        element: <PolicyReturn />,
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
        path: `${paths.PROFILE_ORDERS}/:orderCode`,
        element: <OrderDetail />,
      },
      {
        path: paths.PROFILE_BOOKINGS,
        element: <Bookings />,
      },
      {
        path: paths.PROFILE_VOUCHERS,
        element: <Vouchers />,
      },
    ],
  },
]);

const AppRouter = () => <RouterProvider router={router} />;

export default AppRouter;
