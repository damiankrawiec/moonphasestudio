<?php

//init require element on the content in section (object), rest part of section are include
require_once 'content/object/object.class.php';

$object = new ObjectContent($this->systemName(), $db, $this->currentLanguage, $this->admin);

$sectionData = $this->getSection();

$sectionId = $sectionData->id;

$label = $object->getAllLabel();

?>
<!--
<div class="im-language">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <?php $object->displayLanguage(); ?>
            </div>
        </div>
    </div>
</div>
-->
<div class="<?php echo (!isset($sectionData->class) ? 'container' : $sectionData->class) ?> im-content">

    <?php

    //Option:
    //    //- parent (to section field, show child sections of current section)
    //    //- begin, end (must be together) - connected 2 or more label group in one row
    //    //- pagination always with :X on the right (number of objects show on one page of paging)
    //    //- submenu show section name and his children via dropdown
    //    //- scroll insert a scroll tag (animate scrolling)

    ?>

    <?php $object->display($sectionId, $label['logo']); ?>

    <?php $object->display($sectionId, $label['menu']); ?>

    <?php $object->display($sectionId, $label['slider']); ?>

    <!-- Animated icon -->
    <?php $object->display($sectionId, $label['icon-scroll-down']); ?>

    <?php $object->display($sectionId, $label['before-content-title']); ?>

    <?php $object->display($sectionId, $label['content'], 'scroll'); ?>

    <?php $object->display($sectionId, $label['after-content-title']); ?>

    <?php $object->display($sectionId, $label['trust'], 'pagination:4,scroll'); ?>

    <div class="row">

        <div class="col-12 col-lg-6">

            <?php

            //Static content (when in system is "static" dir, and file is named like current url section) - if both are false static content is not display
            //In static file should be defined class, rows, col, etc. - content fix to rest page box
            //Name of files may only string section - check in foreach(dir) and stristr()
            $object->displayStatic($sectionId);

            //home, kontakt - Google Maps (API)

            ?>

        </div>

        <div class="col-12 col-lg-6">

            <?php $object->display($sectionId, $label['next-map']); ?>

        </div>

    </div>

    <div class="im-footer">

        <?php $object->display($sectionId, $label['footer-left'], 'begin'); ?>

        <?php $object->display($sectionId, $label['footer-right'], 'end'); ?>

        <?php $object->display($sectionId, $label['footer-bottom']); ?>

    </div>

</div>

<div class="right-menu-box">

    <?php $object->display($sectionId, $label['right-menu']); ?>

</div>