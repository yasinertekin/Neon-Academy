enum ImageEnum {
  appBarImage,
  neonAppsLogo,
}

extension ImageEnumExtension on ImageEnum {
  String get value {
    switch (this) {
      case ImageEnum.appBarImage:
        return 'https://images.unsplash.com/photo-1546961329-78bef0414d7c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHVzZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=900&q=60';
      case ImageEnum.neonAppsLogo:
        return 'https://media.licdn.com/dms/image/C560BAQHqsDVjpvpZrA/company-logo_200_200/0/1649672997365/neon_apps_logo?e=1716422400&v=beta&t=DL4NtxakibJSNAVP6EAzi8ycy661JQjsaKgxUJcHwNc';
    }
  }
}
