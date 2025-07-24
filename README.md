# הרצת הפרוייקט

על מנת להריץ את השרת מבלי להצטרך לפתוח את סביבת הפיתוח כמנהל, ניתן לאפשר גישה לפורט רצוי (במקרה שלנו, פורט 5000) בעזרת פתיחת שורת המשימות כמנהל והרצת הפקודה:

## תנאים מוקדמים
- התקינו את [VS Code](https://code.visualstudio.com/download)
- התקינו את [NET Framework.](https://dotnet.microsoft.com/en-us/download)
- התקינו את [git](https://git-scm.com/downloads/win)
- התקינו TypeScript בהרצת הפקודות:
```
powershell -c "irm bun.sh/install.ps1 | iex"
bun add -g typescript
```
- תנו לתוכנה גישה לפורט הרצוי (במקרה שלנו, פורט 5000) בפתיחת שורת המשימות כמנהל והרצת הפקודה:
```
netsh http add urlacl url=http://*:5000/ user=Everyone
```

## יצירת פרוייקט חדש
- בחלק העליון של העמוד, לחצו על הכפתור הירוק עליו כתוב "Use this template" ואז על "Create a new Repository", בחרו שם לפרוייקט ולחצו "Create repository".
- נשבט את הפרוייקט החדש שיצרנו בכך שנעתיק את כתובת האתר שלו, נפתח את ה-Command Pallate ב-VS Code, נבחר באפשרות "git: Clone" ונדביק את הכתובת שהעתקנו.

## הרצת הפרוייקט
פתחו את הפרוייקט ב-VS Code והריצו בעזרת הפקודה:
```
dotnet run
```

## העלאת הפרוייקט האישי ל-fly.io
- החליפו את השורה
```
int port = 5000;
```
בשורה
```
var port = Environment.GetEnvironmentVariable("PORT") ?? "5000";
```
- וודאו ששם הקובץ עם הסיומת "csproj" תואם את שם הפרוייקט שלכם (שם התיקייה).
- החליפו את הקובץ Utilities.cs בקובץ Utilities.ts הנמצא בפרוייקט זה.
- הוסיפו את הקבצים Dockerfile, ו-fly.toml הנמצאים בפרוייקט זה. החליפו את השמות "MyBookList" ו-"my-book-list" בשם הפרוייקט שלכם.
- התקינו את [Podman](https://podman.io)
- הריצו
```
podman build -t your-project-name .
```
- התקינו את [flyctl](https://fly.io/docs/flyctl/install)
- צרו משתמש fly.io בהרצת הפקודה:
```
flyctl auth signup
```
- התחברו למשתמש fly.io בהרצת הפקודה:
```
flyctl auth login
```
- צרו volumes לאחסון ה-database בהרצת הפקודה:
```
flyctl volumes create data --region iad --size 1 --count 2
```
- עשו deploy לפרוייקט בהרצת הפקודה:
```
flyctl deploy
```
- וזהו! כתובת האתר תודפס לאחר סיום ה-deployment.
