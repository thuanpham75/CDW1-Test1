<?php
namespace App\Http\Controllers;
use App\Model\City;
class CityController extends Controller{
    public function index(){
        $city = City::all();
        return view('index', ['cities' => $city]);
    }
}