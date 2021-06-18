const dotenv = require('dotenv');
const fs = require('fs');

if (fs.existsSync('.env')) { dotenv.config(); }

const defaults = {
  API_KEY: null, 
  API_LIMIT: 120,
  ROLE: '', 
  GROUP: '',
  NODE_ENV: 'development',
  FRONTEND_PORT: 5000,
  FIVEM_STATUS_INTERVAL: 2690, 
  LIBRARY_HOST: 'http://localhost:5100', 
  REDIS_URL: 'redis://127.0.0.1:6379/0',
  SENTRY_URL: '',
  API_FREE_LIMIT: 50000, 
  NO_API_KEY_PER_MIN_LIMIT: 60,
  DEFAULT_DELAY: 1000, 
  ENABLE_PLAYER_CACHE: true, 
  ENABLE_DB_CACHE: true, 
  UUID_CACHE_SECONDS: 21600, 
  PLAYER_CACHE_SECONDS: 600,
  BANS_CACHE_SECONDS: 30, 
  COUNTS_CACHE_SECONDS: 60, 
  SESSION_CACHE_SECONDS: 60, 
};

Object.keys(defaults).forEach((key) => {
  process.env[key] = (key in process.env) ? process.env[key] : defaults[key];
});

if (process.env.NODE_ENV === 'development') {}

if (process.env.NODE_ENV === 'test') {
  process.env.PORT = ''; 
  process.env.DEFAULT_DELAY = 0;
  process.env.SESSION_SECRET = 'testsecretvalue';
  process.env.FRONTEND_PORT = 5001;
}

module.exports = process.env;
