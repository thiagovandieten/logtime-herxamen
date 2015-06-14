<?php
/**
 * Created by PhpStorm.
 * User: nktakumi
 * Date: 21/05/15
 * Time: 11:55
 */

class Autoloader {

    public function oldLoader($class) {

        if(file_exists('classes/' . $class . '.class.php')) {
            include 'classes/' . $class . '.class.php';
        }

    }

    public function PSR4Loader($class) {


        // project-specific namespace prefix
        $prefix = 'Logtime\\';

        // base directory for the namespace prefix
        $base_dir = __DIR__ . '/Logtime/';

        // does the class use the namespace prefix?
        $len = strlen($prefix);
        if (strncmp($prefix, $class, $len) !== 0) {
            // no, move to the next registered autoloader
            return;
        }

        // get the relative class name
        $relative_class = substr($class, $len);

        // replace the namespace prefix with the base directory, replace namespace
        // separators with directory separators in the relative class name, append
        // with .php
        $file = $base_dir . str_replace('\\', '/', $relative_class) . '.php';
        // if the file exists, require it
        if (file_exists($file)) {
            require $file;
        }
    }
}