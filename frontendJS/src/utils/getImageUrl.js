export const getImageUrl = (filename, type = 'products') => {
  if (!filename) return ''; // safety check
  const baseUrl = window.VITE_API_URL.replace('/api', '');
  return `${baseUrl}/${type}/${filename}`;
};