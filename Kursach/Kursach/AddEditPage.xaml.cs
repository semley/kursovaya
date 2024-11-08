using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Kursach
{
    /// <summary>
    /// Логика взаимодействия для AddEditPage.xaml
    /// </summary>
    public partial class AddEditPage : Page
    {
        private Faculty _currentServise = new Faculty();

        public bool a = false;

        public AddEditPage(Faculty SelectedService)
        {
            InitializeComponent();
            if (SelectedService != null)
            {
                a = true;
                _currentServise = SelectedService;
            }

            DataContext = _currentServise;
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();

            if (string.IsNullOrWhiteSpace(_currentServise.Faculty_name))
            {
                errors.AppendLine("Укажите название факультета");
            }
            if (string.IsNullOrWhiteSpace(_currentServise.FIO_decan))
            {
                errors.AppendLine("Укажите ФИО декана");
            }
            if (string.IsNullOrWhiteSpace(_currentServise.Phone))
            {
                errors.AppendLine("Укажите номер телефона");
            }
            if (string.IsNullOrWhiteSpace(_currentServise.Num_room))
            {
                errors.AppendLine("Укажите номер кабинета");
            }
            if (string.IsNullOrWhiteSpace(_currentServise.Phone) || !Regex.IsMatch(_currentServise.Phone, @"^\d{11}$")) // Проверка на 11 цифр
            {
                errors.AppendLine("Укажите номер телефона, состоящий из 11 цифр");
            }

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            var allServices = Semenova_UniversityKursachEntities.GetContext().Faculty.ToList();

            // Фильтруем по имени факультета, исключая текущий факультет (при редактировании)
            allServices = allServices.Where(p => p.Faculty_name == _currentServise.Faculty_name && p.Faculty_ID != _currentServise.Faculty_ID).ToList();

            // Проверяем, есть ли уже факультет с таким именем, кроме текущего (при редактировании)
            if (allServices.Count == 0 || _currentServise.Faculty_ID != 0)
            {
                if (_currentServise.Faculty_ID == 0)
                {
                    // Находим максимальный ID существующего факультета:
                    int maxId = Semenova_UniversityKursachEntities.GetContext().Faculty.Max(f => f.Faculty_ID);
                    // Увеличиваем максимальный ID на 1, чтобы получить новый ID:
                    _currentServise.Faculty_ID = maxId + 1;
                    Semenova_UniversityKursachEntities.GetContext().Faculty.Add(_currentServise);
                }
                else
                {
                    // Обновление существующего факультета
                    Semenova_UniversityKursachEntities.GetContext().Entry(_currentServise).State = EntityState.Modified;
                }
                // 3. Добавляем новый факультет в базу данных или обновляем существующий:
                

                try
                {
                    Semenova_UniversityKursachEntities.GetContext().SaveChanges();
                    MessageBox.Show("Информация сохранена");
                    Manager.MainFrame.GoBack();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
            else
            {
                MessageBox.Show("Уже существует такой факультет");
            }
        }

        private void ChangePictureBtn_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog myOpenFileDialog = new OpenFileDialog();
            if (myOpenFileDialog.ShowDialog() == true)
            {
                _currentServise.Image = myOpenFileDialog.FileName;
                LogoImage.Source = new BitmapImage(new Uri(myOpenFileDialog.FileName));
            }
        }
    }
}
