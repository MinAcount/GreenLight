/*!
    * Start Bootstrap - SB Admin Pro v2.0.5 (https://shop.startbootstrap.com/product/sb-admin-pro)
    * Copyright 2013-2023 Start Bootstrap
    * Licensed under SEE_LICENSE (https://github.com/StartBootstrap/sb-admin-pro/blob/master/LICENSE)
    */
    window.addEventListener('DOMContentLoaded', event => {
    // Activate feather
    feather.replace();

    // Enable tooltips globally
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
    });

    // Enable popovers globally
    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
    var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl);
    });

    // Toggle the side navigation
    const sidebarToggle = document.body.querySelector('#sidebarToggle');
    if (sidebarToggle) {
        // Uncomment Below to persist sidebar toggle between refreshes
        // if (localStorage.getItem('sb|sidebar-toggle') === 'true') {
        //     document.body.classList.toggle('sidenav-toggled');
        // }
        sidebarToggle.addEventListener('click', event => {
            event.preventDefault();
            document.body.classList.toggle('sidenav-toggled');
            localStorage.setItem('sb|sidebar-toggle', document.body.classList.contains('sidenav-toggled'));
        });
    }

    // Close side navigation when width < LG
    const sidenavContent = document.body.querySelector('#layoutSidenav_content');
    if (sidenavContent) {
        sidenavContent.addEventListener('click', event => {
            const BOOTSTRAP_LG_WIDTH = 992;
            if (window.innerWidth >= 992) {
                return;
            }
            if (document.body.classList.contains("sidenav-toggled")) {
                document.body.classList.toggle("sidenav-toggled");
            }
        });
    }

    // Add active state to sidbar nav links
    let activatedPath = window.location.pathname.match(/([\w-]+\.do)/, '$1');

    if (activatedPath) {
        activatedPath = activatedPath[0];
    } else {
        activatedPath = 'index.html';
    }

    const targetAnchors = document.body.querySelectorAll('[href="' + activatedPath + '"].nav-link');

    targetAnchors.forEach(targetAnchor => {
        let parentNode = targetAnchor.parentNode;
        while (parentNode !== null && parentNode !== document.documentElement) {
            if (parentNode.classList.contains('collapse')) {
                parentNode.classList.add('show');
                const parentNavLink = document.body.querySelector(
                    '[data-bs-target="#' + parentNode.id + '"]'
                );
                parentNavLink.classList.remove('collapsed');
                parentNavLink.classList.add('active');
            }
            parentNode = parentNode.parentNode;
        }
        targetAnchor.classList.add('active');
    });
});



document.addEventListener("DOMContentLoaded", function() {
	//사이드나브바
	var currentURL = location.pathname.substring(12);
	if(currentURL.includes("employeeOne.do")){
		currentURL = "employeeList.do";
		var targetElement = document.querySelectorAll('#layoutSidenav_nav .emp-main')[0];
		targetElement.click();
	}else if(currentURL.includes("headAndDeptManage.do")){
		currentURL = "headAndDept.do";
	}else if(currentURL.includes("draft.do")){
		currentURL = "draftList.do";
	}else if(currentURL.includes("appr.do")){
		currentURL = "approvalList.do";
	}else if(currentURL.includes("ref.do")){
		currentURL = "referenceList.do";
	}else if(currentURL.includes("temp.do")){
		currentURL = "tempDraftList.do";
	}else if(currentURL.includes("res.do")){
		currentURL = "회의실예약.do";
	}else if(currentURL.includes("possible.do")){
		currentURL = "예약가능.do";
	}else if(currentURL.includes("myres.do")){
		currentURL = "myReserve.do";
	}
	
	
	var layoutSidenav_nav = document.querySelectorAll("#layoutSidenav_nav a");
	for(let navLink of layoutSidenav_nav){
		var linkURL = navLink.getAttribute("href");
		if(currentURL == linkURL){
			navLink.classList.add("active");
		}else{
			navLink.classList.remove("active");
		}
		navLink.addEventListener("click", function(){
			var activeNav = document.querySelectorAll("#layoutSidenav_nav .active.collapsed");
			if(activeNav.length > 0){
				for(let navActive of activeNav){
					navActive.classList.remove("active");
				}
			}
			navLink.classList.add("active");
		})
	}
});

