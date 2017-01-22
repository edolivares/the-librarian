$ ->
  if $('.expansible-fake-table').length
    $('.expansible-fake-table section .col.toggle').on 'click', ->
      $section = $(this).closest('section')
      $section.find('.panel-collapse').collapse('toggle')

$ ->
  if $('.expansible-fake-table').length
    $('.expansible-fake-table div table tbody tr td .col.toggle').on 'click', ->
      console.log("holi");
      $section = $(this).closest('div')
      $section.find('.panel-collapse').collapse('toggle')