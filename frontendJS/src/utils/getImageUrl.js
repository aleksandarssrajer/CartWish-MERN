export const getImageUrl = (filename, type = 'products') => {
  if (!filename) return ''; // safety check
  const baseUrl = import.meta.env.VITE_API_URL.replace('/api', '');
  // const baseUrl = 'http://localhost:5000/api';
  return `${baseUrl}/${type}/${filename}`;
};