/**
 * 검색창 제어
 */
function search() {
// 검색창 요소(.search) 찾기.
    const searchEl = document.querySelector('.search')
    const searchInputEl = searchEl.querySelector('input')
// 검색창 요소를 클릭하면 실행.
    searchEl.addEventListener('click', function () {
        searchInputEl.focus()
    })
// 검색창 요소 내부 실제 input 요소에 포커스되면 실행.
    searchInputEl.addEventListener('focus', function () {
        searchEl.classList.add('focused')
        searchInputEl.setAttribute('placeholder', '통합검색')
    })
// 검색창 요소 내부 실제 input 요소에서 포커스가 해제(블러)되면 실행.
    searchInputEl.addEventListener('blur', function () {
        searchEl.classList.remove('focused')
        searchInputEl.setAttribute('placeholder', '')
    })
}

/* 메뉴창 슬라이드 */
function menuSlide() {
    document.querySelector('.main-menu').addEventListener('mouseover', e => {
        if (!e.target.matches('.item__name')) {
            return;
        }

        const ic = e.target.nextElementSibling;
        console.log("over-{}", ic);
        const height = ic.firstElementChild.offsetHeight + ic.lastElementChild.offsetHeight;
        ic.style.transition = "height 0.3s";
        ic.style.height = height + "px";

        const menus = [...document.querySelector('.main-menu').children];

        for (const m of menus) {
            if (e.target !== m.firstElementChild) {
                console.log("other-{}", m.firstElementChild);
                m.lastElementChild.style.transition = "0s";
                m.lastElementChild.style.height = "0";
            }
        }

        document.querySelector('.main-menu').addEventListener('mouseleave', ee => {

            console.log("overleave", e.target)
            console.log("leave -{}", ee.target);

            const t = e.target.nextElementSibling;
            t.style.height = "0";
        })
    })
}

(function (){
    search();
    menuSlide();

})();