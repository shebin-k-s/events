import 'package:events/screens/edit_profile/edit_profile_screen.dart';
import 'package:events/screens/profile/dummy_screen.dart';
import 'package:flutter/material.dart';

const kTextFieldHeight = SizedBox(height: 20);

const String baseUrl = "http://192.168.29.101:8080";

const Color bookingTextColor = Color(0xff495061);

final List<Map> profileItems = [
  {
    "icon": Icons.edit,
    "label": "Edit profile",
    "goTo": EditProfileScreen(),
  },
  {
    "icon": Icons.history,
    "label": "Events booking history",
    "goTo": DummyScreen(),
  },
  {
    "icon": Icons.live_tv,
    "label": "Live events booking history",
    "goTo": DummyScreen()
  },
  {
    "icon": Icons.cancel,
    "label": "Canceled events history",
    "goTo": DummyScreen(),
  },
  {
    "icon": Icons.post_add,
    "label": "User highlights post",
    "goTo": DummyScreen(),
  },
  {
    "icon": Icons.group,
    "label": "Added friends details",
    "goTo": DummyScreen(),
  },
  {
    "icon": Icons.logout,
    "label": "Logout",
    "goTo": DummyScreen(),
  },
];

final List<Map> categories = [
  {
    "category": "Cultural",
    "image":
        "https://s3-alpha-sig.figma.com/img/2a34/0010/8eedd066beebf5ef2b97dfb5caa54df5?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Fsp0DkEgaXXLCruBneqba78XyasiZ~PB2B~a8N5OXoLIl~DxBOg~L1tHk0DIO9JIXIdLBDI1G2NB7SKtJNK~CVdgxoTIHUh7PzhNS6d2hxqQh5I~4jAeeCK7YCeySZRUMJ8fLcMeK4jlZPGVWwt5UHrSxymP54rjuzOS3qpoNmDRPYQK~cwrCvAOxTwVe5llUBi1WDqc5qAulLHSkOdsSzjQiZnzTDl0IlXmABKA1fWbHH9yGTvVCI2lrjkSoYQggthQbX9MyuP7GDAimqGUjFn4pSDQn2sF3Lm9rD-DQBQC8no1Y2lzZDSFnH7C4GGTpjLjRff~rH72I4g0f52lTw__",
  },
  {
    "category": "Music",
    "image":
        "https://s3-alpha-sig.figma.com/img/383e/e868/08c36b935bebb41cc95f9015670086d8?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fhiXKQfOqm1RapvogCowS7Lyv1daoXYAMuSP06~MzxXRnGA4DSFJlIQwiIGDMYZ9OvLhUufAc3tT7Ze9H2lV0MWQDyDW7shgCas3ItepoGDTtaCOlsZKwOeWqSQl5wXvIAaS~V-sqtdEFcvHBn~lLCYzucXe-dPVM5Zrk~UKDhkxiLgL0bKfA7fmm5rw59S5RZXtopSX3bt2UgF~xI338Leblmk89Pma3oTYfAAsARYDKNoWYzTCrTItfaV1SlUlwoC8abf~ko3m1ORzIxRTDFnbOU7SID7hWn4vzbG6vLPjEJOV4VKWs0FpaCybw-avJ45h8tBvGL-wsu3y10KRYg__",
  },
  {
    "category": "Dance",
    "image":
        "https://s3-alpha-sig.figma.com/img/7487/f75b/a4146d1e0313800c396a71d0617a8578?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=dQlQ9mNbCgMW0jUOVVuBJpZ2CH2ynA9cavF3DxZPQrHCxxtrUhQFQovSVo8etk66lQsw813ex761RjUB5QttqOPvIxbKZnSEIQrby7wZzlOvXr0OhFXspr~P9ewCui5ue8TPsjdmIJ5Uc-ZkOiVDpByw68W68nY~3B0qoPPxoyc1pxPWrd7yUnA4fcv1QYjCao99IP7Hz40397mN8GkKs3HRM3DI-ZDG~Fe8dvXKK3BDI1aBmwXPBH8~SAjdnWiUcHo1tWuIjSKvZXrgZlM8zBbCh8Wwtd39DA1nrejB6n3Qpqd~6RTZC24Lblg4I2YKG0KMVAYYsRoQ5dOcbmFuAw__",
  },
  {
    "category": "Sports",
    "image":
        "https://s3-alpha-sig.figma.com/img/894e/f6b9/4da10115cd97f330af72c923cdbe08fb?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=TzbHD--9xoPuM218KHZW55kvCdnaI4LBC7a8tVtu-GQEBEAcgQx~E3Rq2pWTGYSUgCdKmaeCC5zfiE8Sh4eIIBIayo58ibAe92bXhfA4z-l~bCtbg90UBDgPSyShKJeKR6rDwhpRW4v3m62FTDBMz-KQM6S1su2EFhpuLQlVCy-jMlwfZ8q0PWrYYpXg4e8Ck-dENeHLrbXtarxCl4gng298e~PuD9KnKAcv318Ba1ddKjbybqh16JswH2iyKkYRV7vMUacsZbrMIxOhmU7DH57nHxkq9EBdM2GQiTj3jki8-1Q~FvmFA93yu6GUSpybWIfEBTawbA~7UyC1uuH5-A__",
  },
  {
    "category": "Cultural",
    "image":
        "https://s3-alpha-sig.figma.com/img/2a34/0010/8eedd066beebf5ef2b97dfb5caa54df5?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Fsp0DkEgaXXLCruBneqba78XyasiZ~PB2B~a8N5OXoLIl~DxBOg~L1tHk0DIO9JIXIdLBDI1G2NB7SKtJNK~CVdgxoTIHUh7PzhNS6d2hxqQh5I~4jAeeCK7YCeySZRUMJ8fLcMeK4jlZPGVWwt5UHrSxymP54rjuzOS3qpoNmDRPYQK~cwrCvAOxTwVe5llUBi1WDqc5qAulLHSkOdsSzjQiZnzTDl0IlXmABKA1fWbHH9yGTvVCI2lrjkSoYQggthQbX9MyuP7GDAimqGUjFn4pSDQn2sF3Lm9rD-DQBQC8no1Y2lzZDSFnH7C4GGTpjLjRff~rH72I4g0f52lTw__",
  },
];

final List<Map> nearbyEvents = [
  {
    "image":
        "https://s3-alpha-sig.figma.com/img/3b88/c527/d1662970c96078f2a8f84b58a5f51ab6?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Z7j~4OunCSK~A5wTKE2N1F38arkW0DKXwPuNQsIuWjIVynCcb4vDi726cXy8wYMjMhIEmk5zy~GwdUG-m3OMrIAA9ZO66QMeb0SpCD0XH7LDAdlfiMXsepqxvgVJD2-Pv9R-cSCczyzj4I7tav-wuhia5xkmPuvWLdTzGmyAM2m0L37vnDkd5yovjunFHk-LvRaD0fjzRe~VQYkYbKvEGUSBNG94rPl59xPh23-4DiWD4j6MQsx-OzvL-o1G~-xUmQLgXl9f01OLmcYReDB76R059~A7jgI-89quFkZzrlS2A-uWCLt7huTXmTCbB3xSH~L4hl5ULnoBX7IDfQp8FA__",
    "title": "Ride and Play Carnival",
    "category": "Music",
    "place": "Kochi",
    "date": "01 Jan 2025",
    "capacity": "1000",
  },
  {
    "image":
        "https://s3-alpha-sig.figma.com/img/86b3/0155/fd10d08c53c0f0e646716618d9a1a2b1?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=TPYxAEM3sdgrwGP5gIgMoJlug37oy7ZoCFbHzBmhhvrMTb9VAfb-dOzUUCXjsoJs47AJkPn6euIGkO~CI4mqEFDFZIQsQfSx0~DEZiETpQcqpINOyEZ7fniisX3PwO1l~6JrXwnglwgsqIDW2g68NQkNGJrKYJ1JPJi1yfvw17u0jYx00CjdXh9htURQKwMgJaPmupxqO8gX-mzMAPReWHzPlbgN3z-8ppFJEQEPfJKVUPcJnA9jqBenmsVEvy0WIbR3LMu~cUSLfAOUvbKb8L1fYXV-uWoWgWr5r5h~beqsCTGImKFdc2DfZbBq9X93trn71d-NNTcRA52Y2EWPxg__",
    "title": "Vibe Fest",
    "category": "Music",
    "place": "Kochi",
    "date": "01 Jan 2025",
    "capacity": "1000",
  },
  {
    "image":
        "https://s3-alpha-sig.figma.com/img/8d82/cf78/f3e7dc49a2664811cbacb546fcefb443?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZCfUBCpUjCk5aEHhi3R7M~aOzE8jmcGICtPeE6xviGghLDZX1hNSjwVpxaipm-EruwsF3b6lOTW~k7zBBqK238JQscQJQm0JJa9-QtzWjIj0cFSwkQbEYuB6hh3GCewQPKgU7pVPwbnefOB5sR0gtl1mQu8Vm5~ePe9VSEVg38TCOIFgHbFE8Iw7Co877C4xoXTBlW99sjkb9kz1tvbwir9OZU64tDFriW5Dg4nr9bs08cuid3PyHUearREzRenj97sOyDDgFFgTtjFFfs~hSPWUQpb1KrEn8bctE3J9KSa9ev~ULnb~e5n6LtBJPzzsB3XEClPauzukzwRQ~erCrQ__",
    "title": "Soundwave Sessions",
    "category": "Music",
    "place": "Kochi",
    "date": "01 Jan 2025",
    "capacity": "1000",
  },
  {
    "image":
        "https://s3-alpha-sig.figma.com/img/894e/f6b9/4da10115cd97f330af72c923cdbe08fb?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=TzbHD--9xoPuM218KHZW55kvCdnaI4LBC7a8tVtu-GQEBEAcgQx~E3Rq2pWTGYSUgCdKmaeCC5zfiE8Sh4eIIBIayo58ibAe92bXhfA4z-l~bCtbg90UBDgPSyShKJeKR6rDwhpRW4v3m62FTDBMz-KQM6S1su2EFhpuLQlVCy-jMlwfZ8q0PWrYYpXg4e8Ck-dENeHLrbXtarxCl4gng298e~PuD9KnKAcv318Ba1ddKjbybqh16JswH2iyKkYRV7vMUacsZbrMIxOhmU7DH57nHxkq9EBdM2GQiTj3jki8-1Q~FvmFA93yu6GUSpybWIfEBTawbA~7UyC1uuH5-A__",
    "title": "Vibe Fest",
    "category": "Music",
    "place": "Kochi",
    "date": "01 Jan 2025",
    "capacity": "1000",
  },
  {
    "image":
        "https://s3-alpha-sig.figma.com/img/383e/e868/08c36b935bebb41cc95f9015670086d8?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=fhiXKQfOqm1RapvogCowS7Lyv1daoXYAMuSP06~MzxXRnGA4DSFJlIQwiIGDMYZ9OvLhUufAc3tT7Ze9H2lV0MWQDyDW7shgCas3ItepoGDTtaCOlsZKwOeWqSQl5wXvIAaS~V-sqtdEFcvHBn~lLCYzucXe-dPVM5Zrk~UKDhkxiLgL0bKfA7fmm5rw59S5RZXtopSX3bt2UgF~xI338Leblmk89Pma3oTYfAAsARYDKNoWYzTCrTItfaV1SlUlwoC8abf~ko3m1ORzIxRTDFnbOU7SID7hWn4vzbG6vLPjEJOV4VKWs0FpaCybw-avJ45h8tBvGL-wsu3y10KRYg__",
    "title": "Ride and Play Carnival",
    "category": "Music",
    "place": "Kochi",
    "date": "01 Jan 2025",
    "capacity": "1000",
  },
  {
    "image":
        "https://s3-alpha-sig.figma.com/img/3b88/c527/d1662970c96078f2a8f84b58a5f51ab6?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Z7j~4OunCSK~A5wTKE2N1F38arkW0DKXwPuNQsIuWjIVynCcb4vDi726cXy8wYMjMhIEmk5zy~GwdUG-m3OMrIAA9ZO66QMeb0SpCD0XH7LDAdlfiMXsepqxvgVJD2-Pv9R-cSCczyzj4I7tav-wuhia5xkmPuvWLdTzGmyAM2m0L37vnDkd5yovjunFHk-LvRaD0fjzRe~VQYkYbKvEGUSBNG94rPl59xPh23-4DiWD4j6MQsx-OzvL-o1G~-xUmQLgXl9f01OLmcYReDB76R059~A7jgI-89quFkZzrlS2A-uWCLt7huTXmTCbB3xSH~L4hl5ULnoBX7IDfQp8FA__",
    "title": "Ride and Play Carnival",
    "category": "Music",
    "place": "Kochi",
    "date": "01 Jan 2025",
    "capacity": "1000",
  },
  {
    "image":
        "https://s3-alpha-sig.figma.com/img/86b3/0155/fd10d08c53c0f0e646716618d9a1a2b1?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=TPYxAEM3sdgrwGP5gIgMoJlug37oy7ZoCFbHzBmhhvrMTb9VAfb-dOzUUCXjsoJs47AJkPn6euIGkO~CI4mqEFDFZIQsQfSx0~DEZiETpQcqpINOyEZ7fniisX3PwO1l~6JrXwnglwgsqIDW2g68NQkNGJrKYJ1JPJi1yfvw17u0jYx00CjdXh9htURQKwMgJaPmupxqO8gX-mzMAPReWHzPlbgN3z-8ppFJEQEPfJKVUPcJnA9jqBenmsVEvy0WIbR3LMu~cUSLfAOUvbKb8L1fYXV-uWoWgWr5r5h~beqsCTGImKFdc2DfZbBq9X93trn71d-NNTcRA52Y2EWPxg__",
    "title": "Vibe Fest",
    "category": "Music",
    "place": "Kochi",
    "date": "01 Jan 2025",
    "capacity": "1000",
  },
  {
    "image":
        "https://s3-alpha-sig.figma.com/img/8d82/cf78/f3e7dc49a2664811cbacb546fcefb443?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ZCfUBCpUjCk5aEHhi3R7M~aOzE8jmcGICtPeE6xviGghLDZX1hNSjwVpxaipm-EruwsF3b6lOTW~k7zBBqK238JQscQJQm0JJa9-QtzWjIj0cFSwkQbEYuB6hh3GCewQPKgU7pVPwbnefOB5sR0gtl1mQu8Vm5~ePe9VSEVg38TCOIFgHbFE8Iw7Co877C4xoXTBlW99sjkb9kz1tvbwir9OZU64tDFriW5Dg4nr9bs08cuid3PyHUearREzRenj97sOyDDgFFgTtjFFfs~hSPWUQpb1KrEn8bctE3J9KSa9ev~ULnb~e5n6LtBJPzzsB3XEClPauzukzwRQ~erCrQ__",
    "title": "Soundwave Sessions",
    "category": "Music",
    "place": "Kochi",
    "date": "01 Jan 2025",
    "capacity": "1000",
  },
];
