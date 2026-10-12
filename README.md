# Network Performance Analysis
An end-to-end data analytics project that analyzes network logs to identify latency, packet loss, and recurring network-performance degradation across network nodes and time periods.
Project Overview
Network performance can vary by node and time of day. High latency may slow communication, while packet loss can interrupt or degrade data transmission. This project uses Python, MySQL, and Power BI to explore network logs, compare node performance, and identify time windows that deserve further investigation.
Objectives
- Inspect and clean network log data.
- Analyze latency and packet-loss metrics.
- Create time-based features from timestamps.
- Summarize degradation by hour, weekday and hour, and node and hour.
- Store log data and summary tables in MySQL.
- Use SQL queries to compare network nodes and identify high-value periods.
- Present findings through a Power BI dashboard.
Tools and Technologies
- Python: pandas, NumPy, Matplotlib
- Database: MySQL
- Visualization: Microsoft Power BI
- Data formats: CSV, SQL, Jupyter Notebook, Power BI report
Dataset
The supplied notebook reports 43,200 network-log records across 5 network nodes, with 8,640 records per node.
Main log fields:
Field	Description
timestamp	Date and time of the network log
node	Network node identifier
latency_ms	Recorded latency in milliseconds
packet_loss_pct	Recorded packet loss percentage


Supporting summary datasets:
- summary_hourly.csv — degradation summary by hour
- summary_weekday_hour.csv — degradation summary by weekday and hour
- summary_node_hour.csv — degradation summary by node and hour
Dataset note: the degradation summaries appear to use different numeric scales. Verify the calculation and units of is_degraded before comparing these summaries directly or presenting every value as a percentage.

Project Workflow
1. Data inspection: Load the CSV files and review columns, data types, missing values, duplicates, and descriptive statistics.
2. Data cleaning: Handle missing metric values, convert numeric columns, and parse timestamps.
3. Feature engineering: Derive date, hour, weekday, month, and year fields from timestamps.
4. Analysis: Calculate latency and packet-loss statistics and compare metrics by node.
5. Time-based summaries: Examine degradation by hour, weekday-hour, and node-hour.
6. SQL analysis: Store data and query node-level metrics and high-degradation periods.
7. Power BI reporting: Visualize KPIs, node comparisons, hourly trends, and time-based degradation patterns.
Key Findings
Based on the supplied notebook outputs:
- Total network log records: 43,200
- Number of network nodes: 5
- Average latency: 38.87 ms
- Median latency: 31.62 ms
- Maximum recorded latency: 428.05 ms
- Average packet loss: 0.443%
- Maximum recorded packet loss: 17.59%
- node-2-chennai has the highest average latency at approximately 49.80 ms.
- node-4-delhi has the next-highest average latency at approximately 46.96 ms.
- node-1-mumbai has the highest average packet loss among the listed nodes at approximately 0.532%.
- The hourly degradation summary highlights 19:00–20:00 as an important period to investigate.
These results indicate where further investigation may be useful; they do not, by themselves, prove the cause of network degradation.
MySQL
The SQL script creates a database named network and defines these tables:
- network_logs
- summary_hourly
- summary_weekday_hour
- summary_node_hour
The queries inspect record counts, calculate average latency and packet loss by node, list the highest-latency and highest-packet-loss records, and rank degradation summaries.
To run the SQL:
1. Open MySQL Workbench or your preferred MySQL client.
2. Execute the SQL script in network sql.sql.
3. Load the relevant CSV data into the corresponding tables if it is not already loaded.
4. Run the analytical queries to inspect the results.
Power BI Dashboard Suggestions
The dashboard can include:
- KPI cards for total records, average latency, average packet loss, maximum latency, and maximum packet loss.
- Average latency and packet loss by node.
- Hourly degradation trend.
- Weekday-versus-hour degradation heatmap.
- Node-versus-hour degradation heatmap.
- Filters for node, weekday, date, and hour where available.
Open the supplied .pbix file in Microsoft Power BI Desktop to view or continue editing the dashboard.
Repository Structure
A suggested GitHub repository layout:
Network-Performance-Analysis/
├── README.md
├── Network_Performance_Task_Sheet.xlsx
├── network.ipynb
├── network sql.sql
└── network BI.pbix
Use the exact filenames that you upload to your repository. If you rename any files, update the instructions and links in this README accordingly.
How to Run
Python notebook
1. Install Python and Jupyter Notebook, or use an environment that supports .ipynb files.
2. Install the libraries used by the notebook, if needed:
   pip install pandas numpy matplotlib jupyter
3. Place the required CSV files in the paths expected by the notebook, or update the notebook paths.
4. Open and run network.ipynb from top to bottom.
SQL
1. Open network sql.sql in MySQL Workbench.
2. Execute the database and table creation statements.
3. Import the relevant data into the tables.
4. Run the analysis queries.
Power BI
1. Open network BI.pbix in Power BI Desktop.
2. If prompted, update data-source paths or credentials.
3. Refresh the data to update visuals.
Recommendations
- Investigate node-2-chennai and node-4-delhi for elevated average latency.
- Review node-1-mumbai for packet-loss spikes.
- Monitor the 19:00–20:00 period and check whether the pattern repeats across additional dates.
- Standardize the is_degraded calculation and scale across all summary datasets.
- Validate timestamps, missing-value handling, row counts, and refresh behavior after loading the data.
Limitations
- The findings are based on the supplied dataset and notebook outputs.
- High latency or packet loss does not identify its root cause without additional network diagnostics.
- The is_degraded scale should be validated before cross-table comparisons.
- Reproducing the notebook requires the input CSV files and matching file paths.
Author
Name: Add your name here
Project: Network Performance Analysis
Technologies: Python | MySQL | Power BI
<img width="960" height="542" alt="Screenshot 2026-10-12 161217" src="https://github.com/user-attachments/assets/b4318e63-4c67-420c-a70d-02d40fd3cfc6" />
