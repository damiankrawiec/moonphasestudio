<?php

//init require element on the content in section (object), rest part of section are include
require_once 'content/object/object.class.php';

$object = new ObjectContent($this->systemName(), $db, $this->currentLanguage, $this->admin);

$sectionData = $this->getSection();

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
<div class="im-content">

    <div class="container-fluid">

        <?php $object->display($sectionData->id, $label['logo']); ?>

        <?php $object->display($sectionData->id, $label['menu']); ?>

    </div>

    <div class="<?php echo (!isset($sectionData->class) ? 'container' : $sectionData->class) ?>">

        <?php

        //Option:
        //    //- parent (to section field, show child sections of current section)
        //    //- begin, end (must be together) - connected 2 or more label group in one row
        //    //- pagination always with :X on the right (number of objects show on one page of paging)
        //    //- submenu show section name and his children via dropdown
        //    //- scroll insert a scroll tag (animate scrolling)

        ?>

        <?php $object->display($sectionData->id, $label['slider']); ?>

        <!-- Animated icon -->
        <?php $object->display($sectionData->id, $label['icon-scroll-down']); ?>

        <?php $object->display($sectionData->id, $label['before-content-title']); ?>

        <?php $object->display($sectionData->id, $label['content']); ?>

        <?php $object->display($sectionData->id, $label['blog']); ?>

        <?php $object->display($sectionData->id, $label['after-content-title']); ?>

        <?php $object->display($sectionData->id, $label['trust'], 'pagination:4'); ?>

        <div class="row">

            <div class="col-12 col-lg-6">

                <?php

                //Static content (when in system is "static" dir, and file is named like current url section) - if both are false static content is not display
                //In static file should be defined class, rows, col, etc. - content fix to rest page box
                //Name of files may only string section - check in foreach(dir) and stristr()
                $object->displayStatic($sectionData->id);

                //home, kontakt - Google Maps (API)

                ?>

            </div>

            <div class="col-12 col-lg-6">

                <?php $object->display($sectionData->id, $label['next-map']); ?>

            </div>

        </div>

    </div>

    <div class="container-fluid">

        <div class="im-footer">

            <?php $object->display($sectionData->id, $label['footer-left'], 'begin'); ?>

            <?php $object->display($sectionData->id, $label['footer-right'], 'end'); ?>

            <?php $object->display($sectionData->id, $label['footer-bottom']); ?>

        </div>

    </div>

</div>

<div class="right-menu-box">

    <?php $object->display($sectionData->id, $label['right-menu']); ?>

</div>