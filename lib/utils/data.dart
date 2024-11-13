class SkinDisease {
  final String acronym;
  final String name;
  final String description;
  final String treatment;
  final String prevention;

  SkinDisease({
    required this.acronym,
    required this.name,
    required this.description,
    required this.treatment,
    required this.prevention,
  });
}

List<SkinDisease> skinDiseases = [
  SkinDisease(
    acronym: 'VASC',
    name: 'Vascular Skin Condition',
    description:
        'A condition affecting blood vessels in the skin, leading to various symptoms such as discoloration or abnormal growths.',
    treatment:
        'Topical or oral medications, laser treatments, or surgery depending on the condition.',
    prevention:
        'Maintaining skin hydration, wearing protective clothing, and sun protection.',
  ),
  SkinDisease(
    acronym: 'SCC',
    name: 'Squamous Cell Carcinoma',
    description:
        'A type of skin cancer that arises from squamous cells in the outer layer of the skin.',
    treatment: 'Surgical removal, radiation therapy, or topical treatments.',
    prevention:
        'Avoid excessive sun exposure, use sunscreen, and wear protective clothing.',
  ),
  SkinDisease(
    acronym: 'NV',
    name: 'Nevus',
    description:
        'A benign skin lesion, commonly referred to as a mole, that may be present at birth or develop later in life.',
    treatment:
        'Monitoring or surgical removal if there are changes in appearance.',
    prevention: 'Regular skin checks and sun protection.',
  ),
  SkinDisease(
    acronym: 'MEL',
    name: 'Melanoma',
    description:
        'A serious form of skin cancer that develops in melanocytes, the cells that produce pigment.',
    treatment:
        'Surgical removal, chemotherapy, radiation therapy, or immunotherapy.',
    prevention:
        'Avoiding excessive sun exposure, using sunscreen, and regular skin checks.',
  ),
  SkinDisease(
    acronym: 'DF',
    name: 'Dermatofibroma',
    description:
        'A benign skin growth that appears as a small, firm bump, usually caused by a minor injury.',
    treatment:
        'No treatment is usually required, but surgical removal is an option for cosmetic reasons.',
    prevention: 'Prevent skin trauma and maintain skin care.',
  ),
  SkinDisease(
    acronym: 'BKL',
    name: 'Benign Keratosis Lesion',
    description:
        'A harmless skin growth, often referred to as seborrheic keratosis, that typically appears as a raised, wart-like lesion.',
    treatment:
        'Cryotherapy or surgical removal if desired for cosmetic reasons.',
    prevention: 'Regular skin checks and sun protection.',
  ),
  SkinDisease(
    acronym: 'BCC',
    name: 'Basal Cell Carcinoma',
    description:
        'The most common type of skin cancer that arises from the basal cells in the skin.',
    treatment: 'Surgical removal, topical treatments, or radiation therapy.',
    prevention:
        'Use sunscreen, avoid prolonged sun exposure, and wear protective clothing.',
  ),
  SkinDisease(
    acronym: 'AK',
    name: 'Actinic Keratosis',
    description:
        'A rough, scaly patch on the skin that develops from years of sun exposure and can lead to skin cancer if untreated.',
    treatment: 'Cryotherapy, topical medications, or laser therapy.',
    prevention: 'Limit sun exposure and use sunscreen regularly.',
  ),
  SkinDisease(
    acronym: 'VIT',
    name: 'Vitiligo',
    description:
        'A condition in which the skin loses melanin, leading to white patches on the skin.',
    treatment:
        'Topical steroids, light therapy, and, in some cases, surgery to restore skin color.',
    prevention:
        'No definitive prevention, but avoiding skin trauma and stress may help manage the condition.',
  ),
  SkinDisease(
    acronym: 'ROS',
    name: 'Rosacea',
    description:
        'A chronic skin condition that causes redness and visible blood vessels on the face.',
    treatment:
        'Topical or oral medications, laser therapy, and lifestyle changes to avoid triggers.',
    prevention:
        'Avoiding known triggers such as sun exposure, spicy foods, and stress can help manage symptoms.',
  ),
  SkinDisease(
    acronym: 'PSO',
    name: 'Psoriasis',
    description:
        'An autoimmune condition that causes rapid skin cell buildup, leading to scaly patches on the skin.',
    treatment:
        'Topical treatments, phototherapy, oral or injectable medications.',
    prevention:
        'No definitive prevention, but avoiding skin injuries and managing stress may help.',
  ),
  SkinDisease(
    acronym: 'HIV',
    name: 'Hives',
    description:
        'Raised, itchy welts on the skin that are often triggered by an allergic reaction.',
    treatment:
        'Antihistamines, avoiding allergens, and applying soothing lotions.',
    prevention:
        'Avoid known allergens, stress management, and wearing loose clothing.',
  ),
  SkinDisease(
    acronym: 'CPX',
    name: 'Chicken Pox',
    description:
        'A highly contagious viral infection that causes an itchy rash and flu-like symptoms.',
    treatment:
        'Antihistamines, calamine lotion, and antiviral medications in severe cases.',
    prevention: 'Vaccination is the most effective way to prevent chickenpox.',
  ),
  SkinDisease(
    acronym: 'AA',
    name: 'Alopecia Areata',
    description:
        'An autoimmune disorder that causes hair loss on the scalp and other parts of the body.',
    treatment:
        'Topical corticosteroids, immunotherapy, and, in some cases, hair transplants.',
    prevention:
        'No definitive prevention; stress management may help in some cases.',
  ),
  SkinDisease(
    acronym: 'ECZ',
    name: 'Eczema',
    description:
        'A condition that causes inflamed, itchy, cracked, and rough skin.',
    treatment:
        'Moisturizers, corticosteroid creams, and avoiding triggers like harsh soaps.',
    prevention:
        'Avoiding known irritants, maintaining skin hydration, and stress management.',
  ),
  SkinDisease(
    acronym: 'ACN',
    name: 'Acne',
    description:
        'A skin condition that occurs when hair follicles become clogged with oil and dead skin cells, causing pimples and inflammation.',
    treatment: 'Topical creams, oral medications, and lifestyle changes.',
    prevention:
        'Regular skin cleansing, avoiding heavy makeup, and managing diet and stress.',
  ),
];
