using QuestPDF.Infrastructure;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using QuestPDF.Fluent;
using QuestPDF.Helpers;

namespace job_number_check.Models
{
    public class InvoiceDocument : IDocument
    {
        public InvoiceModel Model { get; }

        public InvoiceDocument(InvoiceModel model)
        {
            Model = model;
        }

        public DocumentMetadata GetMetadata() => DocumentMetadata.Default;

        public void Compose(IDocumentContainer container)
        {
            container
                .Page(page =>
                {
                    page.Margin(50);

                    page.Header().Element(ComposeHeader);
                    page.Content().Element(ComposeContent);

                    //page.Footer().AlignCenter().Text(text =>
                    //{
                    //    text.CurrentPageNumber();
                    //    text.Span(" / ");
                    //    text.TotalPages();
                    //});
                });
        }

        void ComposeHeader(QuestPDF.Infrastructure.IContainer container)
        {
            container.Row(row =>
            {
                row.RelativeItem().Column(column =>
                {
                    column
                        .Item().Text($"Invoice #{Model.InvoiceNumber}")
                        .FontSize(20).SemiBold().FontColor(QuestPDF.Helpers.Colors.Blue.Medium);

                    column.Item().Text(text =>
                    {
                        text.Span("Issue date: ").SemiBold();
                        text.Span($"{Model.IssueDate:d}");
                    });

                    //column.Item().Text(text =>
                    //{
                    //    text.Span("Due date: ").SemiBold();
                    //    text.Span($"{Model.DueDate:d}");
                    //});
                });

                //row.ConstantItem(175).Image(LogoImage);
            });
        }

        void ComposeContent(QuestPDF.Infrastructure.IContainer container)
        {
            container.PaddingVertical(40).Column(column =>
            {
                column.Spacing(20);

                column.Item().Row(row =>
                {
                    row.RelativeItem().Component(new AddressComponent("From", Model.SellerAddress));
                    row.ConstantItem(50);
                    row.RelativeItem().Component(new AddressComponent("For", Model.CustomerAddress));
                });

                column.Item().Element(ComposeTable);

                var totalPrice = Model.Items.Sum(x => x.Value * 3); //////////////////////////////////////////////////////
                column.Item().PaddingRight(5).AlignRight().Text($"Grand total: {totalPrice:C}").SemiBold();

                //if (!string.IsNullOrWhiteSpace(Model.Comments))
                //    column.Item().PaddingTop(25).Element(ComposeComments);
            });
        }

        void ComposeTable(QuestPDF.Infrastructure.IContainer container)
        {
            var headerStyle = TextStyle.Default.SemiBold();

            container.Table(table =>
            {
                table.ColumnsDefinition(columns =>
                {
                    //columns.ConstantColumn(25);
                    //columns.ConstantColumn(40);
                    columns.RelativeColumn(4);
                    columns.RelativeColumn();
                    //columns.RelativeColumn();
                });

                table.Header(header =>
                {
                    //header.Cell().Text("#");
                    //header.Cell().Text("QTY").Style(headerStyle);
                    header.Cell().AlignLeft().Text("DESCRIPTION").Style(headerStyle);
                    //header.Cell().AlignRight().Text("UNIT PRICE").Style(headerStyle);
                    header.Cell().AlignRight().Text("Line Total").Style(headerStyle);

                    header.Cell().ColumnSpan(2).PaddingTop(5).BorderBottom(1).BorderColor(QuestPDF.Helpers.Colors.Black);
                });

                foreach (var item in Model.Items)
                {
                    var index = Model.Items.IndexOf(item) + 1;

                    table.Cell().Element(CellStyle).PaddingLeft(10).AlignLeft().Text($"{item.JobPlan:C}");

                    table.Cell().Element(CellStyle).AlignRight().Text($"{3 * item.Value:C}"); //////////////////////////////////////

                    static QuestPDF.Infrastructure.IContainer CellStyle(QuestPDF.Infrastructure.IContainer container) => container.BorderBottom(1).BorderColor(Colors.Grey.Lighten2).PaddingVertical(5);
                }
            });
        }

        //void ComposeComments(IContainer container)
        //{
        //    container.ShowEntire().Background(Colors.Grey.Lighten3).Padding(10).Column(column => 
        //    {
        //        column.Spacing(5);
        //        column.Item().Text("Comments").FontSize(14).SemiBold();
        //        column.Item().Text(Model.Comments);
        //    });
        //}
    }

    public class AddressComponent : IComponent
    {
        private string Title { get; }
        private Address Address { get; }

        public AddressComponent(string title, Address address)
        {
            Title = title;
            Address = address;
        }

        public void Compose(QuestPDF.Infrastructure.IContainer container)
        {
            container.ShowEntire().Column(column =>
            {
                column.Spacing(2);

                column.Item().Text(Title).SemiBold();
                column.Item().PaddingBottom(5).LineHorizontal(1);

                column.Item().Text(Address.CompanyName);
                column.Item().Text(Address.Street);
                column.Item().Text($"{Address.City}");
                column.Item().Text(Address.Mobile);
                column.Item().Text(Address.Email);
                column.Item().Text(Address.Vat);
            });
        }
    }
}