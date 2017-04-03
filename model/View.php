<?php


class View
{
    private $data = array();

    private $render = FALSE;

    public function __construct($template = false, $data = false)
    {
        $file = '/view/' . $template;
        if ($data) $this->data = $data;

        if (file_exists($file)) {
            $this->render = $file;
        }else{
            $this->render = "index.php";
        }
//        if ($template) {
//            try {
//                $file = '/view/' . $template;
//                if ($data) $this->data = $data;
//
//                if (file_exists($file)) {
//                    $this->render = $file;
//                } else {

//                    throw new customException('Template ' . $template . ' not found!');
//                }
//            } catch (customException $e) {
//                echo $e->errorMessage();
//            }
//        }
    }

    public function setRender($render){
        $this->render = $render;
    }

    public function assign($variable, $value)
    {
        $this->data[$variable] = $value;
    }

    public function __destruct()
    {
        extract($this->data);
        include($this->render);

    }

    public function render($view = false)
    {
        ob_start();
        $view ? $include = $view : $include = $this->render;
        include $include;
        $output = ob_get_contents();
        ob_end_clean();
        return $output;
    }
}