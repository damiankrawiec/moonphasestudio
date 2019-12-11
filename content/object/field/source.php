<?php

if($this->checkDataDisplay($dataDisplay, 'array')) {

    echo '<div class="row">';
    foreach ($dataDisplay as $m) {

        echo '<div' . $classField . '>';

        if ($m['content'] != '')
            echo '<div>' . $m['content'] . '</div>';

        if ($m['url'] != '') {

            echo '<div class="badge-light">' . $this->translationMark('im_source-name-' . $m['id'], $m['name']) . '</div>';

            echo '<a href="' . $m['url'] . '" title="' . $this->translationSystem['more'] . '" target="_blank" class="btn btn-dark">' . $this->translationSystem['more'] . ' ' . $this->icon['link']['external'] . '</a>';

        }

        echo '</div>';

    }
    echo '</div>';

}