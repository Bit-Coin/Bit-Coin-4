<?php

class CI_Controller_EX extends CI_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model('M_email_template');
        $this->load->model('M_config');
        $this->load->model('M_post');
        $this->load->model('M_project_type');
        $this->load->library('PHPMailer.php');
    }

    public function send_email($template, $email_to) {
        $result = $this->M_email_template->get_item_by_key($template);
        #load email config
        $email_server = trim($this->M_config->get_item('email_server'));
        $email_pass = trim($this->M_config->get_item('email_pass'));
        $email_host = $this->M_config->get_item('email_host');
        $port = $this->M_config->get_item('email_port');
        $email_SMTPSecure = $this->M_config->get_item('email_SMTPSecure');

        $mail = new PHPMailer();
        $mail->IsSMTP();                            // telling the class to use SMTP
        $mail->SMTPDebug = 1;                      // enables SMTP debug information (for testing)
        // 1 = errors and messages
        // 2 = messages only
        $mail->SMTPAuth = true;                   // enable SMTP authentication
        $mail->SMTPSecure = $email_SMTPSecure;      // sets the prefix to the servier
        $mail->Host = $email_host;            // sets GMAIL as the SMTP server
        $mail->Port = $port;                  // set the SMTP port for the GMAIL server
        $mail->Username = $email_server;          // GMAIL username
        $mail->Password = $email_pass;            // GMAIL password
        $mail->Timeout = 60; // set the timeout (seconds)
        $mail->SMTPKeepAlive = true; // don't close the connection between messages
        $mail->SetFrom($email_server, 'Admin');
        $mail->AddReplyTo($email_server, "Admin");
        $mail->Subject = $result['Subject'];
        $mail->MsgHTML($result['email_template']);

        $mail->AddAddress($email_to, "John Doe");
        $mail->Send();
        $mail->SmtpClose();
        if ($mail->IsError())
            return FALSE;
        else
            return TRUE;
    }

    public function _vertical_menu() {
        $data['result_cata'] = $this->M_post->get_news_type();
        $data['result_project_type'] = $this->M_project_type->get_all(1000, 0);
        return $data;
    }

}

?>  