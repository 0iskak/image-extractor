bulmaToast.setDefaults({
    duration: 2000,
    position: 'bottom-center',
    animate: {
        in: 'fadeInUp',
        out: 'fadeOutDown'
    }
})

function URLerror() {
    bulmaToast.toast({
        message: 'Invalid URL or images not found',
        type: 'is-danger'
    })
}

function dropdown() {
    const el = document.getElementById('dropdown-menu')
    const active = 'dropdown-active'
    el.classList.contains(active) ? el.classList.remove(active) : el.classList.add(active)
}