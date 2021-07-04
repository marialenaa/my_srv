<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'g>;iC+`8CIExN69{MKx&IsC37=tBrA~f>DwGQ%`?.]GSS(S60QuiZ-Jaee|GmFDQ');
define('SECURE_AUTH_KEY',  '=J=UVXZsT]l|yR_P)C3CMU pyo--XczI1(C#N_D2Qw,ZKO<nb9tQ/ybN)m6KzP0q');
define('LOGGED_IN_KEY',    '2-=yqO]ohw/0rf3;9$H0 #?D;@RkzU5CKUX{G#5/FYq)QH{w$?(pOp%n&r$W2?Py');
define('NONCE_KEY',        '5;#K7QuhbY^lC.Xpu=!E;<w{0NTAZt-(W-[xQem/H5IKKe8>C;|9EpK6[-ul1KbA');
define('AUTH_SALT',        'n^n0eUS9REv[tooH*dN@.&>9B1?<^!vtX:AA73@]1|` jgQUoOc1uc;!x{TPOx2F');
define('SECURE_AUTH_SALT', 'jW.kKcM-K.#2z#H^y(4XYGJz>+!j-Rkv}kkcuWE-QM]9RAlXH%SahB &6&Tx`&S_');
define('LOGGED_IN_SALT',   'aGI[7|+N]p-7Ul8LG<+()cxj&2rs7aHt`q,u:f>H=YF5&BAS]HkYU>A{@(>78 o*');
define('NONCE_SALT',       '6qo+$U{LXKV,[/+1u-$]KW |}!31hjk~W<&?D<4u.1CL-?l}KCsv9FtZPfQO?N{a');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
