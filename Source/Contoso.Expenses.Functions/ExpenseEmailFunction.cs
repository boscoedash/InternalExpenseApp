using System;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Host;
using Newtonsoft.Json;
using SendGrid;
using SendGrid.Helpers.Mail;

namespace Contoso.Expenses.Functions
{
    public static class ExpenseEmailFunction
    {
        [FunctionName("ExpenseEmailFunction")]
        public static void Run([QueueTrigger("contosoexpenses", Connection = "StorageConnectionString")]string expenseItem, TraceWriter log,
                                [SendGrid] out SendGridMessage message)
        {
            var expense = JsonConvert.DeserializeObject<ExpenseExtended>(expenseItem);

            var emailFrom = "Expense@ContosoExpenses.com";
            var emailTo = expense.ApproverEmail;
            var emailSubject = $"New Expense for the amount of ${expense.Amount} submitted";
            var emailBody = $"Hello {expense.Approver}, <br/> New Expense report submitted for the purpose of: {expense.Purpose}. <br/> Please review as soon as possible. <br/> <br/> <br/> This is a auto generated email, please do not reply to this email";

            log.Info($"Email Subject: {emailSubject}");
            log.Info($"Email body: {emailBody}");

            message = new SendGridMessage();
            message.From = new EmailAddress(emailFrom, "Contoso Expenses");
            message.AddTo(emailTo, expense.Approver);
            message.Subject = emailSubject;
            message.AddContent(MimeType.Html, emailBody);

            log.Info($"Email sent successfully to: {emailTo}");
        }
    }

    public class ExpenseExtended
    {
        public int ExpenseId { get; set; }
        public string Purpose { get; set; }
        public Nullable<System.DateTime> Date { get; set; }
        public string Cost_Center { get; set; }
        public Nullable<double> Amount { get; set; }
        public string Approver { get; set; }
        public string Receipt { get; set; }
        public string ApproverEmail { get; set; }
    }
}
