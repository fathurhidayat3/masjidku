<?php

namespace App\Widgets;

use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Widgets\BaseDimmer;

class InventarisDimmer extends BaseDimmer
{
    /**
     * The configuration array.
     *
     * @var array
     */
    protected $config = [];

    /**
     * Treat this method as a controller action.
     * Return view() or other content to display.
     */
    public function run()
    {
        $count = \App\Inventory::all()->count();
        
        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-folder',
            'title'  => "{$count} barang",
            'text'   => "Barang kepemilikan Masjid",
            'button' => [
                'text' => "Lihat detail inventaris",
                'link' => route('voyager.inventories.index'),
            ],
            'image' => asset('storage/widgets/inventory.jpg'),
        ]));
    }

    /**
     * Determine if the widget should be displayed.
     *
     * @return bool
     */
    public function shouldBeDisplayed()
    {
        return app('VoyagerAuth')->user()->can('browse', Voyager::model('User'));
    }
}
