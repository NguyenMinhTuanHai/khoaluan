<?php
/**
 * Cấu hình cơ bản cho WordPress
 *
 * Trong quá trình cài đặt, file "wp-config.php" sẽ được tạo dựa trên nội dung 
 * mẫu của file này. Bạn không bắt buộc phải sử dụng giao diện web để cài đặt, 
 * chỉ cần lưu file này lại với tên "wp-config.php" và điền các thông tin cần thiết.
 *
 * File này chứa các thiết lập sau:
 *
 * * Thiết lập MySQL
 * * Các khóa bí mật
 * * Tiền tố cho các bảng database
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** Thiết lập MySQL - Bạn có thể lấy các thông tin này từ host/server ** //
/** Tên database MySQL */
define( 'DB_NAME', 'wordpress' );

/** Username của database */
define( 'DB_USER', 'user' );

/** Mật khẩu của database */
define( 'DB_PASSWORD', '7581460d' );

/** Hostname của database */
define( 'DB_HOST', 'devcrm-mariadb' );

/** Database charset sử dụng để tạo bảng database. */
define( 'DB_CHARSET', 'utf8mb4' );

/** Kiểu database collate. Đừng thay đổi nếu không hiểu rõ. */
define('DB_COLLATE', '');

/**#@+
 * Khóa xác thực và salt.
 *
 * Thay đổi các giá trị dưới đây thành các khóa không trùng nhau!
 * Bạn có thể tạo ra các khóa này bằng công cụ
 * {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * Bạn có thể thay đổi chúng bất cứ lúc nào để vô hiệu hóa tất cả
 * các cookie hiện có. Điều này sẽ buộc tất cả người dùng phải đăng nhập lại.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'q<K9x=8=un8U@xx3bB#edJTPTh$Z~3~RQAy=$]b8VKz;T}!LTV $Da($3r~rD7Me' );
define( 'SECURE_AUTH_KEY',  '[hf{P?6Q~/zer&LIq%/-j7gm~?1y0q~WKrm|9B,94>azH$`u>+-Vn3~k6#$3:D2e' );
define( 'LOGGED_IN_KEY',    'Ps|1!v-[cjvmU ]02I&gE]rxSI^r%G;1X|c^vU/_S0TFR2WM/75{b+4d>CmBfO|F' );
define( 'NONCE_KEY',        'cnL#5N2>&j?U;5U8o)d4%2_&DNZs9ME9ov9waprIWi[LRS2W%IBIiZ6Tc{_fQk}z' );
define( 'AUTH_SALT',        'qh%3 m-KW1#U6k-(P|fz&2rcZR@]<VvBSm`e{+z.6a?l5_z[rx&-Q=aQ3<U/(J<L' );
define( 'SECURE_AUTH_SALT', '.SWAZT*B_lX4I&xYIR{fHGp=GAdBpa<.D(l[7Im&i!6C99R2OTuZT}xF1IM&#Vy7' );
define( 'LOGGED_IN_SALT',   'bjFtuhDvYMu#H#7GkH7r;j~21*,<PKc7OdP@vi33;(gQw${>}<gnv6B^/Z&PNjon' );
define( 'NONCE_SALT',       '*`4<[I8`SagJm{$GD7<@;9( xeY#_LS|4CUfC${PpI2QUP5}NFrbFYF1My;BfU;_' );

/**#@-*/

/**
 * Tiền tố cho bảng database.
 *
 * Đặt tiền tố cho bảng giúp bạn có thể cài nhiều site WordPress vào cùng một database.
 * Chỉ sử dụng số, ký tự và dấu gạch dưới!
 */
$table_prefix = 'wp_';

/**
 * Dành cho developer: Chế độ debug.
 *
 * Thay đổi hằng số này thành true sẽ làm hiện lên các thông báo trong quá trình phát triển.
 * Chúng tôi khuyến cáo các developer sử dụng WP_DEBUG trong quá trình phát triển plugin và theme.
 *
 * Để có thông tin về các hằng số khác có thể sử dụng khi debug, hãy xem tại Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* Đó là tất cả thiết lập, ngưng sửa từ phần này trở xuống. Chúc bạn viết blog vui vẻ. */

/** Đường dẫn tuyệt đối đến thư mục cài đặt WordPress. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Thiết lập biến và include file. */
require_once(ABSPATH . 'wp-settings.php');
