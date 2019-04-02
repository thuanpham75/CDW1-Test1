<?php


Route::group(['middleware' => ['web']], function() {
    Route::get('/index', 'CityController@index')->name('index');
    
    Route::get('/flight-list', 'ListFlightController@index')->name('flight-list');
    
    Route::get('/register', 'RegisterController@index')->name('register');
    Route::post('/register', 'RegisterController@postRegister');
    
    Route::get('/update', 'UpdateUserController@getInfor')->name('update')->middleware('auth');
    Route::post('/update', 'UpdateUserController@postUpdate')->name('attendupdate');
    
    Route::get('/login', 'LoginController@index')->name('login');
    Route::get('/', 'LoginController@index')->name('login');
    Route::post('/login', 'LoginController@postLogin');
    Route::get('/logout', 'LoginController@logout')->name('logout')->middleware('auth');
    
});
