<?php

namespace App\Widgets;

use Illuminate\Support\Str;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Widgets\BaseDimmer;

class SaldoDimmer extends BaseDimmer
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
        $pemasukan = \App\Pemasukan::all()->sum('nominal');
        $pengeluaran = \App\Pengeluaran::all()->sum('nominal');
        $count = $pemasukan - $pengeluaran;

        return view('voyager::dimmer', array_merge($this->config, [
            'icon'   => 'voyager-receipt',
            'title'  => "Rp. {$count}",
            'text'   => "Sisa saldo per April-Mei 2019",
            'button' => [
                'text' => "Lihat detail keuangan",
                'link' => route('voyager.pemasukans.index'),
            ],
            'image' => asset('storage/widgets/calculate.jpg'),
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
