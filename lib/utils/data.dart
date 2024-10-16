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
];
