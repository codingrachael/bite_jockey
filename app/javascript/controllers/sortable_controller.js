import { Controller } from "@hotwired/stimulus"
import { Sortable } from 'sortablejs'
import $ from 'jquery'

export default class extends Controller {
  connect() {
    let myVarsJSON = $("#my_vars_json").html(),
      myVars = JSON.parse(myVarsJSON)

    const playlistId = myVars['playlist']['id']
    const userId = myVars['user_id']
    const userToken = myVars['user_token']
    const baseUrl = 'https://api.spotify.com/v1'

    let el = document.getElementById('harmonic-cards');
    let sortable = Sortable.create(el);
    const trackCards = $('.harmonic-track-card')

    trackCards.each(function() {
      const camelotKey = $(this).attr('data-camelot-key');
      $(this).css('background', backgroundColours[camelotKey])
    })

    $('.update-playlist-button').on('click', function () {
      // Get current order of tracks
      const newTrackOrder = $('.harmonic-track-card')
      const newTrackUris = $.map( newTrackOrder, function(card) {
        return card.dataset.uriValue
      })

      // Replace the playlist tracks on spotify
      $.ajax({
        url: `${baseUrl}/playlists/${playlistId}/tracks`,
        type: "PUT",
        dataType: 'json',
        headers: {
          'Authorization': "Bearer " + userToken,
          'Content-Type': 'application/json'
        },
        data: JSON.stringify({
          'uris': newTrackUris,
        }),
        success: function () {
          alert(`Playlist Updated Successfully!`);
          // Refresh the page.
          location.reload(true);
        },
        error: function () {
          alert(`Playlist Update Failed`);
        }
      });
    });

    $('.create-playlist-button').on('click', function () {
      // Get current order of tracks
      const newTrackOrder = $('.harmonic-track-card')
      const newTrackUris = $.map(newTrackOrder, function (card) {
        return card.dataset.uriValue
      })

      // Create new empty playlist
      $.ajax({
        url: `${baseUrl}/users/${userId}/playlists`,
        type: "POST",
        dataType: 'json',
        headers: {
          'Authorization': "Bearer " + userToken,
          'Content-Type': 'application/json'
        },
        data: JSON.stringify({
          'name': `${myVars['playlist']['name']} by BiteJockey`,
          'description': 'Created by BiteJockey.'
        }),
        success: function (response) {
          const newPlaylistId = response['id']
          // Call function to insert tracks into new empty playlist.
          insertTracks(newPlaylistId)
        },
        error: function () {
          alert(`Playlist Creation Failed`);
        },
      });

      function insertTracks(playlistId) {
        $.ajax({
          url: `${baseUrl}/playlists/${playlistId}/tracks`,
          type: "POST",
          dataType: 'json',
          headers: {
            'Authorization': "Bearer " + userToken,
            'Content-Type': 'application/json'
          },
          data: JSON.stringify({
            'uris': newTrackUris,
            'position': 0
          }),
          success: function () {
            alert(`Playlist Creation Successful!`);
            // Refresh the page.
            location.reload(true);
          }
        });
      }
    });
  };
};

const backgroundColours = {
  '8B': 'linear-gradient(322deg, rgba(224,126,201,1) 0%, rgba(193,126,239,1) 100%)',
  '3B': 'linear-gradient(322deg, rgba(172,252,129,1) 0%, rgba(195,230,115,1) 100%)',
  '10B': 'linear-gradient(322deg, rgba(149,186,255,1) 0%, rgba(169,141,255,1) 100%)',
  '5B': 'linear-gradient(322deg, rgba(229,183,115,1) 0%, rgba(252,142,130,1) 100%)',
  '12B': 'linear-gradient(322deg, rgba(129,240,253,1) 0%, rgba(132,255,237,1) 100%)',
  '7B': 'linear-gradient(322deg, rgba(226,125,198,1) 0%, rgba(250,125,158,1) 100%)',
  '2B': 'linear-gradient(322deg, rgba(148,255,181,1) 0%, rgba(170,253,132,1) 100%)',
  '9B': 'linear-gradient(322deg, rgba(170,138,255,1) 0%, rgba(192,126,241,1) 100%)',
  '4B': 'linear-gradient(322deg, rgba(197,228,115,1) 0%, rgba(226,188,115,1) 100%)',
  '11B': 'linear-gradient(322deg, rgba(147,190,255,1) 0%, rgba(132,237,253,1) 100%)',
  '6B': 'linear-gradient(322deg, rgba(250,126,155,1) 0%, rgba(252,140,131,1) 100%)',
  '1B': 'linear-gradient(322deg, rgba(132,255,234,1) 0%, rgba(148,255,184,1) 100%)',
  '5A': 'linear-gradient(322deg, rgba(251,184,176,1) 0%, rgba(238,210,167,1) 100%)',
  '12A': 'linear-gradient(322deg, rgba(177,246,254,1) 0%, rgba(177,255,245,1) 100%)',
  '7A': 'linear-gradient(322deg, rgba(238,174,217,1) 0%, rgba(252,174,194,1) 100%)',
  '2A': 'linear-gradient(322deg, rgba(189,255,207,1) 0%, rgba(200,254,179,1) 100%)',
  '9A': 'linear-gradient(322deg, rgba(201,181,255,1) 0%, rgba(216,173,247,1) 100%)',
  '4A': 'linear-gradient(322deg, rgba(219,236,167,1) 0%, rgba(237,211,168,1) 100%)',
  '11A': 'linear-gradient(322deg, rgba(188,215,255,1) 0%, rgba(178,242,255,1) 100%)',
  '6A': 'linear-gradient(322deg, rgba(254,173,192,1) 0%, rgba(253,182,177,1) 100%)',
  '1A': 'linear-gradient(322deg, rgba(177,255,241,1) 0%, rgba(186,255,212,1) 100%)',
  '8A': 'linear-gradient(322deg, rgba(217,173,246,1) 0%, rgba(235,174,222,1) 100%)',
  '3A': 'linear-gradient(322deg, rgba(203,253,175,1) 0%, rgba(215,240,167,1) 100%)',
  '10A': 'linear-gradient(322deg, rgba(188,212,255,1) 0%, rgba(201,184,255,1) 100%)'
  }
