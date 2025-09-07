using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;

namespace job_number_check.Models
{
    public class DataBase
    {
        readonly SQLiteAsyncConnection database;

        public DataBase(string dbPath)
        {
            database = new SQLiteAsyncConnection(dbPath);

            //database.DropTableAsync<WorkItem>().Wait();
            //database.DropTableAsync<Worksheet>().Wait();

            database.CreateTableAsync<WorkItem>().Wait();
            database.CreateTableAsync<Worksheet>().Wait();
        }
        //public Task<List<WorkItem>> GetExtrasAsync(string prjId)
        //{
        //    //Get all Quote.
        //    return database.Table<WorkItem>().Where(x => x.ProjectId == prjId).ToListAsync();
        //}

        public Task<WorkItem> GetExtraAsync(string myid)
        {
            // Get a specific note.
            return database.Table<WorkItem>()
                            .Where(i => i.MyId == myid)
                            .FirstOrDefaultAsync();
        }
        public Task<List<WorkItem>> GetExtrasAsync()
        {
            //Get all Quote.
            return database.Table<WorkItem>().ToListAsync();
        }

        public async Task<int> SaveExtraAsync(WorkItem note)
        {
            if (note.ID != 0)
            {
                // Update an existing note.
                await database.UpdateAsync(note);
            }
            else
            {
                // Save a new note.
                await database.InsertAsync(note);
            }
            return note.ID;
        }

        public Task<int> DeleteExtraAsync(WorkItem note)
        {
            // Delete a note.
            return database.DeleteAsync(note);
        }

        public Task<List<Worksheet>> GetWorksheetsAsync()
        {
            //Get all Quote.
            return database.Table<Worksheet>().ToListAsync();
        }
        public async Task<int> SaveWorksheetAsync(Worksheet note)
        {
            if (note.ID != 0)
            {
                // Update an existing note.
                await database.UpdateAsync(note);
            }
            else
            {
                // Save a new note.
                await database.InsertAsync(note);
            }
            return note.ID;
        }
    }
}
