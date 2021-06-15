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
define( 'DB_NAME', '{{pillar['mysql']['db']['db']}}' );

/** MySQL database username */
define( 'DB_USER', '{{pillar['mysql']['db']['user']}}' );

/** MySQL database password */
define( 'DB_PASSWORD', '{{pillar['mysql']['db']['password']}}' );

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
define('AUTH_KEY',         '~i#:=q3?I3:M.eDB>DoH@?{5U$+~ui=p!^D8AA`1`lKr ~o:F_K)eQUXi>fgtXea');
define('SECURE_AUTH_KEY',  '-{8Z{jnoY)LY-P|#1g#`RJtQQ~(6`V)0Xec_1r+.vA3Y9ZS+bG~`e@S+k:Q~+Hrs');
define('LOGGED_IN_KEY',    'CeLDl7S#C0Z9-%oKIeu$)SdtTSV@v|5aK1>Qntv+5evr<bwl^s]x-H}~a(URCRIz');
define('NONCE_KEY',        'Lo|CIb*jwkq1WF_^eApl@L^#K.)QAIw|5+|MMco=]b@*`vUt@< TbsXN#9gB 6%{');
define('AUTH_SALT',        'UNH`,1|P*n O ro?m|K(fGAe#_m#l;gZ9I[i3O^&lmQmhzu.0)_cHqJ]NH4?AL4x');
define('SECURE_AUTH_SALT', '}VC^LN~<9r9$+dDJ&~QtY|H$1@a4^s1s30*:W`AkK{*o]57-M;Bz5uF<rPlxNGum');
define('LOGGED_IN_SALT',   ']JhQ@V+zfr.dH9izvsQi?:3UY/o}~+r4/I>|fS.?yN<yZ0+JZ|XYhO<Lar7QquGk');
define('NONCE_SALT',       'W&MA@|0w{U^+p@A6cHavlO3lU/!LHw m5c$qm%i5m&4-1Q)DA-N:CYDz*%Yt+V&+');

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
