// app/javascript/controllers/typed_js_controller.js
import { Controller } from "@hotwired/stimulus"
import $ from 'jquery'
import jQueryBridget from 'jquery-bridget'
import Isotope from 'isotope-layout'

export default class extends Controller {
  connect() {
    jQueryBridget('isotope', Isotope, $);

    $(function () {
      var $grid = $('.grid').isotope({
        itemSelector: '.grid-item-playlist',
        layoutMode: 'fitRows',
        transitionDuration: '0.6s',
        getSortData: {
          bpm: function (itemElem) {
            var bpm = $(itemElem).find('.bpm').text();
            return parseFloat(bpm.replace(/[\(\)]/g, ''));
          },
          key: function (itemElem) {
            var key = $(itemElem).find('.key').text();
            return parseInt(key.replace(/[\(\)]/g, ''));
          },
          danceability: function (itemElem) {
            var danceability = $(itemElem).find('.danceability').text();
            return parseFloat(danceability.replace(/[\(\)]/g, ''));
          },
          energy: function (itemElem) {
            var energy = $(itemElem).find('.energy').text();
            return parseFloat(energy.replace(/[\(\)]/g, ''));
          }
        },
        sortAscending: {
          originalOrder: true,
          key: false,
          bpm: false,
          danceability: false,
          energy: false
        }
      });

      $('.sort-by-button-group').on('click', 'button', function () {
        var sortByValue = $(this).attr('data-sort-by');
        $grid.isotope({ sortBy: sortByValue });
      });
    });
  };
}
