<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class ParseRestClient{

	private $appid = '';
	private $restkey = '';
	private $parseUrl = '';
	private $pushUrl = '';


/**
 * When creating a new parseRestClient object
 * send array with 'restkey' and 'appid'
 *
 */
	public function __construct(){

		$this->appid = 'fXthztgrwB3gdmQ5TNGL4DVNRzaZJWgoeIBH6lVD';
		$this->restkey = '3N1GRIQCeUWvPaR2gn4yEgJG8BJoKjWMGKCAT7r2';
		$this->parseUrl = 'http://eb-icymyi-parse-server.jegr4ium5p.us-east-1.elasticbeanstalk.com/parse/classes';
		$this->pushUrl = 'http://eb-icymyi-parse-server.jegr4ium5p.us-east-1.elasticbeanstalk.com/parse';
		//$this->parseUrl ='http://eb-icymyi-parse-server.jegr4ium5p.us-east-1.elasticbeanstalk.com/dashboard/apps/icymi/parse/classes';
		//$this->pushUrl = 'http://eb-icymyi-parse-server.jegr4ium5p.us-east-1.elasticbeanstalk.com/parse';
		/*if(isset($config['appid']) && isset($config['restkey'])){
			$this->appid = $config['appid'];
			$this->restkey = $config['restkey'];
		}
		else{
			die('You must include your Application Id and Master Key');
		}
		*/
	}

/*
 * All requests go through this function
 * There are functions that filter all the different request types
 * No need to use this function directly
 *
 */
	private function request($args){
		$c = curl_init();
		curl_setopt($c, CURLOPT_TIMEOUT, 15);
		curl_setopt($c, CURLOPT_USERAGENT, 'parseRestClient/1.0');
		curl_setopt($c, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($c, CURLOPT_HTTPHEADER, array(
			'Content-Type: application/json',
			'X-Parse-Application-Id: '.$this->appid,
			'X-Parse-REST-API-Key: '.$this->restkey,
			'Cache-Control: no-cache'
		));
		curl_setopt($c, CURLOPT_CUSTOMREQUEST, $args['method']);


		if($args['url'] == "push")
		{
			curl_setopt($c, CURLOPT_URL, $args['url']);
		}
		else
		{
			curl_setopt($c, CURLOPT_URL,  $args['url']);
		}

		if($args['method'] == "POST")
		{
			$postData = json_encode($args['payload']);			
			curl_setopt($c, CURLOPT_POSTFIELDS, $postData );
		}
		else if($args['method'] == 'PUT')
		{			
			$postData = json_encode($args['payload']);
			//$postData = $args['payload'];	
			curl_setopt($c, CURLOPT_POSTFIELDS, $postData );
		}
		else
		{
			$postData = array();
			if(isset($args['query']))
			{
				$postData['where'] = json_encode( $args['query'] );
			}
			if(isset($args['order']))
			{
				$postData['order'] = $args['order'];
			}
			if(isset($args['limit']))
			{
				$postData['limit'] = $args['limit'];
			}
			if(isset($args['skip']))
			{
				$postData['skip'] = $args['skip'];
			}
			if(count($postData) > 0)
			{

				$query = http_build_query($postData, '', '&');
				curl_setopt($c, CURLOPT_URL, $args['url'].'?'.$query);
			}
		}
		
		$response = curl_exec($c);
		$httpCode = curl_getinfo($c, CURLINFO_HTTP_CODE);

		return array('code'=>$httpCode, 'response'=>$response);
	}

	/*
 * Used to create a parse.com object
 *
 * @param array $args - argument hash:
 *
 * className: string of className
 * object: object to create
 *
 * @return string $return
 *
 */
	public function create($args){
		$params = array(
			'url' => $this->parseUrl,
			'method' => 'POST',
			'payload' => $args['object']
		);

		$return = $this->request($params);

		return $this->checkResponse($return,'201');

	}

	/*
 * Used to send a push notification
 *
 * @param array $args - argument hash:
 *
 * push: leave this alone
 * object: notification details
 *
 * @return string $return
 *
 */
	public function notification($args){
		$params = array(
			'url' => 'push',
			'method' => 'POST',
			'payload' => $args['object']
		);

		$return = $this->request($params);

		return $this->checkResponse($return,'200');

	}


/*
 * Used to get a parse.com object
 *
 * @param array $args - argument hash:
 *
 * className: string of className
 * objectId: (optional) the objectId of the object you want to update. If none, will return multiple objects from className
 *
 * @return string $return
 *
 */
	public function get($args){
		$params = array(
			'url' => $this->parseUrl  .'/'.$args['objectId'],
			'method' => 'GET'
		);

		$return = $this->request($params);

		return $this->checkResponse($return,'200');
	}

/*
 * Used to update a parse.com object
 *
 * @param array $args - argument hash:
 *
 * className: string of className
 * objectId: the objectId of the object you want to update
 * object: object to update in place of old one
 *
 * @return string $return
 *
 */
	public function update($args){
		$params = array(
			'url' => $this->parseUrl .'/'.$args['objectId'] . '/' . $args['where'],
			'method' => 'PUT',
			'payload' => $args['object']
		);

		$return = $this->request($params);

		return $this->checkResponse($return,'200');
	}

/*
 * Used to query parse.com.
 *
 * @param array $args - argument hash:
 *
 * className: string of className
 * query: array containing query. See: https://www.parse.com/docs/rest#data-querying
 * order: (optional) used to sort by the field name. use a minus (-) before field name to reverse sort
 * limit: (optional) limit number of results
 * skip:  (optional) used to paginate results
 *
 * @return string $return
 *
 */

	public function query($args){
		$params = array(
			'url' => $this->parseUrl.'/'.$args['objectId'],
			'method' => 'GET'
		);

		if(isset($args['query'])){
			$params['query'] = $args['query'];
		}
		if(isset($args['order'])){
			$params['order'] = $args['order'];
		}
		if(isset($args['limit'])){
			$params['limit'] = $args['limit'];
		}
		if(isset($args['skip'])){
			$params['skip'] = $args['skip'];
		}

		$return = $this->request($params);

		return $this->checkResponse($return,'200');

	}

/*
 * Used to get a parse.com object
 *
 * @param array $args - argument hash:
 *
 * className: string of className
 * objectId: (optional) the objectId of the object you want to update. If none, will return multiple objects from className
 *
 * @return string $return
 *
 */
	public function delete($args){
		$params = array(
			'url' => $this->parseUrl .'/'.$args['objectId'],
			'method' => 'DELETE'
		);

		$return = $this->request($params);

		return $this->checkResponse($return,'200');
	}


/*
 * Checks for correct/expected response code.
 *
 * @param array $return, string $code
 *
 * @return string $return['response]
 *
 */
	private function checkResponse($return,$code){
		//TODO: Need to also check for response for a correct result from parse.com
		if( $return['code'] != $code )
		{
			$error = json_decode($return['response']);

			if ( $error )
				die('ERROR: response code was '.$return['code'].' with message: '.$error->message);
			else
				die('ERROR: response code was '.$return['code']);
		}
		else
		{
			return json_decode( $return['response'] )->results;
		}
	}

	public function prettyPrint( $json )
	{
	    $result = '';
	    $level = 0;
	    $in_quotes = false;
	    $in_escape = false;
	    $ends_line_level = NULL;
	    $json_length = strlen( $json );

	    for( $i = 0; $i < $json_length; $i++ ) {
	        $char = $json[$i];
	        $new_line_level = NULL;
	        $post = "";
	        if( $ends_line_level !== NULL ) {
	            $new_line_level = $ends_line_level;
	            $ends_line_level = NULL;
	        }
	        if ( $in_escape ) {
	            $in_escape = false;
	        } else if( $char === '"' ) {
	            $in_quotes = !$in_quotes;
	        } else if( ! $in_quotes ) {
	            switch( $char ) {
	                case '}': case ']':
	                    $level--;
	                    $ends_line_level = NULL;
	                    $new_line_level = $level;
	                    break;

	                case '{': case '[':
	                    $level++;
	                case ',':
	                    $ends_line_level = $level;
	                    break;

	                case ':':
	                    $post = " ";
	                    break;

	                case " ": case "\t": case "\n": case "\r":
	                    $char = "";
	                    $ends_line_level = $new_line_level;
	                    $new_line_level = NULL;
	                    break;
	            }
	        } else if ( $char === '\\' ) {
	            $in_escape = true;
	        }
	        if( $new_line_level !== NULL ) {
	            $result .= "\n".str_repeat( "\t", $new_line_level );
	        }
	        $result .= $char.$post;
	    }

	    return $result;
	}

}

?>
