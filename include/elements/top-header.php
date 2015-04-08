<div class="top-header">
    <img src="_img/icons/menu.png" alt="menu" id="showLeftPush">
    <div class="title-place">
        <h1>Logtime</h1>
    </div>
    <div class="mob-noti">
        <img src="_img/icons/noti.png" alt="meldingen" id="showRight">
        <span class="noti-aantal-mob">9</span><!--Notification aantal voor mobiel -->
    </div>
    <span class="noti-aantal">9</span><!--Notification aantal voor desktop -->
    <a href="#" id="notificationLink"><img src="_img/icons/noti.png" alt="meldingen" class="noti"></a>
    <div id="notificationContainer">
        <div id="notificationTitle">Notificatie</div>
        <div id="notificationsBody" class="notifications">
            [Hier komen notifications]<!--Notifications komen hier -->
        </div>
        <div id="notificationFooter"><a href="notificaties">Bekijk alles</a></div>
    </div>
    <!--Link naar persoonlijke instellingen -->
    <a href="persoonlijke-instellingen"><img src="_img/icons/instellingen-mob.png" alt="Instellingen" class="destop-instellingen" title="Instellingen">
        <p><?php echo $userClass->getname();?></p><!--Leerlingnaam ophalen van db -->
    </a>
    <img src="<?php echo $userClass->getUserImage();?>" alt="avatar" class="avatar"><!--Leerling avatar ophalen van db -->
</div>