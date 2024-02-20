// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'database_name_here');

/** MySQL database username */
define('DB_USER', 'username_here');

/** MySQL database password */
define('DB_PASSWORD', 'password_here');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

define('AUTH_KEY', $(AUTH_KEY));
define('SECURE_AUTH_KEY', $(SECURE_AUTH_KEY));
define('LOGGED_IN_KEY', $(LOGGED_IN_KEY));
define('NONCE_KEY', $(NONCE_KEY));
define('AUTH_SALT', $(AUTH_SALT));
define('SECURE_AUTH_SALT', $(SECURE_AUTH_SALT));
define('LOGGED_IN_SALT', $(LOGGED_IN_SALT));
define('NONCE_SALT', $(NONCE_SALT));

$table_prefix  = 'wp_';

/* That's all, stop editing! Happy blogging. */