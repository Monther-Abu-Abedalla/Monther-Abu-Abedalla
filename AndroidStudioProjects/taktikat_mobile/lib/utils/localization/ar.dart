import 'string_keys.dart';

class ArSu {
  static final ArSu singleton = ArSu._internal();
  ArSu._internal();

  Map<String, String> ar = {
    StringKeys.singleton.youMustSubmitValidEmailOrPhoneNumber:
        'يجب ارفاق البريد الالكتروني أو رقم الجوال',
    StringKeys.singleton.unknown: 'غير معروف',
    StringKeys.singleton.totalPasses: 'التمريرات',
    StringKeys.singleton.appearances: 'ظهور',
    StringKeys.singleton.statesNotAvailableForNow: 'الاحصائيات غير متاحة حاليا',
    StringKeys.singleton.linUpNotAvailableForNow: 'التشكيلات غير متاحة حاليا',
    StringKeys.singleton.corners: 'الركلات الركنية',
    StringKeys.singleton.offsides: 'التسلل',
    StringKeys.singleton.fouls: 'الأخطاء',
    StringKeys.singleton.missedGoals: 'أهداف ضائعة',
    StringKeys.singleton.bigChances: 'فرص كبيرة',
    StringKeys.singleton.secondHalf: 'الشوط الثاني',
    StringKeys.singleton.secondExtraHalf: 'الشوط الاضافي الثاني',
    StringKeys.singleton.firstHalf: 'الشوط الاول',
    StringKeys.singleton.firstExtraHalf: 'الشوط الاضافي الاول',
    StringKeys.singleton.endOfMatch: 'نهاية المباراة',
    StringKeys.singleton.penalties: 'الركلات الترجيحية',
    StringKeys.singleton.noEvents: 'لا يوجد احداث',
    StringKeys.singleton.showMore: 'عرض المزيد',
    StringKeys.singleton.showLess: 'عرض أقل',
    StringKeys.singleton.matchPredictions: 'توقعات المباراة',
    StringKeys.singleton.accuratePasses: 'التمريرات الصحيحة',
    StringKeys.singleton.expectedGoals: 'الاهداف المتوقعة',
    StringKeys.singleton.totalShots: 'عدد التسديدات الكلي',
    StringKeys.singleton.shotsOnTarget: 'التسديدات على المرمى',
    StringKeys.singleton.possession: 'استحواذ',
    StringKeys.singleton.topStats: 'ابرز الأحصائيات',
    StringKeys.singleton.ratings: 'تقيم',
    StringKeys.singleton.assist: 'صناعة اهداف',
    StringKeys.singleton.goals: 'اهداف',
    StringKeys.singleton.topRating: 'الأعلى تقيم',
    StringKeys.singleton.topAssist: 'افضل صانعي الاهداف',
    StringKeys.singleton.topScorer: 'افضل الهدافين',
    StringKeys.singleton.topRated: 'أعلى التقييمات',
    StringKeys.singleton.wins: 'فاز',
    StringKeys.singleton.draw: 'تعادل',
    StringKeys.singleton.confrontations: 'المواجهات المباشرة',
    StringKeys.singleton.standings: 'الترتيب',
    StringKeys.singleton.matchInfo: 'تفاصيل المباراة',
    StringKeys.singleton.date: 'التاريخ',
    StringKeys.singleton.attendance: 'الحضور',
    StringKeys.singleton.referee: 'الحكم',
    StringKeys.singleton.stadium: 'الملعب',
    StringKeys.singleton.awayTeam: 'الفريق الضيف',
    StringKeys.singleton.homeTeam: 'الفريق المضيف',
    StringKeys.singleton.matchReVotedSuccessfully: 'تم  اعادة التصويت بنجاح',
    StringKeys.singleton.matchVotedSuccessfully: 'تم التصويت بنجاح',
    StringKeys.singleton.youMustBeLoggedInToFavoriteTheMatch:
        'يجب عليك تسجيل الدخول لاضافة المباراة الى المفضلة',
    StringKeys.singleton.youMustBeLoggedInToPredictTheMatch:
        'يجب عليك تسجيل الدخول لتوقع المباراة',
    StringKeys.singleton.matchFinished: 'انتهت المباراة',
    StringKeys.singleton.welcome: 'مرحبا',
    StringKeys.singleton.totalPoints: 'مجموع النقاط:',
    StringKeys.singleton.theme: 'الهوية',
    StringKeys.singleton.yourTheme: 'الهوية الخاصة بك',
    StringKeys.singleton.allPlayers: 'كل اللاعبين',
    StringKeys.singleton.topPlayers: 'افضل اللاعبين',
    StringKeys.singleton.favoritePlayers: 'اللاعبين المفضلين',
    StringKeys.singleton.leagues: 'الدوريات',
    StringKeys.singleton.favoriteChampionships: 'البطولات المفضلة',
    StringKeys.singleton.favoriteLeagues: 'الدوريات المفضلة',
    StringKeys.singleton.favoriteTeams: 'الفرق المفضلة',
    StringKeys.singleton.search: 'بحث',
    StringKeys.singleton.username: '@اسم_المستخدم',
    StringKeys.singleton.arabic: 'عربي',
    StringKeys.singleton.english: 'انجليزي',
    StringKeys.singleton.languages: 'اللغات',
    StringKeys.singleton.logout: 'تسجيل الخروج',
    StringKeys.singleton.contactUs: 'اتصل بنا',
    StringKeys.singleton.save: 'حفظ',
    StringKeys.singleton.predict: 'توقع',
    StringKeys.singleton.matchRemovedFromFavorite:
        'تم ازالة المباراة من المفضلة',
    StringKeys.singleton.matchAddedToFavorite: 'تم اضافة المباراة الى المفضلة',
    StringKeys.singleton.noFavoriteMatches: 'لا يوجد مباريات بالمفضلة',
    StringKeys.singleton.nationalTeam: 'منتخب',
    StringKeys.singleton.team: 'فريق',
    StringKeys.singleton.yesterday: 'أمس',
    StringKeys.singleton.tomorrow: 'غدا',
    StringKeys.singleton.today: 'اليوم',
    StringKeys.singleton.back: 'رجوع',
    StringKeys.singleton.live: 'مباشر',
    StringKeys.singleton.search: 'بحث',
    StringKeys.singleton.allMatch: 'جميع المباريات',
    StringKeys.singleton.favorite: 'المفضلة',
    StringKeys.singleton.whoWillWin: 'من سيفوز ؟',
    StringKeys.singleton.match: 'المباريات',
    StringKeys.singleton.news: 'الأخبار',
    StringKeys.singleton.championships: 'البطولات',
    StringKeys.singleton.analysis: 'التحليلات',
    StringKeys.singleton.more: 'المزيد',
    StringKeys.singleton.signUp: 'تسجيل دخول',
    StringKeys.singleton.signupHint:
        'عنوان البريد الإلكتروني أو رقم الهاتف مع مفتاح الدولي',
    StringKeys.singleton.agreeToPrivacyPolicy: 'اوافق على سياسة الخصوصية',
    StringKeys.singleton.continu: 'استمر',
    StringKeys.singleton.skip: 'تخطي',
    StringKeys.singleton.pleaseEnterVerificationCode: 'الرجاء إدخال رمز التحقق',
    StringKeys.singleton.didntGetTheCode: 'لم يصلك رمز التحقق',
    StringKeys.singleton.resend: 'إعادة إرسال',
    StringKeys.singleton.validate: 'تحقق',

    ///validator
    StringKeys.singleton.pleaseEnterEmail: 'الرجاء إدخال البريد الإلكتروني',
    StringKeys.singleton.pleaseEnterPassword: 'الرجاء إدخال كلمة المرور',
    StringKeys.singleton.passwordMustBeAtLeast6Characters:
        'كلمة المرور يجب أن تكون على الأقل 6 أحرف',
    StringKeys.singleton.pleaseEnterValidId: 'الرجاء إدخال رقم هوية صحيح',
    StringKeys.singleton.requiredField: 'حقل مطلوب',
    StringKeys.singleton.pleaseEnterValidEmail:
        'الرجاء إدخال بريد إلكتروني صحيح',
    StringKeys.singleton.passwordMustBeAlphanumeric:
        'كلمة المرور يجب أن تكون أرقام وحروف',
    StringKeys.singleton.passwordMustContainAtLeastOneCapitalLetter:
        'كلمة المرور يجب أن تحتوي على حرف كبير على الأقل',
    StringKeys.singleton.passwordMustContainAtLeastOneSmallLetter:
        'كلمة المرور يجب أن تحتوي على حرف صغير على الأقل',
    StringKeys.singleton.changePassword: 'تغيير كلمة المرور',
    StringKeys.singleton.passwordUpdatedSuccessfully:
        'تم تحديث كلمة المرور بنجاح',
    StringKeys.singleton.passwordNotMatch: 'كلمة المرور غير متطابقة',

    StringKeys.singleton.passwordMustContainAtLeastOneLowercase:
        'كلمة المرور يجب أن تحتوي على حرف صغير على الأقل',
    StringKeys.singleton.passwordMustContainAtLeastOneUppercase:
        'كلمة المرور يجب أن تحتوي على حرف كبير على الأقل',
    StringKeys.singleton.passwordMustContainAtLeastOneNumber:
        'كلمة المرور يجب أن تحتوي على رقم على الأقل',
    StringKeys.singleton.pleaseEnterValidMobile: 'الرجاء إدخال رقم جوال صحيح',
    StringKeys.singleton.pleaseEnterValidName: 'الرجاء إدخال اسم صحيح',
    StringKeys.singleton.pleaseEnterValidDateOfBirth:
        'الرجاء إدخال تاريخ ميلاد صحيح',

    ///utils
    StringKeys.singleton.ok: 'موافق',

    StringKeys.singleton.matchStartIn: 'بداية المباراة في',

    StringKeys.singleton.pleaseEnterValidEmailOrMobile:
        'الرجاء إدخال بريد إلكتروني أو رقم جوال صحيح',
    StringKeys.singleton.pleaseEnterVerificationCode: 'الرجاء إدخال رمز التحقق',
    StringKeys.singleton.verificationCode: 'رمز التحقق',
    StringKeys.singleton.surename: 'الاسم',
    StringKeys.singleton.phone: 'رقم الجوال',
    StringKeys.singleton.email: 'البريد الالكتروني',
    StringKeys.singleton.profile: 'الملف الشخصي',
    StringKeys.singleton.favoriteMatches: 'المباريات المفضلة',

    StringKeys.singleton.players: 'اللاعبين',
    StringKeys.singleton.teams: 'الفرق',
    StringKeys.singleton.matches: 'المباريات',
    StringKeys.singleton.reels: 'الريلز',
    StringKeys.singleton.blogs: 'المدونات',
    StringKeys.singleton.analytics: 'التحليلات',
    StringKeys.singleton.acceptPrivacyPolicy: 'يجب الموافقة على سياسة الخصوصية',
    StringKeys.singleton.reVote: 'إعادة التصويت',
    StringKeys.singleton.votes: 'الأصوات',
    StringKeys.singleton.noMatches: 'لا توجد مباريات',
    StringKeys.singleton.bigFan: 'كبير المشجعين',
    StringKeys.singleton.usernameWithout: 'اسم المستخدم',
    StringKeys.singleton.winner: 'الفائز',
    StringKeys.singleton.lineup: 'التشكيلة',
    StringKeys.singleton.coach: 'المدرب',
    StringKeys.singleton.injuries: 'الإصابات',
    StringKeys.singleton.bench: 'البدلاء',

    StringKeys.singleton.min: 'دقيقة',

    StringKeys.singleton.assets: 'المساعدات',

    StringKeys.singleton.defending: 'الدفاع',

    StringKeys.singleton.foulsMade: 'المخالفات',

    StringKeys.singleton.possessionLost: 'فقدان الاستحواذ',

    StringKeys.singleton.wasDribbledPast: 'تمت مراوغته',

    StringKeys.singleton.clearances: 'الاخلائات',

    StringKeys.singleton.interceptions: 'التدافعات',

    StringKeys.singleton.groundDuelsWon: 'الالتحامات الأرضية الناجحة',

    StringKeys.singleton.aerialDuelsWon: 'الالتحامات الجوية الناجحة',

    StringKeys.singleton.attacking: 'الهجوم',

    StringKeys.singleton.offsides: 'التسلل',

    StringKeys.singleton.keyPasses: 'التمريرات الرئيسية',

    StringKeys.singleton.passesCompleted: 'التمريرات الناجحة',

    StringKeys.singleton.longPassesCompleted: 'التمريرات الطويلة الناجحة',

    StringKeys.singleton.touches: 'اللمسات',

    StringKeys.singleton.wasFouled: 'ارتكاب المخالفات',

    StringKeys.singleton.playerProfile: 'ملف اللاعب',

    StringKeys.singleton.tacklesInterceptions: 'تشتيت كرات',

    StringKeys.singleton.blocks: 'اعتراضات',

    StringKeys.singleton.duelsTotal: 'الالتحامات',

    StringKeys.singleton.duelsWon: 'الالتحامات الناجحة',

    StringKeys.singleton.foulsCommitted: 'أخطاء إرتكبت',

    StringKeys.singleton.penaltyCommitted: 'تسبب بضربة جزاء',

    StringKeys.singleton.penaltyScored: 'ضربة جزاء مسجلة',

    StringKeys.singleton.penaltyMissed: 'ضربة جزاء ضائعة',

    StringKeys.singleton.penaltyWon: 'الحصول على ضربة جزاء',

    StringKeys.singleton.dribblesSuccess: 'المراوغات الناجحة',

    StringKeys.singleton.dribblesPast: 'المراوغات الفاشلة',

    StringKeys.singleton.dribblesAttempts: 'عدد المراوغات',

    StringKeys.singleton.totalShotsOn: 'عدد التسديدات على المرمى',

    StringKeys.singleton.accuracyPasses: 'دقة التمريرات',

    StringKeys.singleton.assists: 'التمريرات الحاسمة',
    StringKeys.singleton.play: 'لعب',
    StringKeys.singleton.win: 'فوز',
    StringKeys.singleton.lose: 'خسارة',
    StringKeys.singleton.tp: 'نقاط',
  };
}
