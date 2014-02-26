$('#comment_rating').raty({
    scoreName: 'comment[rating]',
    scoreId: 'comment_rating',
    path: '/assets',
    starOn:  "star_activ.png",
    starHalf: "half_star_activ.png",
    starOff:  "star_inactiv.png",
    hints: ['Очень плохо', "Плохо", 'Хорошо', 'Очень хорошо', 'Отлично'],
    target: '#hint',
    targetText: 'по критерию цена / качество.',
    targetKeep: true,
    width: '123px'
});
$('#advise_rating').raty({
    scoreName: 'advise[rating]',
    scoreId: 'advise_rating',
    path: '/assets',
    starOn:  "star_activ.png",
    starHalf: "half_star_activ.png",
    starOff:  "star_inactiv.png",
    hints: ['Очень плохо', "Плохо", 'Хорошо', 'Очень хорошо', 'Отлично'],
    target: '#hint',
    targetText: 'по критерию цена / качество.',
    targetKeep: true,
    width: '123px'
});
