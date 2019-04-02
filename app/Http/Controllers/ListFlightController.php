<?php
namespace App\Http\Controllers;
use App\Model\Flight_list;
class ListFlightController extends Controller {
    public function index() {
        $flightList = Flight_list::all();
        return view('/flight-list', ['flights' => $flightList]);
    }
    public function flightSearch($city_from, $city_to, $time_from, $time_return){       
    $sql = "SELECT * FROM flights, airways WHERE flights.airways_id  = airways.airways_id 										AND	  flight_city_from LIKE '%$city_from%'
		 			AND   flight_city_to   LIKE '%$city_to%'
		 			AND   flight_time_from LIKE '%$time_from%'";

		$resultSearch = self::$conn->query($sql);
		$array = array();
		while($row = $resultSearch->fetch_assoc()){
				$array[] = $row;
		}
		return $array;
      }
}
