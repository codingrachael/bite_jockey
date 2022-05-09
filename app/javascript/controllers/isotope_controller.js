import { Controller } from "@hotwired/stimulus"
import $ from 'jquery'
import jQueryBridget from 'jquery-bridget'
import Isotope from 'isotope-layout'
import { jsonToString } from "webpack/lib/Stats";

export default class extends Controller {
  connect() {
    jQueryBridget('isotope', Isotope, $);

    $(function () {

      let myVarsJSON = $("#my_vars_json").html(),
        myVars = JSON.parse(myVarsJSON)

      const playlistId = myVars['playlist']['id']
      const userId = myVars['user_id']
      const userToken = myVars['user_token']
      const baseUrl = 'https://api.spotify.com/v1'

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


      $('.playlist-button-group').on('click', 'button', function () {
        // $grid.isotope('updateSortData', '.grid-item-playlist').isotope();
        var elems = $grid.isotope('getFilteredItemElements')
        const newTrackIndexes = elems.map(track => {
          return track.dataset.uriValue //Find track number in the html and convert to integer.
        })

        const base_url = 'https://api.spotify.com/v1'

        // Reorder the playlist tracks on spotify
        $.ajax({
          url: `${base_url}/playlists/${playlist_id}/tracks`,
          type: "PUT",
          dataType: 'json',
          headers: {
            'Authorization': "Bearer " + user_token,
            'Content-Type': 'application/json' },
          data: JSON.stringify({
            'uris': newTrackIndexes,
          }),
          success: function () {
            alert(`Playlist Updated Successfully!`);
            location.reload(true);
          },
          error: function () {
            alert(`Playlist Update Failed`);
          }
        });
        // location.reload() to reload the page after updating the playlist.
      });
    });
  };
}
