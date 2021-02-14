BACKUP DATABASE SoftUni TO DISK = 'Desktop\softuni-backup.bak'

DROP DATABASE SoftUni

RESTORE DATABASE SoftUni FROM DISK = 'Desktop\Softuni-backup.bak'