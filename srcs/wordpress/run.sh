sed -i 's/target_pass/'"$WORDPRESS_DB_PASSWORD"'/g' /www/wordpress/wp-config.php
sed -i 's/target_host/'"$WORDPRESS_DB_HOST"'/g' /www/wordpress/wp-config.php