$('#comment_rating').raty({
    scoreName: 'comment[rating]',
    scoreId: 'comment_rating',
    path: '/images',
    starOn:  "star_activ.png",
    starHalf: "half_star_activ.png",
    starOff:  "star_inactiv.png",
    hints: ['Жуть', "Плохо", 'Хорошо', 'Очень хорошо', 'Отлично'],
    target: '#hint',
    targetText: 'Оценка цена / качество.',
    targetKeep: true,
    width: '123px'
});
