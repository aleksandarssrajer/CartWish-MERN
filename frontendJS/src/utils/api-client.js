import axios from 'axios';

export default axios.create({
  // baseURL: 'http://localhost:5000/api',
    baseURL: window.VITE_API_URL
});
