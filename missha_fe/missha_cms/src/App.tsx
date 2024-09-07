import { Toaster } from 'react-hot-toast';
import './App.css';
import AppRouter from './routes/AppRouter';

function App() {
  return (
    <>
      <AppRouter />
      <Toaster
        position="top-right"
        reverseOrder={false}
        toastOptions={{
          className: '',
          style: {
            border: 'none',
            borderRadius: 0,
            padding: '12px 16px',
            color: '#EAEDE9',
            background: '#2A4826',
          },
        }}
      />
    </>
  );
}

export default App;
