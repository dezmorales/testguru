document.addEventListener('turbolinks:load', function () {
    let timer_block = document.getElementById('timer')

    if (timer_block) {
        let times_up = timer_block.dataset.timesUp
        window.remaining_seconds = times_up
        timer_block.addEventListener('load', timer)
        setInterval(timer, 1000)
    }
})

const update = function () {
    const updateButton = document.getElementById('next-question')

    updateButton.click()
}

const timer = function () {
    let timer_block = document.getElementById('timer')

    let remaining_time = new Date(window.remaining_seconds * 1000).toISOString().substr(11, 8)

    if (window.remaining_seconds < 0) {

        timer_block.classList.add('border-danger')
        setTimeout(update, 2000)
        remaining_time = 'Time over!'
    }

    timer_block.innerHTML = remaining_time
    window.remaining_seconds = window.remaining_seconds - 1
}
