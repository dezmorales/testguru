document.addEventListener('turbolinks:load', function() {
    let timer_block = document.getElementById('timer')

    if (timer_block) {
        timer_block.addEventListener('load', timer)
        setInterval(timer, 1000)
    }
})

const update = function() {
    const updateButton = document.getElementById('next-question')

    updateButton.click()
}

const timer = function() {
    const timer = document.getElementById('timer')
    const times_up = timer.dataset.timesUp
    const difference = +new Date(times_up) - +new Date()

    let remaining = 'Time is up!'

    if (difference > 0) {
        const parts = [
            Math.floor((difference / (1000 * 60 * 60)) % 24),
            Math.floor((difference / 1000 / 60) % 60),
            Math.floor((difference / 1000) % 60),
        ]
        remaining = parts.map((part) => String(part).padStart(2, '0')).join(":")
    } else {
        timer.classList.add('border-danger')
        setTimeout(update, 2000)
    }

    timer.innerHTML = remaining
}
