document.addEventListener('turbolinks:load', function () {
    const control = document.getElementById('new_user')

    document.confirmation = document.getElementById('user_password_confirmation')
    document.password = document.getElementById('user_password')
    document.checked = document.querySelector('.octicon-check-circle')
    document.alert = document.querySelector('.octicon-alert')

    if (control) {
        control.addEventListener('input', match)
    }
})


function match() {
    if (!document.confirmation.value) {
        document.checked.classList.add('hide')
        document.alert.classList.add('hide')
        return
    }

    if (document.password.value == document.confirmation.value) {
        document.checked.classList.remove('hide')
        document.alert.classList.add('hide')
    }
    else {
        document.alert.classList.remove('hide')
        document.checked.classList.add('hide')
    }
}
