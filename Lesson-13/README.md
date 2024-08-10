# Lesson-13

19 - Lesson-13 -  Автозаполнение Переменных - tfvars


Названия должны быть (для автоматического запуска):
```bash
terraform.tfvars
или
prod.auto.tfvars
dev.auto.tfvars
```

```bash
instance_type              = "t3.micro"
allow_ports                = ["80", "443", "22", "8080"]
enable_detailed_monitoring = false

common_tags = {
  Owner       = "Oleg Filatov"
  Project     = "Phoenix"
  Environment = "development"
}
```

Запуск с отдельными файлами tfvars (могут называться, кау угодно, главное с расширением .tfvars)
```bash
terraform plan -var-file="prod.tfvars"
```
или:
```bash
terraform plan -var-file="dev.tfvars"
```