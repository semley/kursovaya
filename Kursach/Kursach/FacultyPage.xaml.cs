using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
    /// Логика взаимодействия для PulpitPage.xaml
    /// </summary>
    public partial class FacultyPage : Page
    {
        public bool a = false;
        int CountRecords;
        int CountPage;
        int CurrentPage;
        List<Faculty> CurrentPageList = new List<Faculty>();
        List<Faculty> TableList;

        public int vsecurrentProductCount = Semenova_UniversityKursachEntities.GetContext().Faculty.Count();
        public FacultyPage()
        {
            InitializeComponent();
            var currentServices = Semenova_UniversityKursachEntities.GetContext().Faculty.ToList();
            ServiceListView.ItemsSource = currentServices;
            Update();
        }


        public void Update()
        {
            var currentServices = Semenova_UniversityKursachEntities.GetContext().Faculty.ToList();

            if (SortBox.SelectedIndex == 1)
            {
                currentServices = currentServices.OrderBy(p => p.Faculty_name).ToList();
            }
            else if (SortBox.SelectedIndex == 2)
            {
                currentServices = currentServices.OrderByDescending(p => p.Faculty_name).ToList();
            }

            if (FiltrBox.SelectedIndex == 0)
            {
                currentServices = currentServices.Where(p => (p.PulpitCount >= 0 )).ToList();
            }
            if (FiltrBox.SelectedIndex == 1)
            {
                currentServices = currentServices.Where(p => (p.PulpitCount >= 0 && p.PulpitCount < 3)).ToList();
            }
            if (FiltrBox.SelectedIndex == 2)
            {
                currentServices = currentServices.Where(p => (p.PulpitCount >= 3 && p.PulpitCount < 6)).ToList();
            }
            if (FiltrBox.SelectedIndex == 3)
            {
                currentServices = currentServices.Where(p => (p.PulpitCount >= 6)).ToList();
            }

            currentServices = currentServices.Where(p => p.Faculty_name.ToLower().Contains(TBoxSearch.Text.ToLower())).ToList();
            ServiceListView.ItemsSource = currentServices;


            ServiceListView.ItemsSource = currentServices;
            int currentProductCount = currentServices.Count();
            vsecurrentProductCount = Semenova_UniversityKursachEntities.GetContext().Faculty.Count();
            CountTB.Text = "кол-во " + (currentProductCount).ToString() + " из " + (vsecurrentProductCount).ToString();



            

        }



        private void TBoxSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void FiltrBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void SortBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }



        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            a = false;
            Manager.MainFrame.Navigate(new AddEditPage(null));
        }

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            a = true;
            Manager.MainFrame.Navigate(new AddEditPage((sender as Button).DataContext as Faculty));
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            var currentService = (sender as Button).DataContext as Faculty;

            var currentClientServices = Semenova_UniversityKursachEntities.GetContext().Pulpit.ToList();
            currentClientServices = currentClientServices.Where(p => p.Pulpit_ID == currentService.Faculty_ID).ToList();

            if (currentClientServices.Count > 0)
                MessageBox.Show("Невозможно выполнить удаление, так как существуют кафедры на факультете");
            else
            {
                if (MessageBox.Show("Вы точно хотите выполнить удаление?", "Внимание!",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                {
                    try
                    {
                        Semenova_UniversityKursachEntities.GetContext().Faculty.Remove(currentService);
                        Semenova_UniversityKursachEntities.GetContext().SaveChanges();
                        ServiceListView.ItemsSource = Semenova_UniversityKursachEntities.GetContext().Faculty.ToList();
                        Update();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message.ToString());
                    }
                }

            }
        }
            



        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                Semenova_UniversityKursachEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                ServiceListView.ItemsSource = Semenova_UniversityKursachEntities.GetContext().Faculty.ToList();
            }
            Update();
        }

        
    }
}
